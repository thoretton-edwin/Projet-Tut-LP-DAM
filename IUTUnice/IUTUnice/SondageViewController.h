//
//  SondageViewController.h
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "Reponse.h"

@interface SondageViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>

@property NSString* typeSondage;
@property NSMutableArray *sondage;
@property int globalIndex;

@property (weak, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionIntituleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;
@property (weak, nonatomic) IBOutlet UIPickerView *answerPickerView;

- (IBAction)nextQuestion:(id)sender;

@end
