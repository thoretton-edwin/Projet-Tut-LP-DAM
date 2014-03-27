//
//  VitrinePageViewController.m
//  IUTUnice
//
//  Created by macos on 13/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "VitrinePageViewController.h"

@interface VitrinePageViewController ()

@end

@implementation VitrinePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Bienvenue à l'IUT";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _sondageArray = [[NSMutableArray alloc] init];
    
    _presentationImage.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"IUT NICE.JPG"],
                                          [UIImage imageNamed:@"IUT SOPHIA.JPG"],
                                          [UIImage imageNamed:@"IUT MENTON195.JPG"],
                                          [UIImage imageNamed:@"IUT NICE2.JPG"],
                                          [UIImage imageNamed:@"menton.jpg"],nil];
    
    _presentationImage.animationDuration = 20.00;
    _presentationImage.animationRepeatCount = 0; //infinite
    _presentationImage.contentMode = UIViewContentModeScaleAspectFit;
    [_presentationImage startAnimating];
    
    NSString *myPath = [[NSBundle mainBundle]pathForResource:@"descriptionIUT" ofType:@"txt"];
    
    NSString *presentationText = [[NSString alloc]initWithContentsOfFile:myPath encoding:NSUTF8StringEncoding error:nil];
    
    UITextView *myUITextView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,_descriptionScrollView.frame.size.width,_descriptionScrollView.frame.size.height)];
    myUITextView.text = presentationText;
    myUITextView.textColor = [UIColor blackColor];
    myUITextView.font = [UIFont systemFontOfSize:14];
    [myUITextView setBackgroundColor:[UIColor clearColor]];
    myUITextView.editable = NO;
    myUITextView.scrollEnabled = YES;
    [_descriptionScrollView addSubview:myUITextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToFormationListPage:(id)sender {
    FormationListViewController *viewController = [[FormationListViewController alloc] initWithNibName:@"FormationListViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)goToSondageIUTPage:(id)sender {
    
    TBXML *xml = [TBXML tbxmlWithXMLFile:@"sondage_v3" fileExtension:@"xml" error:nil];
    TBXMLElement *root = [TBXML childElementNamed:@"sondage" parentElement:xml.rootXMLElement];
    TBXMLElement *questionnaire = [TBXML childElementNamed:@"questionnaire" parentElement:root];
    [self traverseElement: questionnaire];
    
    SondageViewController *viewController = [[SondageViewController alloc] init];
    viewController.typeSondage = @"IUT";
    [self.navigationController performSelectorOnMainThread:@selector(pushViewController:animated:) withObject:viewController waitUntilDone:NO];
}

- (void) traverseElement:(TBXMLElement *)element {
    
    element = element->nextSibling;
    char* attributeValue = element->firstAttribute->value;
    NSString* value = [NSString stringWithUTF8String:attributeValue];
    
    NSString* strQID = @""; NSString* strQIntitule = @"";
    NSString* strRIntitule = @""; NSString* strRID = @"";
    
    //Check if form is for IUT
    if([value isEqual: @"IUT"]){
        //Enter Questionnaire
        element = element->firstChild;
        
        do{
            //Question
            NSLog(@"%s",element->name);
            
                //Id Question
                element = element->firstChild;
                NSLog(@"%s",element->name);
                NSLog(@"%s",element->text);
                strQID = [NSString stringWithUTF8String:element->name];
            
                //Intitule Question
                element = element->nextSibling;
                NSLog(@"%s",element->name);
                NSLog(@"%s",element->text);
                strQIntitule = [NSString stringWithUTF8String:element->name];
            
                //init array of answers
                NSMutableArray *repArray = [[NSMutableArray alloc] init];
            
                //Reponse
                element = element->nextSibling;
                do {
                    
                    //loop Reponse
                    NSLog(@"\t%s",element->name);
                    
                        //Id Reponse
                        element = element->firstChild;
                        NSLog(@"\t\t%s",element->name);
                        NSLog(@"\t\t%s",element->text);
                        strRID = [NSString stringWithUTF8String:element->text];
                        
                        //Intitule Reponse
                        element = element->nextSibling;
                        NSLog(@"\t\t%s",element->name);
                        NSLog(@"\t\t%s",element->text);
                        strRIntitule = [NSString stringWithUTF8String: element->name];
                    
                        //Get back to question
                        element = element->parentElement;
                    
                    element = element->nextSibling;
                    
                    //Create reponse object
                    Reponse *rep = [[Reponse alloc] initWithId:strRID andIntitule:strRIntitule];
                    //store into repArray
                    [repArray addObject: rep];
                    
                } while (element->nextSibling);
            
                    //last Reponse
                    NSLog(@"\t%s",element->name);
                    
                    //Id Reponse
                    element = element->firstChild;
                    NSLog(@"\t\t%s",element->name);
                    NSLog(@"\t\t%s",element->text);
                    strRID = [NSString stringWithUTF8String:element->text];
                    
                    //Intitule Reponse
                    element = element->nextSibling;
                    NSLog(@"\t\t%s",element->name);
                    NSLog(@"\t\t%s",element->text);
                    strRIntitule = [NSString stringWithUTF8String: element->name];
            
                    //Create last reponse object
                    Reponse *lastRep = [[Reponse alloc] initWithId:strRID andIntitule:strRIntitule];
                    //store into repArray
                    [repArray addObject: lastRep];
            
            
                    //Get back to question
                    element = element->parentElement;
            
            //Get back to questionnaire
            element = element->parentElement;
            
            //Create new Question with an ID, an desc and an Array of answers
            Question *newQuestion = [[Question alloc] initWithIntitule:strQIntitule andArray:repArray andIdentifiant:strQID];
            
            //store the question into the array of Questions
            [_sondageArray addObject: newQuestion];
            
        } while ((element = element->nextSibling));
    }
    
}

@end
