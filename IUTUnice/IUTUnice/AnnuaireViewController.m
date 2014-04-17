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
@property NSURL *url;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property NSMutableString *email;
@property NSMutableString *content;
@property NSString *nom;
@property NSString *searchContent;
@property BOOL isFounded;
@property MFMailComposeViewController* mailView;
@end

@implementation AnnuaireViewController
@synthesize searchLabelField;
@synthesize searchContent;
@synthesize email;
@synthesize nom;
@synthesize  textField;
@synthesize isFounded;
@synthesize mailView;

@synthesize url;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (IBAction)sendEmail:(id)sender
{
	mailView = [[MFMailComposeViewController alloc]init];
	self.mailView.mailComposeDelegate = self;

	[mailView setSubject:@"Demande de contact"];
	[mailView setTitle:@"[Contact]"];
	
	[mailView setToRecipients:[[NSArray alloc]initWithObjects:self.email, nil ]];
	
	[self presentViewController:mailView animated:YES completion:nil];
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
    
    self.title = @"Annuaire";
	UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:[UIScreen mainScreen].bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	email = [[NSMutableString alloc]init];
	self.searchLabelField.delegate=self;
	self.textField.scrollEnabled = NO;
	[self.textField setText:@"Entrez le nom et prenom.."];
	[self.textField sizeToFit];
	self.textField.editable = NO;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void )mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (IBAction)searchAction:(id)sender
{

	NSMutableString *strUrl = [[NSMutableString alloc]init];
	[strUrl appendString:@"http://annuaire.unice.fr/index.php?base=ou%3Dpeople%2Cdc%3Dunice%2Cdc%3Dfr&action=list_persons&pname="];
	
	searchContent = self.searchLabelField.text;
	searchContent = [self.searchContent lowercaseString];
	searchContent = [searchContent stringByTrimmingCharactersInSet:
							   [NSCharacterSet whitespaceCharacterSet]];
	
	searchContent = [searchContent stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	
	NSLog(@"recherche %@",searchContent);
	[strUrl appendString:searchContent];
	[strUrl appendString:@"&mode=sidebar&look=portail%22/%3E"];
	url = [[NSURL alloc]initWithString:strUrl];


	NSData * data = [[NSData alloc]initWithContentsOfURL:url];
	NSString *strdata=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	strdata=[strdata stringByReplacingOccurrencesOfString:@" \" "  withString:@"'"];

	data = [strdata dataUsingEncoding:NSUTF8StringEncoding];
	TFHpple *parser = [TFHpple hppleWithHTMLData:data];


	//p[@class='titre']
	NSString *xpathQueryString = @"//table/tr/td/table/tr/td";
	NSArray *result = [parser searchWithXPathQuery:xpathQueryString];
	self.content = [[NSMutableString alloc]init];
	
	NSString *mail;
	NSMutableString *info = [[NSMutableString alloc]initWithString:@""];
	
	for (TFHppleElement *element in result)
	{
	
			for(TFHppleElement *elem in element.children)
				{
					if([elem.tagName isEqualToString:@"text"]&&elem.content!=nil)
					{
						//NSLog(@"text element: %@",elem.content);
						[info appendString:elem.content];
						[info appendString:@"\n"];
					}

					for(TFHppleElement *elem2 in elem.children)
					{
					
						if([elem2.tagName isEqualToString:@"a"]&&elem2.text!=nil)
						{
							//NSLog(@"mail: %@",elem2.text);
							mail = elem2.text;
							self.email = [[NSMutableString alloc]initWithString:elem2.text];
						}
						
						else if([elem2.tagName isEqualToString:@"u"]&&elem2.text!=nil)
						{
							//NSLog(@"nom: %@",elem2.text);
							nom = elem2.text;
						}
						
						else if([elem2.tagName isEqualToString:@"text"]&&elem2.content!=nil)
						{
							//NSLog(@"text: %@",elem2.content);
						}

						
					}
				}
	}
	
	
	if(nom !=nil&&mail!=nil)
	{
		[self.content appendString:nom];
		[self.content appendString:@"\n\n"];
		[self.content appendString:@"mail : "];
		[self.content appendString:mail];
		[self.content appendString:@"\n"];
		[self.content appendString:info];
		
		NSLog(@"content: %@",self.content);
		
		
		[self.textField setText:self.content];
		[self.textField sizeToFit];
	}
	else
	{
		
		[self.textField setText:@"Recherche non trouvée"];
		[self.textField sizeToFit];
		
	}
	
	
	
	
	
	
}

@end
