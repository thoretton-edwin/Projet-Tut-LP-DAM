//
//  LieuxTableViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 10/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "LieuxTableViewController.h"

@interface LieuxTableViewController ()
@property NSMutableArray* lieux;
@property TBXML* tbxml;
@end

@implementation LieuxTableViewController
@synthesize tbxml;
@synthesize lieux;

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
    
    self.lieux = [[NSMutableArray alloc]init];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	self.title = @"Activités";
	
	NSError *error;
	tbxml = [TBXML tbxmlWithXMLFile:@"lieux" fileExtension:@"xml" error:&error];
    
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

}


- (void) traverseElement:(TBXMLElement *)element
{
	do
	{
			//NSLog(@"tag name %s",element->name);
		if([[TBXML elementName:element]isEqualToString:@"lieux"])
		{
			NSLog(@"lieux");
			
			TBXMLElement *lieuElement = element->firstChild;
			do
			{
				if([[TBXML elementName:lieuElement]isEqualToString:@"site"])
				{
					TBXMLElement *siteElement = lieuElement->firstChild;
					do
					{
						if([[TBXML elementName:siteElement]isEqualToString:@"nom"])
						{
							
							NSLog(@"lieu :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"postal"])
						{
							
							NSLog(@"postal :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"responsabilite"])
						{
							TBXMLElement *resp = siteElement->firstChild;
							NSLog(@"nom :%@",[TBXML textForElement:resp]);
							resp = resp->nextSibling;
							NSLog(@"email :%@",[TBXML textForElement:resp]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"permanence"])
						{
							
							NSLog(@"permanence :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"installation"])
						{
							
							NSLog(@"installation :%@",[TBXML textForElement:siteElement]);
						}

						if([[TBXML elementName:siteElement]isEqualToString:@"tel"])
						{
							
							NSLog(@"tel :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"fax"])
						{
							
							NSLog(@"fax :%@",[TBXML textForElement:siteElement]);
						}
						
					}while((siteElement=siteElement->nextSibling));
				}
				
			}while((lieuElement=lieuElement->nextSibling));
			
		}
		
		
		if (element->firstChild) [self traverseElement:element->firstChild];
		
	} while ((element = element->nextSibling));
	
	
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


@end
