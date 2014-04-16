//
//  SUAPSViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "SUAPSViewController.h"
#import "RenseignementTableViewController.h"
#import "ActivitesTableViewController.h"
#import "UELTableViewController.h"
#import "LieuxTableViewController.h"

@interface SUAPSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SUAPSViewController


@synthesize tableView;
@synthesize titres;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
	
	tableView.delegate=self;
	tableView.dataSource=self;
	self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
	titres = [[NSArray alloc]init];
	titres=@[@"Renseignements",@"Lieux",@"UEL",@"Bonus",@"Activités"];
	
	
    
   
	self.title = @"SUAPS";
	
	

	
	
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [titres count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"%@",[titres objectAtIndex:indexPath.row] );
	if([[titres objectAtIndex:indexPath.row] isEqualToString:@"Bonus"])
	{
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"infos Bonus"
							  message:@"Tous les étudiants du L1 au M2 de l’Université de Nice ainsi que les étudiants de l’IUT peuvent valider une Bonification Sport qui nécessite une participation régulière aux activités proposées dans le cadre su SUAPS.\nRenseignements et retrait de carte bonus au bureau des Sports de votre campus."
							  delegate:self
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
							  
							  
							  alert.alertViewStyle=UIAlertViewStyleDefault;
							  [alert show];
	}
	else if([[titres objectAtIndex:indexPath.row] isEqualToString:@"Renseignements"])
	{
		NSLog(@"Renseignement cell selected");
		RenseignementTableViewController* view = [[RenseignementTableViewController alloc]initWithStyle:UITableViewStylePlain];
		[self.navigationController pushViewController:view animated:YES];
	}
	else if([[titres objectAtIndex:indexPath.row] isEqualToString:@"Activités"])
	{
		NSLog(@"Activite cell selected");
		ActivitesTableViewController* view = [[ActivitesTableViewController alloc]initWithStyle:UITableViewStylePlain];
		[self.navigationController pushViewController:view animated:YES];
	}
	
	else if([[titres objectAtIndex:indexPath.row] isEqualToString:@"UEL"])
	{
		NSLog(@"UEL");
		UELTableViewController* view = [[UELTableViewController alloc]initWithStyle:UITableViewStylePlain];
		[self.navigationController pushViewController:view animated:YES];
	}
	else if([[titres objectAtIndex:indexPath.row] isEqualToString:@"Lieux"])
	{
		NSLog(@"Lieux");
		LieuxTableViewController* view = [[LieuxTableViewController alloc]initWithStyle:UITableViewStylePlain];
		[self.navigationController pushViewController:view animated:YES];
	}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
							 [titres objectAtIndex:indexPath.row]];
    if(cell==nil)
	{
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[titres objectAtIndex:indexPath.row]];
		
		cell.textLabel.text = [titres objectAtIndex:indexPath.row];
		if([[titres objectAtIndex:indexPath.row] isEqualToString:@"Bonus"])
		{
			cell.accessoryType = UITableViewCellAccessoryDetailButton;
		}
		else
		{
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		//UITableViewCellAccessoryDisclosureIndicator
		//UITableViewCellAccessoryCheckmark
		//UITableViewCellAccessoryDetailDisclosureButton
		//UITableViewCellAccessoryDetailButton
		//UITableViewCellAccessoryNone
		
	}
	
	return cell;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
