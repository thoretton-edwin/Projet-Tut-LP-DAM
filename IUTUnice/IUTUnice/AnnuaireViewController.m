//
//  AnnuaireViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 20/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "AnnuaireViewController.h"

@interface AnnuaireViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AnnuaireViewController
- (IBAction)searchAction:(id)sender
{
	 NSURLRequest *request = [NSURLRequest requestWithURL:
	 [NSURL URLWithString:@"http://annuaire.unice.fr/index.php?base=ou%3Dpeople%2Cdc%3Dunice%2Cdc%3Dfr&action=list_persons&pname=thoretton&mode=sidebar&look=portail#haut"]];
	//self.webView.request
}

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
    self.webView = [[UIWebView alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
