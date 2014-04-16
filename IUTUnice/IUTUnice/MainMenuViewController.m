//
//  MainMenuViewController.m
//  IUTUnice
//
//  Created by macos on 31/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize cadreViewArray;
@synthesize userId;
@synthesize tagInfo;
@synthesize iconView1;
@synthesize iconView2;
@synthesize iconView3;
@synthesize iconView4;
@synthesize iconView5;
@synthesize iconView6;
@synthesize iconView7;
@synthesize iconView8;
@synthesize iconView9;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"IUT Nice Côte d'Azur";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	for (int i = 0; i < _imagesViewArray.count; i++)
	{
		UIView *cadre  = [cadreViewArray objectAtIndex:i];
		cadre.backgroundColor=nil;

	}
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    userId = @"noUser";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:userId  forKey:@"idUser"];
    [prefs synchronize];
    

    NSString *idUser = [prefs stringForKey:@"idUser"];
    
    NSLog(@"iduser mainmenu : %@", idUser);
    
    
	//background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _isInList = NO;
	
	cadreViewArray =[[NSMutableArray alloc] init];
	[cadreViewArray addObject:iconView1];
	[cadreViewArray addObject:iconView2];
	[cadreViewArray addObject:iconView3];
	[cadreViewArray addObject:iconView4];
	[cadreViewArray addObject:iconView5];
	[cadreViewArray addObject:iconView6];
	[cadreViewArray addObject:iconView7];
	[cadreViewArray addObject:iconView8];
	[cadreViewArray addObject:iconView9];
	
	
	
    _imagesViewArray = [[NSMutableArray alloc] init];
	
    for(int j= 0;j<9;j++)
	{
		[_imagesViewArray addObject:[[UIImageView alloc]init]];
	}
    _imagesRefArray = [[NSMutableArray alloc] init];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836131_Library.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836124_college_3D.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836370_Test-paper-128.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836150_calendar.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836248_addressbook.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836301_Manager.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836200_map-icon.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"1383836168_Soccer_Ball.png"]];
    [_imagesRefArray addObject: [UIImage imageNamed:@"Twitter_logo_blue.png"]];
    
    _menuTitleArray = [[NSMutableArray alloc] init];
	
    [_menuTitleArray addObject: @"Vitrine"];
    [_menuTitleArray addObject: @"Post-Bac"];
    [_menuTitleArray addObject: @"Notes"];
    [_menuTitleArray addObject: @"Agenda"];
    [_menuTitleArray addObject: @"Annuaire"];
    [_menuTitleArray addObject: @"Job Dating"];
    [_menuTitleArray addObject: @"Map"];
    [_menuTitleArray addObject: @"SUAPS"];
    [_menuTitleArray addObject: @"Twitter"];

    
    for (int i = 0; i < _imagesViewArray.count; i++) {
        [[_imagesViewArray objectAtIndex:i] setImage: [_imagesRefArray objectAtIndex:i]];
		
		UIView *cadre  = [cadreViewArray objectAtIndex:i];
        UIImageView* mImv = [_imagesViewArray objectAtIndex: i];
		
			// on identifie chaque item
		
		cadre.tag = i;
        mImv.frame = CGRectMake(10,10,50,50);
			// customisation de l'imageView
		
		[cadre addSubview:mImv];
		cadre.frame = CGRectMake(0,0,70,70);
		cadre.clipsToBounds=YES;
		cadre.layer.cornerRadius=6.0;
		cadre.layer.borderColor=[UIColor grayColor].CGColor;
		cadre.layer.borderWidth=2.0;
		cadre.contentMode = UIViewContentModeCenter;
		cadre.backgroundColor=nil;

		
		// gestion des clicks
		[cadre setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (singleTapping:)];
		
        [singleTap setNumberOfTapsRequired:1];
        [[cadreViewArray objectAtIndex:i] addGestureRecognizer:singleTap];

		
        [self.view addSubview: cadre];
    }
    
    
    UIImage* imageSettings = [UIImage imageNamed:@"settings-24-512.png"];
    CGRect rect = CGRectMake(0,0,32,32);
    UIGraphicsBeginImageContext( rect.size );
    [imageSettings drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    _settings = [[UIBarButtonItem alloc] initWithImage:img style: UIBarButtonItemStylePlain target:self action:@selector(goToSettings:)];
    [self.navigationItem setLeftBarButtonItem:_settings animated:NO];
    

    _listMenu = [[UIBarButtonItem alloc] initWithImage:[self createIconForNavigationBarWithImage:@"List_icon.png"] style: UIBarButtonItemStylePlain target:self action:@selector(changeDisplayMode:)];
    [self.navigationItem setRightBarButtonItem:_listMenu animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeDisplayMode:(id)sender{
    if(_isInList == NO){
        _listViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 1, 1)];
        
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options:UIViewAnimationCurveEaseIn
                         animations:^{
                             _listViewContainer.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
        [self.view addSubview: _listViewContainer];
        
        CGRect fr = CGRectMake(0,0,_listViewContainer.frame.size.width,_listViewContainer.frame.size.height);
        
        menuTableView = [[UITableView alloc] initWithFrame:fr style:UITableViewStylePlain];
        menuTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        menuTableView.delegate = self;
        menuTableView.dataSource = self;
        [menuTableView reloadData];
        menuTableView.scrollEnabled = NO;
        [_listViewContainer addSubview: menuTableView];
        
        
        
        [_listMenu setImage:[self createIconForNavigationBarWithImage:@"small_tiles.png"]];
        _isInList = YES;
    }
    else{
        [_listViewContainer removeFromSuperview];
        [_listMenu setImage:[self createIconForNavigationBarWithImage:@"List_icon.png"]];
        _isInList = NO;
    }
    
}

-(UIImage*) createIconForNavigationBarWithImage: (NSString*)imageURI{
    UIImage* imageMenu = [UIImage imageNamed:imageURI];
    CGRect rect = CGRectMake(0,0,32,32);
    UIGraphicsBeginImageContext( rect.size );
    [imageMenu drawInRect:rect];
    UIImage *picture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(picture);
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}

-(void)goToSettings:(id)sender
{
    SettingsViewController *viewController=[[SettingsViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [_menuTitleArray objectAtIndex: indexPath.row];
    
    UITableViewCell *cell = [self->menuTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    [cell.imageView setImage: [_imagesRefArray objectAtIndex: indexPath.row]];
    cell.textLabel.text = [_menuTitleArray objectAtIndex: indexPath.row];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self choixMenu:[[menuTableView indexPathForSelectedRow] row]];
    
}

-(void) choixMenu:(int) tag
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    switch(tag)
    {
        case 0: // Page Vitrine
        {
            // Set vertical effect
			iconView1.backgroundColor = [UIColor grayColor];
			
            
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
                
                
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                VitrinePageViewController *viewController = [[VitrinePageViewController alloc] initWithNibName:@"VitrinePageViewController" bundle:nil];
                [self.navigationController pushViewController:viewController animated:YES];
            }
            
			
        }
            break;
        case 1: // Post Bac UIViewController accordion
        {
            // Set vertical effect
			iconView2.backgroundColor = [UIColor grayColor];
			
            PostBacViewController *viewController = [[PostBacViewController alloc] initWithNibName:@"PostBacViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
            break;
        case 2: // Notes UIViewController accordion
        {
            // Set vertical effect
			iconView3.backgroundColor = [UIColor grayColor];
            
            
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                NSString *idUser = [prefs stringForKey:@"idUser"];
                
                tagInfo = tag;
                
                NSLog(@"connexion sux : %@", idUser);
                
                if(![idUser isEqualToString:@"noUser"])
                {
                    
                    UEListViewController *viewController = [[UEListViewController alloc] initWithNibName:@"NotesViewController" bundle:nil];
                    [self.navigationController pushViewController:viewController animated:YES];
                }else
                {
                    [self connexionLogin];
                }
            }
            
            
            
           
                
            
            
            
			
            
			
        }
            break;
        case 3: // EDT lib calendarView
        {
            // Set vertical effect
			iconView4.backgroundColor = [UIColor grayColor];
			
            
            
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                NSString *idUser = [prefs stringForKey:@"idUser"];
                
                
                
                NSLog(@"connexion sux : %@", idUser);
                
                if(![idUser isEqualToString:@"noUser"])
                {
                    
                    EDTViewController *viewController = [[EDTViewController alloc] initWithNibName:@"EDTViewController" bundle:nil];
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }else
                {
                    [self connexionLogin];
                }
            }
            
            
            
            
            

			
        }
            break;
        case 4: // Annuaire UItableView
        {
            // Set vertical effect
			iconView5.backgroundColor = [UIColor grayColor];
            
            
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                AnnuaireViewController *viewController = [[AnnuaireViewController alloc] initWithNibName:@"AnnuaireViewController" bundle:nil];
                [self.navigationController pushViewController:viewController animated:YES];
                
                
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                NSString *idUser = [prefs stringForKey:@"idUser"];
                
                NSLog(@"connexion sux : %@", idUser);
                
                if(![idUser isEqualToString:@"noUser"])
                {
                    
                    EDTViewController *viewController = [[EDTViewController alloc] initWithNibName:@"EDTViewController" bundle:nil];
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }else
                {
                    [self connexionLogin];
                }
            }
            
            
			
            
            
			
        }
            break;
        case 5: // Job Dating UIViewController accordion
        {
            // Set vertical effect
			iconView6.backgroundColor = [UIColor grayColor];
			
            /*JobDatingViewController *viewController = [[JobDatingViewController alloc] initWithNibName:@"JobDatingViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];*/
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Désolé..."
                                  message:@"Ce module est indisponible pour le moment. Son contenu est actuellement en construction."
                                  delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil, nil];
            [alert show];
			
        }
            break;
        case 6: // Map UiVIewController
        {
            // Set vertical effect
			iconView7.backgroundColor = [UIColor grayColor];
            
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                MapViewController *viewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
                [self.navigationController pushViewController:viewController animated:YES];
            }
            
			
            
			
            
        }
            break;
        case 7: // SUAPS UIViewController accordion
        {
            // Set vertical effect
			iconView8.backgroundColor = [UIColor grayColor];
			
            SUAPSViewController *viewController = [[SUAPSViewController alloc] initWithNibName:@"SUAPSViewController" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
			
        }
            break;
        case 8: // Twitter webview
        {
            // Set vertical effect
			iconView9.backgroundColor = [UIColor grayColor];
            
            if(status == NotReachable)
            {
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Pas de connexion"
                                          message:@"Veuillez vous connecter à internet"
                                          delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
                
                [alertView show];
            }
            else if (status == ReachableViaWiFi || status == ReachableViaWWAN)
            {
                TwitterWebViewController *viewController = [[TwitterWebViewController alloc] initWithNibName:@"TwitterWebViewController" bundle:nil];
                [self.navigationController pushViewController:viewController animated:YES];
            }
			
            
			
        }
            break;
        default:
            // lancer une exception ? ..
            break;
            
    }

}

