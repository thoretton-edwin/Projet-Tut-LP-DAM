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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.scrollEnabled = NO;
    
    NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSLog(@"%@",[tabSettings objectAtIndex:indexPath.row]);
    
    cell.textLabel.text =[tabSettings objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"row:%d",[[tableView indexPathForSelectedRow] row]);
    [self choixMenu:[[tableView indexPathForSelectedRow] row]];
   
}



-(void) choixMenu:(int) tag
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
            
            TBXML *xml = [TBXML tbxmlWithXMLFile:@"infosWifi" fileExtension:@"xml" error:nil];
            
            TBXMLElement *root = [TBXML childElementNamed:@"root" parentElement:xml.rootXMLElement];
            
            TBXMLElement *infosWifi = [TBXML childElementNamed:@"site" parentElement:root];
            
            [self traverseElement: infosWifi];
            
            
            infosWifiTableViewController *viewController = [[infosWifiTableViewController alloc] initWithNibName:@"infosWifiTableViewController" bundle:nil];
             [self.navigationController performSelectorOnMainThread:@selector(pushViewController:animated:) withObject:viewController waitUntilDone:NO];
            
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


- (void) traverseElement:(TBXMLElement *)element {
    
    NSLog(@"Coucou traverse element");
    
    /* do {
     if (element->firstChild)
     [self traverseElement:element->firstChild];
     
     if ([[TBXML elementName:element] isEqualToString:@"reseau"]) {
     infosWifi * wifiInfos = [[infosWifi alloc] init];
     TBXMLElement *nomWi = [TBXML childElementNamed:@"nom" parentElement:element];
     wifiInfos.nom_Wifi =[TBXML textForElement:nomWi];
     
     NSLog(@"nom : %@", wifiInfos.nom_Wifi);
     
     //[tabInfosWifi addObject:wifiInfos.nom_Wifi];
     }
     } while ((element = element->nextSibling));*/
    
    
    
    
    
    
}

@end
