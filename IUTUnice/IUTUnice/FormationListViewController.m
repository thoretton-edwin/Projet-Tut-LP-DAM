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
        
        NSLog(@"Title: %@", [formation objectForKey:@"title"]);
        NSLog(@"Type: %@", [formation objectForKey:@"type_code"]);
        NSLog(@"Id: %@", [formation objectForKey:@"id"]);
    }
    
    CGRect fr = CGRectMake(0,108,self.view.frame.size.width,344);
    
    tableView = [[UITableView alloc] initWithFrame:fr
                                                           style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    [self.view addSubview: tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_mFormationArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [[_mFormationArray objectAtIndex:indexPath.row] getId];
    
    UITableViewCell *cell = [self->tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.backgroundView = [[UIView alloc] init];
    [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
    //[[[cell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.textLabel.text = [[_mFormationArray objectAtIndex: indexPath.row] getTitle];

    return cell;
}

@end
