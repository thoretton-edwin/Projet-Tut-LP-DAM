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


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andInfos:(NSMutableArray *)infos
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil)
    {
        _infosTabWifi = [[NSMutableArray alloc] initWithArray:infos];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.title = @"Infos Wifi";
    
    
    [self.tableView reloadData];
    
    self.tableView.scrollEnabled = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    NSLog(@"count tabinfowifi viewdidload : %d" , _infosTabWifi.count);
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(preferredContentSizeChanged:)
	 name:UIContentSizeCategoryDidChangeNotification
	 object:nil];
    

}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"count tabinfowifi : %d" , _infosTabWifi.count);
    return _infosTabWifi.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    infosWifi *wifiInfo = [[infosWifi alloc] init];
    
    NSString *CellIdentifier = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        wifiInfo = _infosTabWifi[indexPath.row];
        
        
        
        
        
        UILabel *name_wifi = [[UILabel alloc] initWithFrame:CGRectMake(0, 10,self.tableView.frame.size.width ,20)];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Nom Wifi : %@", wifiInfo.nom_Wifi];
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [cell addSubview:name_wifi];
        [cell sizeToFit];
        
        
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Cellule ,° :%d" , indexPath.row);
    
    infosWifi *wifiInfo = [[infosWifi alloc] init];
    wifiInfo = _infosTabWifi[indexPath.row];
    
    NSString *content_alert = [NSString stringWithFormat:@"SSID : %@ \n Clef : %@ \n login : %@ \n mdp : %@", wifiInfo.ssid_wifi, wifiInfo.clef_wifi , wifiInfo.login_Wifi , wifiInfo.mdp_wifi];
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:wifiInfo.nom_Wifi
                                                    message:content_alert
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    UILabel * content_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, alert.frame.size.width, 200)];
    content_label.backgroundColor=[UIColor redColor];
    [alert addSubview:content_label];
    [alert show];

    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
}


@end
