//
//  SettingsViewController.m
//  IUTUnice
//
//  Created by VM Mac on 14/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title =@"Paramêtres";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Settings";
    

    tabSettings= [[NSMutableArray alloc] init];
    [tabSettings addObject:@"Connexion"];
    [tabSettings addObject:@"Infos WIfi"];
    [tabSettings addObject:@"A propos"];
    [tabSettings addObject:@"Sondage"];
    [tabSettings addObject:@"Langue"];
    [tabSettings addObject:@"Credits"];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.

    int number = tabSettings.count;
   
    
    return number;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int number = tabSettings.count;
     NSLog(@"nombre de row : %d", number);
    if (indexPath.row <= number) {
        return 50;
    }else
    {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.scrollEnabled = NO;
    NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text =[tabSettings objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
   NSLog(@"%@",[tabSettings objectAtIndex:indexPath.row]);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"row:%d",[[tableView indexPathForSelectedRow] row]);
    [self choixMenu:[[tableView indexPathForSelectedRow] row]];
    
}

-(void) choixMenu:(int) tag
{
    switch(tag)
    {
        case 0: // Connexion
        {
            ConnexionViewController *viewController = [[ConnexionViewController alloc] initWithNibName:@"ConnexionViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];

			
        }
            break;
        case 1: // Infos Wifi
        {
            infosWifiViewController *viewController = [[infosWifiViewController alloc] initWithNibName:@"infosWifiViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
            break;
        case 2: // A propos
        {
            AboutViewController *viewController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
            break;
        case 3: // Sondage
        {
            SurveyViewController *viewController = [[SurveyViewController alloc] initWithNibName:@"SurveyViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
            break;
        case 4: // Langue
        {
            LangueViewController *viewController = [[LangueViewController alloc] initWithNibName:@"LangueViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];

			
        }
            break;
        case 5: // Crédit
        {
			
            CreditsViewController *viewController = [[CreditsViewController alloc] initWithNibName:@"CreditsViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
        
            break;
        default:
            // lancer une exception ? ..
            break;
            
    }
    
}


@end
