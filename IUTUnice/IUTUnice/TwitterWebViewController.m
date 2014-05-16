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
@synthesize activityIndicator;

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
	self.title=@"Twitter UNS";
	//init
	int barHeight = self.navigationController.navigationBar.frame.size.height+20;
	int webViewHeight =[UIScreen mainScreen].bounds.size.height-barHeight;
	
	webView =
	[[UIWebView alloc]initWithFrame:
	 CGRectMake(0,barHeight,[UIScreen mainScreen].bounds.size.width,webViewHeight)];
	 
	[self.webView setDelegate:self];
	 
	NSURL* url = [[NSURL alloc]initWithString:@"https://twitter.com/Univ_Nice"];
	NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
	
	
	// load page
    [webView loadRequest:request];
	
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];    
		
	
	int width = activityIndicator.frame.size.width;
	NSLog(@"width: %d",width);
	activityIndicator.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-width)/2,150,width,width);
    activityIndicator.color = [UIColor blueColor];
    [self.view addSubview:activityIndicator];
	
	
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"start web view");
    [activityIndicator startAnimating];

    
    
}

-(void )webViewDidFinishLoad:(UIWebView *)_webView
{
	NSLog(@"end load web view");
	[activityIndicator stopAnimating];
	[self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

@end
