//
//  infosWifiTableViewController.m
//  IUTUnice
//
//  Created by Wazany on 27/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "infosWifiTableViewController.h"

@interface infosWifiTableViewController ()

@end

@implementation infosWifiTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tabInfosWifi = [[NSMutableArray alloc] init];
    
    
    

    

    // Initialize TBXML with the URL of an XML doc. TBXML asynchronously loads and parses the file.
    TBXML *tbxml = [[TBXML alloc] initWithXMLFile:@"infosWifi" fileExtension:@"xml" error:nil];
    
    [self traverseElement:tbxml.rootXMLElement];
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
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    NSString *CellIdentifier = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
        
        
    }
    
    return cell;
}



- (void) traverseElement:(TBXMLElement *)element {
    
    
    
    do {
        if ([[TBXML elementName:element] isEqualToString:@"site"]) {
            
            TBXMLElement *catElement = [TBXML childElementNamed:@"reseaux" parentElement:element];
            if (catElement) {
                
                do {
                    infosWifi *aCat = [[infosWifi alloc] init];
                    TBXMLAttribute * attribute = catElement->firstAttribute;
                    while (attribute) {
                        if ([[TBXML attributeName:attribute] isEqualToString:@"nom"]) {
                            aCat.nom_Wifi = [TBXML attributeValue:attribute];
                            NSLog(@"nom wifi : %@", aCat.nom_Wifi);
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"ssid"]) {
                            aCat.ssid_wifi = [TBXML attributeValue:attribute];
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"clef"]) {
                            aCat.clef_wifi = [TBXML attributeValue:attribute];
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"login"]) {
                            aCat.login_Wifi = [TBXML attributeValue:attribute];
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"mdp"]) {
                            aCat.mdp_wifi = [TBXML attributeValue:attribute];
                        }
                        attribute = attribute->next;
                    }
                    [tabInfosWifi addObject:aCat];
                    
                } while ((catElement = catElement->nextSibling));
            }
            else {
                
            }
        }
        if (element->firstChild) [self traverseElement:element->firstChild];
    } while ((element = element->nextSibling));
    
    
    
}



@end
