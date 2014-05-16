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
@synthesize campusName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCampus:(NSString*)maVille
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
	
		//NSLog(@"init : %@",maVille);
		self.navigationController.title =@"Lignes de Bus";
		self.title = @"Lignes de Bus";
		self.ville=maVille;
        [busTableView reloadData];
    }
    return self;
}
/*
- (IBAction)BackAction:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
	
}
*/

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
				
	
	 tabBus = [[NSMutableArray alloc]init];
	for (TFHppleElement *station in tab)
    {

		NSArray* childrens = [station children];
			
		for (TFHppleElement *child in childrens)
		{
			//NSLog(@"%@ - %@",[child text],ville);
			if([[child text]isEqualToString:ville])
			{
				NSArray* tmp = [[NSArray alloc]initWithArray:[station children]];
				for(TFHppleElement* obj in tmp)
				{
					if([obj text]!=nil)
					{
						//NSLog(@"%@",[obj tagName]);
						if([[obj tagName]isEqualToString:@"nom"])
						{
							NSMutableString* tmpstr = [[NSMutableString alloc]init];
							[tmpstr appendString:@"Campus de "];
							[tmpstr appendString:[obj text]];
							[campusName setText:tmpstr];
						}
						if([[obj tagName]isEqualToString:@"arret"])
						{
							[tabBus addObject:obj];
						}
						
					}
				}
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil)
	{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		
		TFHppleElement *arret = [tabBus objectAtIndex:indexPath.row];
		
		
		NSMutableString* textLignes=[[NSMutableString alloc]init];
		NSArray* childrens = [arret children];
		
		for (TFHppleElement *child in childrens)
		{
			
			if([child text]!=nil&&[[child tagName]isEqualToString:@"nom"])
			{
				[cell.textLabel setText:[child text]];
				//NSLog(@"cell text :%@",[child text]);
			}
			
			if([child text]!=nil&&[[child tagName]isEqualToString:@"ligne"])
			{
				[textLignes appendString:@"ligne n° "];
				[textLignes appendString:[child text]];
				[textLignes appendString:@".  "];
				//NSLog(@"ligne: %@",[child text]);
			}
		}
		
		NSLog(@"cell detail\n: %@",textLignes);
		[cell.detailTextLabel setText:textLignes];
		cell.detailTextLabel.numberOfLines=4;
		cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
		cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
		
		//[[cell textLabel]setFont:[UIFont boldSystemFontOfSize:24]];
		//[[cell detailTextLabel]setFont:[UIFont systemFontOfSize:16]];


    }
	
    return cell;
}

@end
