//
//  MainMenuViewController.h
//  IUTUnice
//
//  Created by macos on 31/01/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController
{
    IBOutlet UIImageView* mImageVitrine;
    IBOutlet UIImageView* mImageCalendar;
    IBOutlet UIImageView* mImageMarks;
    IBOutlet UIImageView* mImagePostBac;
    IBOutlet UIImageView* mImageAnnuaire;
    IBOutlet UIImageView* mImageJobDating;
    IBOutlet UIImageView* mImageMap;
    IBOutlet UIImageView* mImageSUAPS;
    IBOutlet UIImageView* mImageTwitter;
    
}
@property NSMutableArray* imagesViewArray;
@property NSMutableArray* imagesRefArray;



@end
