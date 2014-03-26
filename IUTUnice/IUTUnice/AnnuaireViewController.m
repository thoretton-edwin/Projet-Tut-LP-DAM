//
//  AnnuaireViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "AnnuaireViewController.h"

@interface AnnuaireViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchLabelField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSURL *url;

@end

@implementation AnnuaireViewController
@synthesize searchLabelField;
@synthesize webView;
@synthesize url;


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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchAction:(id)sender
{

	NSMutableString *strUrl = [[NSMutableString alloc]init];
	[strUrl appendString:@"http://annuaire.unice.fr/index.php?base=ou%3Dpeople%2Cdc%3Dunice%2Cdc%3Dfr&action=list_persons&pname="];
	[strUrl appendString:@"thoretton"];
	[strUrl appendString:@"&mode=sidebar&look=portail%22/%3E"];
	url = [[NSURL alloc]initWithString:strUrl];


	NSData * data = [[NSData alloc]initWithContentsOfURL:url];
	NSString *strdata=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	strdata=[strdata stringByReplacingOccurrencesOfString:@" \" "  withString:@"'"];

	NSLog(strdata);
	data = [strdata dataUsingEncoding:NSUTF8StringEncoding];
	TFHpple *parser = [TFHpple hppleWithHTMLData:data];


	//p[@class='titre']
	NSString *xpathQueryString = @"//table";
	NSArray *result = [parser searchWithXPathQuery:xpathQueryString];

	for (TFHppleElement *element in result)
	{
			NSLog(@"%@",element.content);
	
			for(TFHppleElement *elem in element.children)
				{
						NSLog(@"%@",elem.content);
					}
	}
}

@end
