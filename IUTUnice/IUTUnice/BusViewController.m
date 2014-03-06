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
@synthesize ville;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCampus:(NSString*)maVille
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
	
		//NSLog(@"init : %@",maVille);
		self.ville=maVille;
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
	NSArray* tab = [[NSMutableArray alloc]initWithArray:
							  [xpathParser searchWithXPathQuery:@"//ville"]];
				
	
	NSLog(@"%d",tabBus.count);
	
	
	for (TFHppleElement *station in tab)
    {

		NSArray* childrens = [station children];
			
		for (TFHppleElement *child in childrens)
		{
			if([[child text]isEqualToString:ville])
			{
			    tabBus = [[NSMutableArray alloc]initWithArray:[station children]];
			}
			
		}
		[busTableView reloadData];
    }
	
	


	
	
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
		
		TFHppleElement *arret = [tabBus objectAtIndex:indexPath.row];
		[cell.textLabel setText:[arret text]];
		NSLog(@"cell text :%@",[arret text]);
		
		NSMutableString* textLignes=[[NSMutableString alloc]init];
		NSArray* lignes = [arret children];
		
		for (TFHppleElement *ligne in lignes)
		{
			if([ligne text]!=nil)
			{
				[textLignes appendString:@"ligne n° "];
				[textLignes appendString:[ligne text]];
				[textLignes appendString:@"\n"];
				//NSLog(@"ligne: %@",[ligne text]);
			}
		}
		
		NSLog(@"cell detail\n: %@",textLignes);
		[cell.detailTextLabel setText:textLignes];
		
		[[cell textLabel]setFont:[UIFont boldSystemFontOfSize:24]];
		[[cell detailTextLabel]setFont:[UIFont systemFontOfSize:16]];


    }
	
    return cell;
}

@end
