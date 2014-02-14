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
	webView =
	[[UIWebView alloc]initWithFrame:
	 CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
	 
	[self.webView setDelegate:self];
	 
	NSURL* url = [[NSURL alloc]initWithString:@"https://twitter.com/Univ_Nice"];
	NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
	
	
	// load page
    [webView loadRequest:request];
	
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
	
	
	[self.view addSubview:webView];
	
		
	
	
	
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"start web view");

    activityIndicator.frame = CGRectMake(150, 200, 50, 50);
    activityIndicator.color = [UIColor redColor];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];

    
    
}

-(void )webViewDidFinishLoad:(UIWebView *)webView
{
	NSLog(@"end load web view");
    
	[activityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

@end
