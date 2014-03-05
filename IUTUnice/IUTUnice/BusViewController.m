//
//  BusViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 05/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "BusViewController.h"
#import "hpple/TFHpple.h"
@interface BusViewController ()
{
	
}


@end

@implementation BusViewController
@synthesize busTableView;
@synthesize tabBus;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [busTableView reloadData];
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
	busTableView.dataSource=self;
	
	NSData *busData = [[NSData alloc]initWithContentsOfFile:
					   [[NSBundle mainBundle] pathForResource:@"bus" ofType:@"xml"]];
	
	TFHpple *xpathParser = [[TFHpple alloc] initWithXMLData:busData];
	
	

		//Get all the cells main body
	tabBus = [[NSMutableArray alloc]initWithArray:
							  [xpathParser searchWithXPathQuery:@"//ville"]];
				
	[busTableView reloadData];
	NSLog(@"%d",tabBus.count);
	
	/*
	for (TFHppleElement *station in tabBus)
    {
	
		NSLog(@"campus %@",[station text]);
		NSArray* arrets = [station children];
		NSArray* lignes;
		
		for (TFHppleElement *arret in arrets)
		{
			if([arret text]!=nil)
			{
				NSLog(@"arret: %@",[arret text]);
				lignes = [arret children];
				for (TFHppleElement *ligne in lignes)
				{
					if([ligne text]!=nil)
					{
						NSLog(@"ligne: %@",[ligne text]);
					}
				}
			}
			
		}
		
		

    }
	
	
*/

	
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//override methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return[tabBus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil)
	{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
		TFHppleElement *station = [tabBus objectAtIndex:indexPath.row];
		[cell.textLabel setText:[station text]];
		NSLog(@"%@",[station text]);
		
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
