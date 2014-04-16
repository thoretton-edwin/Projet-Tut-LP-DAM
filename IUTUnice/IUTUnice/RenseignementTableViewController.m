//
//  RenseignementTableViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 04/04/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "RenseignementTableViewController.h"
#import "Renseignement.h"


@interface RenseignementTableViewController ()
@property TBXML* tbxml;
@property NSMutableArray* renseignements;
@end

@implementation RenseignementTableViewController
@synthesize tbxml;
@synthesize renseignements;
@synthesize mailView;

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
	mailView = [[MFMailComposeViewController alloc]init];
	mailView.mailComposeDelegate = self;
	
	UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	self.title = @"Renseignements";
	
	NSError *error;
	renseignements = [[NSMutableArray alloc]init];
	tbxml = [TBXML tbxmlWithXMLFile:@"renseignement" fileExtension:@"xml" error:&error];
    
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
		if([[TBXML elementName:element]isEqualToString:@"renseignement"])
		{
			NSLog(@"renseignement");
			
			NSMutableArray *adresses = [[NSMutableArray alloc]init];
			
			TBXMLElement *titleElement=[TBXML childElementNamed:@"nom" parentElement:element];
			TBXMLElement *childElement=[TBXML childElementNamed:@"adresse" parentElement:element];
			NSString* name=@"";
			if(titleElement)
			{
				name = [NSString stringWithCString:titleElement->text encoding:NSUTF8StringEncoding];
				NSLog(@"nom : %@",name);
			}
			

			while(childElement)
			{
				NSLog(@"adresse: %s",childElement->name);
				TBXMLElement *nameTag=[TBXML childElementNamed:@"nom" parentElement:childElement];
				TBXMLElement *mailTag=[TBXML childElementNamed:@"email" parentElement:childElement];
				
				
				NSString* nameAdr = [NSString stringWithCString:nameTag->text encoding:NSUTF8StringEncoding];
				
				NSString* mail = [NSString stringWithCString:mailTag->text encoding:NSUTF8StringEncoding];


				[adresses addObject:@{@"name": nameAdr,@"mail": mail}];
				childElement = childElement->nextSibling;
			}
						
			Renseignement *item =[[Renseignement alloc]initWhithName:name andAdresses:adresses];
			[renseignements addObject:item];
		
		}
		
		
		if (element->firstChild) [self traverseElement:element->firstChild];
		//NSLog(@"boucle");
	} while ((element = element->nextSibling));
	
	//NSLog(@"fin du parsing");

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	//NSLog(@"nb section : %d",renseignements.count);
    return [renseignements count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//NSLog(@"nb row in section %d",[[[renseignements objectAtIndex:section]adresses]count]);
    return [[[renseignements objectAtIndex:section]adresses]count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[renseignements objectAtIndex:section] nom];
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Renseignement* item = [self.renseignements objectAtIndex:indexPath.section];
	NSDictionary* adr = [item.adresses objectAtIndex:indexPath.row];
	NSString *index =[NSString stringWithFormat:@"identifier%d",(indexPath.section*10+ indexPath.row)];

		UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:index];
		
		cell.textLabel.text = [adr objectForKey:@"name"] ;
		cell.detailTextLabel.text = [adr objectForKey:@"mail"] ;
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"selected cell at section %d - row :%d",indexPath.section,indexPath.row );
	Renseignement* item = [self.renseignements objectAtIndex:indexPath.section];
	NSDictionary* adr = [item.adresses objectAtIndex:indexPath.row];
	
	
		
	[mailView setSubject:@"Demande de contact"];
	[mailView setTitle:@"[Contact]"];
	[mailView setToRecipients:[[NSArray alloc]initWithObjects:[adr objectForKey:@"mail"], nil ]];
		
	[self presentViewController:mailView animated:YES completion:nil];

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"deselected method");
}

-(void )mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

@end
