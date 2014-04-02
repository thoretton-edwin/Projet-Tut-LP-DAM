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







@end
