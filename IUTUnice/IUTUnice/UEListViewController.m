//
//  NotesViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "UEListViewController.h"
#import "ModuleTableViewController.h"
@interface UEListViewController ()

@end

@implementation UEListViewController

@synthesize bulletin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

			
    }
    return self;
}

- (void)viewDidLoad
{
	 [super viewDidLoad];
	self.title = @"Notes";
	
	bulletin = [[NSArray alloc]initWithArray:[self getBulletin]];
	
	NSLog(@"nb sem : %lu",(unsigned long)bulletin.count);
	
	OCBorghettiView* accordeonN1 = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
	
	accordeonN1.accordionSectionHeight = 40;
	accordeonN1.accordionSectionFont = [UIFont fontWithName:@"root" size:16];
	accordeonN1.accordionSectionBorderColor = [UIColor blackColor];
	accordeonN1.accordionSectionColor = [UIColor darkGrayColor];
	
	int inc =1;
	for(UE *ue in bulletin)
	{
		
		NSLog(@"%@",ue.nom);
		
		
		ue.tag = inc*100;
		UITableView *noteListe = [[UITableView alloc]init];
		noteListe.tag =inc*100;
		noteListe.delegate = self;
		noteListe.dataSource= self;
		[noteListe reloadData];
		[accordeonN1 addSectionWithTitle:ue.nom
								 andView:noteListe];
		inc++;
								 
		 
	}
	[self.view addSubview:accordeonN1];
    //************ matiere ****************
    


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	for(int inc=1;inc<=bulletin.count;inc++)
	{
		NSLog(@"index %d - item tag n° %d",inc,tableView.tag );
		if(tableView.tag == inc*100)
		{
			
			ModuleTableViewController *moduleView =
			[[ModuleTableViewController alloc]initWithStyle:UITableViewStylePlain
												 andModule:[[[bulletin objectAtIndex:inc-1]modules] objectAtIndex:indexPath.row]];
												
			[self.navigationController pushViewController:moduleView animated:YES];
			 
			
		}
	}
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
    int nb = 0;
	NSLog(@"%d",bulletin.count);
	for(int inc=1;inc<=bulletin.count;inc++)
	{
		NSLog(@"index %d - item tag n° %d",inc,tableView.tag );
		if(tableView.tag == inc*100)
		{
			nb=  [[[bulletin objectAtIndex:inc-1]modules]count];
			
		}
	}
	
    return nb;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellId = [NSString stringWithFormat:@"%d%d",tableView.tag,indexPath.row];
	NSLog(@"%@",cellId);
	UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	
	
	for(int inc=1;inc<=bulletin.count;inc++)
	{
		
		if(tableView.tag == inc*100)
		{
			Module *mod =   [[[bulletin objectAtIndex:inc-1]modules]objectAtIndex:indexPath.row];
			cell.textLabel.text  = [NSString stringWithFormat:@"%@",mod.nom];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
	}
	
	
    return cell;
}

-(NSMutableArray*) getBulletin
{
	NSMutableArray *bulletinLambda = [[NSMutableArray alloc]init];
	
	Note* note1 = [[Note alloc]initWithNom:@"DS1"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"08/02/2014"];
				
	Note* note2 = [[Note alloc]initWithNom:@"DS2"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"10/04/2014"];
	
	Note* note3 = [[Note alloc]initWithNom:@"DS3"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"01/01/2014"];
				
	Note* note4 = [[Note alloc]initWithNom:@"DS1"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"23/04/2014"];
	
	Note* note5 = [[Note alloc]initWithNom:@"DS2"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"18/01/2014"];
				
	Note* note6 = [[Note alloc]initWithNom:@"DS3"
								   AndNote:[NSNumber numberWithDouble:12.4]
								   AndDate:@"17/02/2014"];
				
	
	NSArray* tabModule1 = @[note1,note2,note3];
	NSArray* tabModule2 = @[note4,note5,note6];
	NSArray* tabModule3 = @[note1,note5,note3];
	NSArray* tabModule4 = @[note4,note2,note3];

	
	Module *module1 = [[Module alloc]initWithName:@"TMOB" AndNotes:tabModule1];
	Module *module2 = [[Module alloc]initWithName:@"UML" AndNotes:tabModule2];
	Module *module3 = [[Module alloc]initWithName:@"IOS" AndNotes:tabModule3];
	Module *module4 = [[Module alloc]initWithName:@"ANGLAIS" AndNotes:tabModule4];
	
	
	NSArray* tabS1 = @[module1,module2,module3,module4];
	
	Module *module5 = [[Module alloc]initWithName:@"GL" AndNotes:tabModule1];
	Module *module6 = [[Module alloc]initWithName:@"HTML" AndNotes:tabModule2];
	Module *module7 = [[Module alloc]initWithName:@"ANDROID" AndNotes:tabModule3];
	Module *module8 = [[Module alloc]initWithName:@"WPF" AndNotes:tabModule4];
	
	NSArray* tabS2 = @[module5,module6,module7,module8];
	
	Module *module9 = [[Module alloc]initWithName:@"C#" AndNotes:tabModule1];
	Module *module10 = [[Module alloc]initWithName:@"Gestion de projet" AndNotes:tabModule2];
	Module *module11 = [[Module alloc]initWithName:@"Droit" AndNotes:tabModule3];
	Module *module12 = [[Module alloc]initWithName:@"IHM" AndNotes:tabModule4];
	
	NSArray* tabS3 = @[module9,module10,module11,module12];
	
	UE *ue1 = [[UE alloc]initWithName:@"UE1" AndModules:tabS1];
	UE *ue2 = [[UE alloc]initWithName:@"UE2" AndModules:tabS2];
	UE *ue3 = [[UE alloc]initWithName:@"UE3" AndModules:tabS3];
	UE *ue4 = [[UE alloc]initWithName:@"UE4" AndModules:tabS3];
	

	[bulletinLambda addObject:ue1];
	[bulletinLambda addObject:ue2];
	[bulletinLambda addObject:ue3];
	[bulletinLambda addObject:ue4];
	
	
	
	return bulletinLambda;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)accordion:(OCBorghettiView *)accordion
    didSelectView:(UIView *)view
        withTitle:(NSString *)title
{
	NSLog(@"view selected : %@",title);
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
