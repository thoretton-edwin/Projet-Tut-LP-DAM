//
//  BusViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 05/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "BusViewController.h"

@interface BusViewController ()
{
	
}


@end

@implementation BusViewController
@synthesize busTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)BackAction:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	busTableView.delegate=self;
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//override methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;//[tab count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil)
	{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
			// Configure the cell...
		//cell.textLabel.text = [[tab objectAtIndex:indexPath.row] objectForKey:@"nom"];
		//cell.backgroundColor = [[tab objectAtIndex:indexPath.row]objectForKey:@"couleur"];
		
		/* other methods of standard cell
		 [cell.textLabel setText:@"text"];
		 [cell.detailTextLabel setText:@"text"];
		 
		 [[cell textLabel]setFont:[UIFont boldSystemFontOfSize:24]];
		 [[cell detailTextLabel]setFont:[UIFont systemFontOfSize:16]];
		 
		 
		 We can config the imageView of cell too ...
		 */
    }
	
    return cell;
}

@end
