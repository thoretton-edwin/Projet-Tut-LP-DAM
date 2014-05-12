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
@property BOOL searchIsActive;
@end




@implementation FormationListViewController
@synthesize searchController;
@synthesize searchData;
@synthesize searchBar;
@synthesize searchIsActive;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

// affiche les resultats, ferme la searchBar
-(void)searchBarSearchButtonClicked:(UISearchBar *)_searchBar
{
	NSLog(@"search button");
	[searchBar resignFirstResponder];
	self.navigationItem.titleView=nil;
	
}

//ferme la searchBar, pas d'affichage des resultats
-(void)searchBarCancelButtonClicked:(UISearchBar *)_searchBar
{
	NSLog(@"cancel button");
	//[searchBar setShowsCancelButton: NO animated: YES];
	searchIsActive = NO;
	searchBar.text=@"";
	[searchBar resignFirstResponder];
	self.navigationItem.titleView=nil;
	[self changeDegree:_mDegreeSelector];
	
}
/*
- (void) searchBarTextDidBeginEditing: (UISearchBar*) _searchBar
{[searchBar setShowsCancelButton: YES animated: YES];}
*/

//gestion du bouton recherche
-(void)actionSearch
{
	NSLog(@"action search");
	if(!self.navigationItem.titleView)
	{
		self.navigationItem.titleView = searchBar;
		searchIsActive=YES;
	}
	else
	{
		[self searchBarCancelButtonClicked:searchBar];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Formations";
	
	
	//init searchBar
	searchData = [[NSMutableArray alloc]init];
	
			
	int width = [UIScreen mainScreen].bounds.size.width;
	int y = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
	
	searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,y,width,50)];
	searchBar.delegate = self;
	searchController = [[UISearchDisplayController alloc]
						initWithSearchBar:searchBar contentsController:self];
	
	[searchBar sizeToFit];
	
	searchController.delegate = self;
	searchController.searchResultsDataSource = self;
	searchController.searchResultsDelegate = self;
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
											  initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
											  target:self
											  action:@selector(actionSearch)];
	

    
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
    
	int height = [UIScreen mainScreen].bounds.size.height - y - _mDegreeSelector.frame.size.height;
    CGRect fr = CGRectMake(0,y,self.view.frame.size.width,height);
    
    tableView = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
	
    [tableView reloadData];
    [self.view addSubview: tableView];
	//[tableView sizeToFit];
    
    [_mDegreeSelector addTarget:self
                                action:@selector(changeDegree:)
                      forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
				
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
			NSLog(@"word  : %@",element);
			bestRange = range.length;
			[searchData addObject:element];
		}
		
		
		
    }
	[tableView reloadData];
    return YES;
}

- (void) changeDegree:(UISegmentedControl *)paramSender{

	NSLog(@"selection");
	searchIsActive = NO;
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
	if(searchIsActive)
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
	if(searchIsActive)
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
