//
//  VitrinePageViewController.h
//  IUTUnice
//
//  Created by macos on 13/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VitrinePageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *presentationImage;
@property (weak, nonatomic) IBOutlet UIScrollView *descriptionScrollView;
@property (weak, nonatomic) IBOutlet UIButton *sondageButton;
@property (weak, nonatomic) IBOutlet UIButton *formationButton;

@end
