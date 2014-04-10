//
//  ActivitesTableViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 09/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "ActivitesTableViewController.h"
#import "Activite.h"
#import "Jour.h"
#import "Seance.h"

@interface ActivitesTableViewController ()

@end

@implementation ActivitesTableViewController
@synthesize activites;
@synthesize tbxml;

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
    
	self.activites = [[NSMutableArray alloc]init];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	self.title = @"Activités";
	
	NSError *error;
	activites = [[NSMutableArray alloc]init];
	tbxml = [TBXML tbxmlWithXMLFile:@"activites" fileExtension:@"xml" error:&error];
    
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
		if([[TBXML elementName:element]isEqualToString:@"activite"])
		{
			
			TBXMLElement *activiteElement = element->firstChild;
			NSLog(@"activités");
			Activite *act = [[Activite alloc]init];
			act.jour = [[NSMutableArray alloc]init];
			do
			{
				
				if([[TBXML elementName:activiteElement]isEqualToString:@"nom"])
				{
					act.nom =[TBXML textForElement:activiteElement];
					NSLog(@"nom :%@",[TBXML textForElement:activiteElement]);
				}
				if([[TBXML elementName:activiteElement]isEqualToString:@"renseignement"])
				{
					act.renseignement = [TBXML textForElement:activiteElement];
					NSLog(@"reseignement :%@",[TBXML textForElement:activiteElement]);
				}
				if([[TBXML elementName:activiteElement]isEqualToString:@"jour"])
				{
					
					
					TBXMLElement *jourElement = activiteElement->firstChild;
					do
					{
						Jour *jour = [[Jour alloc]init];
						
						if([[TBXML elementName:jourElement]isEqualToString:@"nom"])
						{
							jour.nom =[TBXML textForElement:jourElement];
							NSLog(@"jour %@",[TBXML textForElement:jourElement]);
						}
						
						if([[TBXML elementName:jourElement]isEqualToString:@"seance"])
						{
							NSLog(@"seance");
							jour.seance = [[NSMutableArray alloc]init];
							
							TBXMLElement *seanceElement = jourElement->firstChild;
							do{
								Seance *seance = [[Seance alloc]init];
								if([[TBXML elementName:seanceElement]isEqualToString:@"heure"])
								{
									seance.heure = [TBXML textForElement:seanceElement];
									NSLog(@"heure :%@",[TBXML textForElement:seanceElement]);
								}
								if([[TBXML elementName:seanceElement]isEqualToString:@"lieux"])
								{
									seance.lieu =[TBXML textForElement:seanceElement];
									NSLog(@"lieux :%@",[TBXML textForElement:seanceElement]);
								}
								if([[TBXML elementName:seanceElement]isEqualToString:@"autre"])
								{
									seance.autre =[TBXML textForElement:seanceElement];
									NSLog(@"autre :%@",[TBXML textForElement:seanceElement]);
								}
								if([[TBXML elementName:seanceElement]isEqualToString:@"responsable"])
								{
									seance.responsable =[TBXML textForElement:seanceElement];
									NSLog(@"responsable :%@",[TBXML textForElement:seanceElement]);
								}
								[jour.seance addObject:seance];
								
							}while((seanceElement=seanceElement->nextSibling));
							
							
						}
						
						[act.jour addObject:jour];
						
					}while((jourElement=jourElement->nextSibling));
					
				}
				
				
			}while((activiteElement=activiteElement->nextSibling));
			NSLog(@"added activitie :%@",act.nom);
			[activites addObject:act];
			
		}
		
		
		if (element->firstChild) [self traverseElement:element->firstChild];
			//NSLog(@"boucle");
	} while ((element = element->nextSibling));
	
		//NSLog(@"fin du parsing");
	[self.tableView reloadData];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Jour* item =
	[[[self.activites objectAtIndex:indexPath.section]jour]objectAtIndex:indexPath.row];
	
	NSString *index =[NSString stringWithFormat:@"identifier%d",(indexPath.section*10+ indexPath.row)];
	
	UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:index];
	
	cell.textLabel.text = item.nom ;
	//cell.detailTextLabel.text = [NSString]jour.seance.count;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[activites objectAtIndex:section]nom];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSLog(@"number of sections: %d",activites.count);
    return activites.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  [[[activites objectAtIndex:section]jour]count];
}

@end