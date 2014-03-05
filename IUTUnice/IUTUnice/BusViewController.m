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
	NSData *busData = [[NSData alloc]initWithContentsOfFile:
					   [[NSBundle mainBundle] pathForResource:@"bus" ofType:@"xml"]];
	

/*
	NSXMLParser *parser = [[NSXMLParser alloc]initWithData:busData];
	[parser setDelegate:self];
	NSLog(@"parsing...");
	BOOL result = [parser parse];
	
*/

	TFHpple *xpathParser = [[TFHpple alloc] initWithXMLData:busData];
	
		//Get all the cells main body
	NSMutableArray* tabBus = [[NSMutableArray alloc]initWithArray:
							  [xpathParser searchWithXPathQuery:@"root"]];
				
	

	
	NSLog(@"nb element: %d", [tabBus count]);
	
	
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{

	if ( [elementName isEqualToString:@"root"])
	{
		NSLog(@"found rootElement");
		return;
	}
	
	if ( [elementName isEqualToString:@"ville"])
	{
	
		NSLog(@"found ville element:%@ %@ %@",elementName,qualifiedName,namespaceURI);

		
		return;
	}
	
	if ( [elementName isEqualToString:@"ligne"])
	{
		NSLog(@"found ville element");
		
		
		return;
	}
		  
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"root"])
	{
		NSLog(@"rootelement end");
	}
	

	
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
