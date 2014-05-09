//
//  FormationListViewController.m
//  IUTUnice
//
//  Created by VM Mac on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "FormationListViewController.h"

@interface FormationListViewController ()
@property UISearchDisplayController* searchController;
@property NSMutableArray *searchData;
@property UISearchBar *searchBar;

@end




@implementation FormationListViewController
@synthesize searchController;
@synthesize searchData;
@synthesize searchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"search button");
	[searchController setActive:NO];
	[searchBar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"cancel button");
	[searchController setActive:NO];
	[searchBar setShowsCancelButton: NO animated: YES];
	[searchBar resignFirstResponder];
}

- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar
{
    [searchBar setShowsCancelButton: YES animated: YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Formations";
	
	
	//search init
	searchData = [[NSMutableArray alloc]init];
	searchController = [[UISearchDisplayController alloc]
						initWithSearchBar:searchBar contentsController:self];
			
	int width = [UIScreen mainScreen].bounds.size.width;
	int y = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
	
	searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,y,width,50)];
	searchBar.delegate = self;
	[self.view addSubview:searchBar];
	[searchBar sizeToFit];
	
	searchController.delegate = self;
	searchController.searchResultsDataSource = self;
	searchController.searchResultsDelegate = self;
	//searchController.displaysSearchBarInNavigationBar = YES;
	searchController.searchResultsTitle=@"titre";
	self.navigationController.title=@"titre2";
    
    //select design
	_mDegreeSelector.clipsToBounds=YES;
	_mDegreeSelector.layer.cornerRadius=6.0;
	_mDegreeSelector.layer.borderColor=[UIColor grayColor].CGColor;
	_mDegreeSelector.layer.borderWidth=2.0;
	_mDegreeSelector.contentMode = UIViewContentModeCenter;
	_mDegreeSelector.backgroundColor=nil;
	_mDegreeSelector.tintColor = [UIColor grayColor];
    
    _mFormationArray = [[NSMutableArray alloc] init];
    _mFilteredArray = [[NSMutableArray alloc] init];
    
    dispatch_queue_t queue = dispatch_queue_create("com.yourdomain.yourappname", NULL);
    dispatch_async(queue, ^{
        //code to be executed in the background
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iut.unice.fr/api/formations"]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *jsonParsingError = nil;
        NSArray *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                                  options:0 error:&jsonParsingError];
        for(int i=0; i<[publicTimeline count];i++)
        {
            self.formation = [publicTimeline objectAtIndex:i];
            Formation *lFormation = [[Formation alloc] initWithId:[self.formation objectForKey:@"id"] withType:[self.formation objectForKey:@"type_code"] withTitle:[self.formation objectForKey:@"title"]];
            [lFormation setBody:[self.formation objectForKey:@"body"]];
            
            [_mFormationArray addObject: lFormation];
            
        }
        _mDisplayedArray = [[NSMutableArray alloc] initWithArray:_mFormationArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            //code to be executed on the main thread when background task is finished
            [tableView reloadData];
        });
    });
    
	int height = [UIScreen mainScreen].bounds.size.height - searchBar.frame.size.height - y - _mDegreeSelector.frame.size.height;
    CGRect fr = CGRectMake(0,y+50,self.view.frame.size.width,height);
    
    tableView = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
	[tableView sizeToFit];
    [tableView reloadData];
    [self.view addSubview: tableView];
    
    [_mDegreeSelector addTarget:self
                                action:@selector(changeDegree:)
                      forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    NSLog(@"%@", @"SAERCHING");
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    _mFilteredArray = (NSMutableArray*) [_mFormationArray filteredArrayUsingPredicate:resultPredicate];
}
*/

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
/*
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
													 */
				
	[searchData removeAllObjects];
	NSLog(@"search string : %@",searchString);
	
    NSString *word=@"";
	int bestRange=1;
	Formation *element;
	
    for(element in _mDisplayedArray) //take the n group (eg. group1, group2, group3)
						  //in the original data
    {
		
		NSRange range = [[element getTitle] rangeOfString:searchString
									options:NSCaseInsensitiveSearch];
		/*
		 searchString = [searchString lowercaseString];
		 if([searchString isEqual:word])[searchData addObject:word];
		 */
		
		
		if(range.length>=bestRange)
		{
				//NSLog(@"range : %d",range.length);
			NSLog(@"word  : %@",word);
			bestRange = range.length;
			[searchData addObject:element];
		}
		
		
		
    }
    return YES;
}

- (void) changeDegree:(UISegmentedControl *)paramSender{
    [_mDisplayedArray removeAllObjects];
    
    if (_mDegreeSelector.selectedSegmentIndex == 0){
        for (int i = 0; i < [_mFormationArray count]; i++) {
            if([[[_mFormationArray objectAtIndex:i]getType]  isEqual: @"DUT"])
                [_mDisplayedArray addObject:[_mFormationArray objectAtIndex:i]];
        }
        
    }
    else if (_mDegreeSelector.selectedSegmentIndex == 1){
        for (int i = 0; i < [_mFormationArray count]; i++) {
            if([[[_mFormationArray objectAtIndex:i]getType]  isEqual: @"LP"])
                [_mDisplayedArray addObject:[_mFormationArray objectAtIndex:i]];
        }
    }
    else{
        for (int i = 0; i < [_mFormationArray count]; i++) {
            if([[[_mFormationArray objectAtIndex:i]getType]  isEqual: @"DU"])
                [_mDisplayedArray addObject:[_mFormationArray objectAtIndex:i]];
        }
    }
    [tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //if (self->tableView == self.searchDisplayController.searchResultsTableView)
	if(self.searchController.isActive)
	{
        return [searchData count];
    } else {
        return [_mDisplayedArray count];
    }
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [[_mDisplayedArray objectAtIndex:indexPath.row] getId];
    
    UITableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.backgroundView = [[UIView alloc] init];
    [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
	cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    cell.textLabel.frame = CGRectMake(0,0,400,30);
    cell.textLabel.numberOfLines = 3;
    
    //if (self->tableView == self.searchDisplayController.searchResultsTableView)
	if(self.searchController.isActive)
	{
        cell.textLabel.text = [[searchData objectAtIndex: indexPath.row] getTitle];
    } else {
        cell.textLabel.text = [[_mDisplayedArray objectAtIndex: indexPath.row] getTitle];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FormationDetailViewController *anotherViewController=[[FormationDetailViewController alloc]   initWithNibName:@"FormationDetailViewController" bundle:nil];
    anotherViewController.htmlBody = [[_mFormationArray objectAtIndex: indexPath.row] getBody];
    [self.navigationController pushViewController:anotherViewController animated:YES];
    
}

@end