-(void)singleTapping:(id)sender
{

    UITapGestureRecognizer *gesture = (UITapGestureRecognizer *) sender;
    NSLog(@"image click N°:%ld",(long)gesture.view.tag);
    [self choixMenu:(long)gesture.view.tag];
    
}



// module de connexion

-(void)connexionLogin
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Title"
                              message:@"Message"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Login", nil];
    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    [alertView show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Login"])
    {
        UITextField *username = [alertView textFieldAtIndex:0];
        UITextField *password = [alertView textFieldAtIndex:1];
        
        NSString *user = username.text;
        NSString *passwd = password.text;
        
        
        if ([user isEqual:@"aa"] && [passwd isEqual:@""]) {
            userId = user;
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setValue:userId  forKey:@"idUser"];
            [prefs synchronize];
            
            
            
            if (tagInfo == 2) {
                UEListViewController *viewController = [[UEListViewController alloc] initWithNibName:@"NotesViewController" bundle:nil];
                [self.navigationController pushViewController:viewController animated:YES];
            }
            
            
            
            
            NSLog(@"user Id : %@ ", [prefs stringForKey:@"idUser"]);
        }else{
            UIAlertView *errorConnexion = [[UIAlertView alloc]
                                           initWithTitle:@"Erreur"
                                           message:@"erreur mdp/pwd"
                                           delegate:self
                                           cancelButtonTitle:@"ok"
                                           otherButtonTitles:@"reconnexion", nil];
            [errorConnexion show];
        }
        
        
        
        
    }else
        if([title isEqualToString:@"Ok"])
        {
            iconView1.backgroundColor = [UIColor clearColor];
            iconView2.backgroundColor = [UIColor clearColor];
            iconView3.backgroundColor = [UIColor clearColor];
            iconView4.backgroundColor = [UIColor clearColor];
            iconView5.backgroundColor = [UIColor clearColor];
            iconView6.backgroundColor = [UIColor clearColor];
            iconView7.backgroundColor = [UIColor clearColor];
            iconView8.backgroundColor = [UIColor clearColor];
            
        }
}

@end
