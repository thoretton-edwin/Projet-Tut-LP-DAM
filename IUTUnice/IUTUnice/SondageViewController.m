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
	self.title = [@"Sondage " stringByAppendingString: _typeSondage];
    _globalIndex = 0;
    
    _answerPickerView.delegate = self;
    _answerPickerView.dataSource = self;
    
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
        [_answerPickerView reloadAllComponents];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[[_sondage objectAtIndex: _globalIndex] reponseArray] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:row] intitule];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"ANSWER: %@",[[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:row] intitule]);
    NSLog(@"ID: %@",[[[[_sondage objectAtIndex: _globalIndex] reponseArray] objectAtIndex:row] identifiant]);
    if(_globalIndex+1 < [_sondage count]){
        
        _globalIndex ++;
        [self displayQuestionAtIndex:_globalIndex];
        [_answerPickerView reloadAllComponents];
    }
}
@end
