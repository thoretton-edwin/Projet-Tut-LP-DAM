//
//  SondageViewController.h
//  IUTUnice
//
//  Created by VM Mac on 26/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"
#import "Question.h"
#import "Reponse.h"

@interface SondageViewController : UIViewController <UITableViewDelegate,UITableViewDelegate>

@property NSString* typeSondage;
@property NSMutableArray *sondage;
@property int globalIndex;
@property NSMutableArray *answerArray;

@property (weak, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionIntituleLabel;
@property (weak, nonatomic) IBOutlet UITableView *answerTableView;

@end
