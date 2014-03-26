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
	
    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"style"
														ofType:@"css"];
	NSString *js = @"document.getElementsByTagName('link')[0].setAttribute('href','";
    NSString *js2 = [js stringByAppendingString:cssPath];
    NSString *finalJS = [js2 stringByAppendingString:@"');"];
    [self.webView stringByEvaluatingJavaScriptFromString:finalJS];
	
	[self.webView loadHTMLString:@"<h1>test</h1>" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
	
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

	//NSLog(strdata);
	data = [strdata dataUsingEncoding:NSUTF8StringEncoding];
	TFHpple *parser = [TFHpple hppleWithHTMLData:data];


	//p[@class='titre']
	NSString *xpathQueryString = @"//table/tr/td/table/tr/td";
	NSArray *result = [parser searchWithXPathQuery:xpathQueryString];
	
	for (TFHppleElement *element in result)
	{
			NSLog(@"tag elem: %@",element.tagName);
			NSLog(@"elem: %@",element.text);
			NSLog(@"elem content: %@",element.content);
	
			for(TFHppleElement *elem in element.children)
				{
						NSLog(@"tag child: %@",elem.tagName);
						NSLog(@"child text: %@",elem.text);
						NSLog(@"child content: %@",elem.content);
					
					for(TFHppleElement *elem2 in elem.children)
					{
						NSLog(@"tag child2: %@",elem2.tagName);
						NSLog(@"child2 text: %@",elem2.text);
						NSLog(@"child2 content: %@",elem2.content);
					}
				}
	}
	
	
	NSMutableString *html = [[NSMutableString alloc]init];
	[html appendString:strdata];
	
  	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"recherche" ofType:@"js"];
	NSData *fileData = [NSData dataWithContentsOfFile:filePath];
	NSString *jsString = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
	[self.webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
	//[self.webView stringByEvaluatingJavaScriptFromString:jsString];
	
	
}

@end
