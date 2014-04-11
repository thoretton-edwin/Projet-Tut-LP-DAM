//
//  LieuxTableViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 10/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "LieuxTableViewController.h"
#import "Lieu.h"

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
	self.title = @"Lieux";
	
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 200;
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
					Lieu *lieu = [[Lieu alloc]init];
					lieu.resp = [[NSMutableArray alloc]init];
					TBXMLElement *siteElement = lieuElement->firstChild;
					do
					{
						if([[TBXML elementName:siteElement]isEqualToString:@"nom"])
						{
							NSLog(@"lieu :%@",[TBXML textForElement:siteElement]);
							lieu.nom =[TBXML textForElement:siteElement];
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"postal"])
						{
							NSLog(@"postal :%@",[TBXML textForElement:siteElement]);
							lieu.postal = [TBXML textForElement:siteElement];
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"responsabilite"])
						{
							TBXMLElement *resp = siteElement->firstChild;
							NSLog(@"nom :%@",[TBXML textForElement:resp]);
							[lieu.resp addObject:[TBXML textForElement:resp]];
							resp = resp->nextSibling;
							NSLog(@"email :%@",[TBXML textForElement:resp]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"permanence"])
						{
							lieu.permanence = [TBXML textForElement:siteElement];
							NSLog(@"permanence :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"installation"])
						{
							lieu.installation = [TBXML textForElement:siteElement];
							NSLog(@"installation :%@",[TBXML textForElement:siteElement]);
						}

						if([[TBXML elementName:siteElement]isEqualToString:@"tel"])
						{
							lieu.tel = [TBXML textForElement:siteElement];
							NSLog(@"tel :%@",[TBXML textForElement:siteElement]);
						}
						if([[TBXML elementName:siteElement]isEqualToString:@"fax"])
						{
							lieu.fax = [TBXML textForElement:siteElement];
							NSLog(@"fax :%@",[TBXML textForElement:siteElement]);
						}
						
					}while((siteElement=siteElement->nextSibling));
					
					[lieux addObject:lieu];
				}
				
			}while((lieuElement=lieuElement->nextSibling));
			
		}
		
		
		if (element->firstChild) [self traverseElement:element->firstChild];
		
	} while ((element = element->nextSibling));
	
	
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

	int width = tableView.frame.size.width;
	int height = 200;
	Lieu* item =[lieux objectAtIndex:indexPath.row];
	NSString *index =[NSString stringWithFormat:@"identifier%d",(indexPath.section*10+ indexPath.row)];
	
	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:index];
	
	UIView *separatorLineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 10)];
	//separatorLineView1.backgroundColor = [UIColor redColor];
	[cell.contentView addSubview:separatorLineView1];
	
	UILabel *titre = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, width-10, 20)];
	titre.text = item.nom;
	[cell.contentView addSubview:titre];
	
	UIView *separatorLineView2 = [[UIView alloc] initWithFrame:CGRectMake(0,30, width, 20)];
	//separatorLineView2.backgroundColor = [UIColor redColor];
	[cell.contentView addSubview:separatorLineView2];
	
	UILabel *addr = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, width-30, 80)];
	addr.numberOfLines=4;
	//addr.textAlignment = NSTextAlignmentCenter;
	addr.text = item.postal;
	[cell.contentView addSubview:addr];
	
	if(item.tel)
	{
		UILabel *tel = [[UILabel alloc] initWithFrame:CGRectMake(30,130, width-30, 20)];
		tel.text = [NSString stringWithFormat:@"Tel: %@",item.tel];
		[cell.contentView addSubview:tel];
	}
	
	if(item.fax)
	{
		UILabel *fax = [[UILabel alloc] initWithFrame:CGRectMake(30,150, width-30, 20)];
		fax.text = [NSString stringWithFormat:@"Fax: %@",item.fax];
		[cell.contentView addSubview:fax];
	}
	

	
	
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lieux.count;
}


@end
