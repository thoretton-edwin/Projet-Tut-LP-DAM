//
//  UELTableViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 10/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "UELTableViewController.h"
#import "Sport.h"

@interface UELTableViewController ()
@property NSMutableArray *UELs;
@property TBXML* tbxml;
@end

@implementation UELTableViewController
@synthesize tbxml;
@synthesize UELs;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
	self.tableView.bounces =NO;
	UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	self.title = @"UELs";
	
	NSError *error;
	UELs = [[NSMutableArray alloc]init];
	tbxml = [TBXML tbxmlWithXMLFile:@"UEL" fileExtension:@"xml" error:&error];
    
    if (error) {
        NSLog(@"erreur : %@ %@", [error localizedDescription], [error userInfo]);
    } else {
        NSLog(@"success : %@", [TBXML elementName:tbxml.rootXMLElement]);
        
			//
        if (tbxml.rootXMLElement)
		{
			[self traverseElement:tbxml.rootXMLElement];
			NSLog(@"fin parsing");
			[self.tableView reloadData];
			self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		}
        
    }
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(preferredContentSizeChanged:)
	 name:UIContentSizeCategoryDidChangeNotification
	 object:nil];
	
}

- (void)preferredContentSizeChanged:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (void) traverseElement:(TBXMLElement *)element
{
	do
	{
			//NSLog(@"tag name %s",element->name);
		if([[TBXML elementName:element]isEqualToString:@"uel"])
		{
			NSLog(@"uel");
			
			TBXMLElement *sportElement = element->firstChild;
			do
			{
				if([[TBXML elementName:sportElement]isEqualToString:@"sport"])
				{
					//NSLog(@"sport");
					Sport *sport = [[Sport alloc]init];
					TBXMLElement *Element = sportElement->firstChild;
					do
					{
						
						if([[TBXML elementName:Element]isEqualToString:@"nom"])
						{
							NSLog(@"sport :%@",[TBXML textForElement:Element]);
						
							sport.nom = [TBXML textForElement:Element];
						}
						if([[TBXML elementName:Element]isEqualToString:@"jour"])
						{
							
							sport.jour = [TBXML textForElement:Element];
						}
						if([[TBXML elementName:Element]isEqualToString:@"heuredeb"])
						{
							
							sport.heureDeb = [TBXML textForElement:Element];
						}
						if([[TBXML elementName:Element]isEqualToString:@"heurefin"])
						{
							
							sport.heureFin = [TBXML textForElement:Element];
						}
						if([[TBXML elementName:Element]isEqualToString:@"site"])
						{
							sport.site = [TBXML textForElement:Element];
							
						}
						
					}while((Element=Element->nextSibling));
					[UELs addObject:sport];
				}
				
				
			}while((sportElement=sportElement->nextSibling));
			
		}
		
		
		if (element->firstChild) [self traverseElement:element->firstChild];

	} while ((element = element->nextSibling));

	
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Sport* item =[self.UELs objectAtIndex:indexPath.row];
	
	NSString *index =[NSString stringWithFormat:@"identifier%d",(indexPath.section*10+ indexPath.row)];
	
	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:index];
	cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	cell.textLabel.text = item.nom ;
		//cell.detailTextLabel.text = [NSString]jour.seance.count;
	cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"selected cell at section %d - row :%d",indexPath.section,indexPath.row );
	Sport* sport =[self.UELs objectAtIndex:indexPath.row];
	
	NSMutableString *message = [[NSMutableString alloc]init];
	

	[message appendString:@"jour : "];
	if(sport.jour)
	{
		[message appendString:sport.jour];
	}
	[message appendString:@"\n"];
	
	[message appendString:@"heure de début : "];
	if(sport.heureDeb)
	{
		[message appendString:sport.heureDeb];
	}
	[message appendString:@"\n"];
	
	[message appendString:@"heure de fin : "];
	if(sport.heureFin)
	{
		[message appendString:sport.heureFin];
	}
	[message appendString:@"\n"];
	
	[message appendString:@"site : "];
	if(sport.site)
	{
		[message appendString:sport.site];
	}
	[message appendString:@"\n"];
	
	
	UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Infos" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	
	[alert show];
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return UELs.count;
}


@end
