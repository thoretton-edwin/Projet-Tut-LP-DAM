//
//  SondageViewController.m
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "SondageViewController.h"

@interface SondageViewController ()

@end

@implementation SondageViewController

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
    
    //Start parsing
    TBXML *xml = [TBXML tbxmlWithXMLFile:@"sondage_v3" fileExtension:@"xml" error:nil];
    TBXMLElement *root = [TBXML childElementNamed:@"sondage" parentElement:xml.rootXMLElement];
    TBXMLElement *questionnaire = [TBXML childElementNamed:@"questionnaire" parentElement:root];
    
    _sondage = [[NSMutableArray alloc] init];
    
    [self traverseElement: questionnaire];
    
    
	self.title = [@"Sondage " stringByAppendingString: _typeSondage];
    NSLog(@"%@",self.title);
    _globalIndex = 0;
    
    _answerTableView.delegate = self;
    _answerTableView.dataSource = self;
    _answerTableView.backgroundColor = [UIColor clearColor];
    
    NSLog(@"Count: %d",[[[_sondage objectAtIndex: _globalIndex] reponseArray] count]);
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [self displayQuestionAtIndex:_globalIndex];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) traverseElement:(TBXMLElement *)element {
    
    if([_typeSondage isEqual: @"IUT"]){
        element = element->nextSibling;
    }
    
    char* attributeValue = element->firstAttribute->value;
    NSString* value = [NSString stringWithUTF8String:attributeValue];
    
    NSString* strQID = @""; NSString* strQIntitule = @"";
    NSString* strRIntitule = @""; NSString* strRID = @"";
    
    //Check if xml is IUT or feedback
    if([value isEqual: _typeSondage]){
        //Enter Questionnaire
        element = element->firstChild;
        
        do{
            //Question
            NSLog(@"%s",element->name);
            
            //Id Question
            element = element->firstChild;
            NSLog(@"%s",element->name);
            NSLog(@"%s",element->text);
            strQID = [NSString stringWithUTF8String:element->text];
            
            //Intitule Question
            element = element->nextSibling;
            NSLog(@"%s",element->name);
            NSLog(@"%s",element->text);
            strQIntitule = [NSString stringWithUTF8String:element->text];
            
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
                strRIntitule = [NSString stringWithUTF8String: element->text];
                
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
            strRIntitule = [NSString stringWithUTF8String: element->text];
            
            //Create last reponse object
            Reponse *lastRep = [[Reponse alloc] initWithId:strRID andIntitule:strRIntitule];
            //store into repArray
            [repArray addObject: lastRep];
            
            
            //Get back to question
            element = element->parentElement;
            
            //Get back to questionnaire
            element = element->parentElement;
            
            NSLog(@"REPONSE COUNT: %d", [repArray count]);
            
            //Create new Question with an ID, an desc and an Array of answers
            Question *newQuestion = [[Question alloc] initWithIntitule:strQIntitule andArray:repArray andIdentifiant:strQID];
            
            //store the question into the array of Questions
            [_sondage addObject: newQuestion];
            
        } while ((element = element->nextSibling));
    }
    
}

- (void) displayQuestionAtIndex:(NSInteger)index{
    NSString *strIndex = [NSString stringWithFormat:@"%d", _globalIndex+1];
    [_questionNumberLabel setText: [@"Question n° " stringByAppendingString:strIndex]];
        _questionNumberLabel.clipsToBounds=YES;
        _questionNumberLabel.layer.cornerRadius=6.0;
        _questionNumberLabel.layer.borderColor=[UIColor grayColor].CGColor;
        _questionNumberLabel.layer.borderWidth=1.0;
        _questionNumberLabel.contentMode = UIViewContentModeCenter;
    
    _questionIntituleLabel.text = [[_sondage objectAtIndex:index] intitule];
        _questionIntituleLabel.clipsToBounds=YES;
        _questionIntituleLabel.layer.cornerRadius=6.0;
        _questionIntituleLabel.layer.borderColor=[UIColor grayColor].CGColor;
        _questionIntituleLabel.layer.borderWidth=1.0;
        _questionIntituleLabel.contentMode = UIViewContentModeCenter;

}

- (IBAction)nextQuestion:(id)sender {
    if(_globalIndex+1 < [_sondage count]){
        _globalIndex ++;
        [self displayQuestionAtIndex:_globalIndex];
        [_answerTableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_sondage objectAtIndex: _globalIndex] reponseArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:indexPath.row] identifiant];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text =[[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:indexPath.row] intitule];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"ANSWER: %@",[[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:indexPath.row] intitule]);
    NSLog(@"ID: %@",[[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:indexPath.row] identifiant]);
    if(_globalIndex+1 < [_sondage count]){
        _globalIndex ++;
        [self displayQuestionAtIndex:_globalIndex];
        [_answerTableView reloadData];
    }
    
}

@end
