//
//  MainMenuViewController.h
//  IUTUnice
//
//  Created by macos on 31/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VitrinePageViewController.h"

@interface MainMenuViewController : UIViewController
{
    
    
}
@property (weak, nonatomic) IBOutlet UIView *iconView1;
@property (weak, nonatomic) IBOutlet UIView *iconView2;
@property (weak, nonatomic) IBOutlet UIView *iconView3;
@property (weak, nonatomic) IBOutlet UIView *iconView4;
@property (weak, nonatomic) IBOutlet UIView *iconView5;
@property (weak, nonatomic) IBOutlet UIView *iconView6;
@property (weak, nonatomic) IBOutlet UIView *iconView7;
@property (weak, nonatomic) IBOutlet UIView *iconView8;
@property (weak, nonatomic) IBOutlet UIView *iconView9;


@property NSMutableArray* imagesViewArray;
@property NSMutableArray* imagesRefArray;
@property NSMutableArray* cadreViewArray;



@end
