//
//  TwitterWebViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "TwitterWebViewController.h"

@interface TwitterWebViewController ()

@end

@implementation TwitterWebViewController
@synthesize webView;

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
	
	//init
	webView =
	[[UIWebView alloc]initWithFrame:
	 CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
	 
	 
	NSURL* url = [[NSURL alloc]initWithString:@"https://twitter.com/Univ_Nice"];
	NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
	
	
	// load page
    [webView loadRequest:request];
	[self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
