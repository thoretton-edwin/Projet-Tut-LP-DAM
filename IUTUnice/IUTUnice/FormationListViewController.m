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
        self.title = @"Formations";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //select design
	_mDegreeSelector.clipsToBounds=YES;
	_mDegreeSelector.layer.cornerRadius=6.0;
	_mDegreeSelector.layer.borderColor=[UIColor grayColor].CGColor;
	_mDegreeSelector.layer.borderWidth=2.0;
	_mDegreeSelector.contentMode = UIViewContentModeCenter;
	_mDegreeSelector.backgroundColor=nil;
	_mDegreeSelector.tintColor = [UIColor grayColor];
    
    _mFormationArray = [[NSMutableArray alloc] init];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.iut.unice.fr/api/formations"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSArray *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                              options:0 error:&jsonParsingError];
    NSDictionary *formation;
    for(int i=0; i<[publicTimeline count];i++)
    {
        formation = [publicTimeline objectAtIndex:i];
        Formation *lFormation = [[Formation alloc] initWithId:[formation objectForKey:@"id"] withType:[formation objectForKey:@"type_code"] withTitle:[formation objectForKey:@"title"]];
        
        [_mFormationArray addObject: lFormation];
        
        /*NSLog(@"Title: %@", [formation objectForKey:@"title"]);
        NSLog(@"Type: %@", [formation objectForKey:@"type_code"]);
        NSLog(@"Id: %@", [formation objectForKey:@"id"]);*/
    }
    
    _mDisplayedArray = [[NSMutableArray alloc] initWithArray:_mFormationArray];
    
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
    NSLog(@"PREDICATE");
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    NSLog(@"search string");
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    NSLog(@"search option");
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
        NSLog(@"FILTER");
        cell.textLabel.text = [[_mFilteredArray objectAtIndex: indexPath.row] getTitle];
    } else {
        NSLog(@"NOT FILTER");
        cell.textLabel.text = [[_mDisplayedArray objectAtIndex: indexPath.row] getTitle];
    }

    return cell;
}

@end
