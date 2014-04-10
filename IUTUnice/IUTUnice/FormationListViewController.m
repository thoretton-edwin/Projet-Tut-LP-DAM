//
//  FormationListViewController.m
//  IUTUnice
//
//  Created by VM Mac on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "FormationListViewController.h"

@interface FormationListViewController ()

@end

@implementation FormationListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Formations";
    
    //select design
	_mDegreeSelector.clipsToBounds=YES;
	_mDegreeSelector.layer.cornerRadius=6.0;
	_mDegreeSelector.layer.borderColor=[UIColor grayColor].CGColor;
	_mDegreeSelector.layer.borderWidth=2.0;
	_mDegreeSelector.contentMode = UIViewContentModeCenter;
	_mDegreeSelector.backgroundColor=nil;
	_mDegreeSelector.tintColor = [UIColor grayColor];
    
    _mFormationArray = [[NSMutableArray alloc] init];
    
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
    
    CGRect fr = CGRectMake(0,108,self.view.frame.size.width,344);
    
    tableView = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    [self.view addSubview: tableView];
    
    [_mDegreeSelector addTarget:self
                                action:@selector(changeDegree:)
                      forControlEvents:UIControlEventValueChanged];
    
    _mFilteredArray = [NSMutableArray arrayWithCapacity:[_mDisplayedArray count]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [_mFilteredArray removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.mTitle contains[c] %@",searchText];
    _mFilteredArray = [NSMutableArray arrayWithArray:[_mDisplayedArray filteredArrayUsingPredicate:predicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
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
    return [_mDisplayedArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [[_mDisplayedArray objectAtIndex:indexPath.row] getId];
    
    UITableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.backgroundView = [[UIView alloc] init];
    [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.textLabel.frame = CGRectMake(0,0,400,30);
    cell.textLabel.numberOfLines = 3;
    //cell.textLabel.text = [[_mDisplayedArray objectAtIndex: indexPath.row] getTitle];
    
    if (self->tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [[_mFilteredArray objectAtIndex: indexPath.row] getTitle];
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
