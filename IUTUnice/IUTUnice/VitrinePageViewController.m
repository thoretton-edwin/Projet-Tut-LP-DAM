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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Bienvenue à l'IUT";
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _sondageArray = [[NSMutableArray alloc] init];
    
    _presentationImage.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"nice.jpg"],
                                          [UIImage imageNamed:@"nice2.jpg"],
                                          [UIImage imageNamed:@"menton.jpg"],
                                          [UIImage imageNamed:@"menton2.jpg"],
                                          [UIImage imageNamed:@"sophia.jpg"],nil];
    
    _presentationImage.contentMode = UIViewContentModeScaleAspectFit;
    
    NSString *myPath = [[NSBundle mainBundle]pathForResource:@"descriptionIUT" ofType:@"txt"];
    
    NSString *presentationText = [[NSString alloc]initWithContentsOfFile:myPath encoding:NSUTF8StringEncoding error:nil];
    
    UITextView *myUITextView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,_descriptionScrollView.frame.size.width,_descriptionScrollView.frame.size.height)];
    
    _descriptionScrollView.clipsToBounds=YES;
    _descriptionScrollView.layer.cornerRadius=6.0;
    _descriptionScrollView.layer.borderColor=[UIColor grayColor].CGColor;
    _descriptionScrollView.layer.borderWidth=1.0;
    _descriptionScrollView.contentMode = UIViewContentModeCenter;
    
    myUITextView.text = presentationText;
    myUITextView.textColor = [UIColor blackColor];
    myUITextView.font =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [myUITextView setBackgroundColor:[UIColor clearColor]];
    myUITextView.editable = NO;
    myUITextView.scrollEnabled = YES;
    [_descriptionScrollView addSubview:myUITextView];
}

-(void)viewWillAppear:(BOOL)animated{
    _imageCount = 0;
    [self updatePhoto];
    _slideshowTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(photoCounter) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)photoCounter {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.90];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_presentationImage cache:NO];
    [self updatePhoto];
    [UIView commitAnimations];
}

- (void)updatePhoto {
    _presentationImage.image = [_presentationImage.animationImages objectAtIndex:_imageCount];
    (_imageCount == [_presentationImage.animationImages count]-1) ? _imageCount = 0 : _imageCount++;
}

- (IBAction)goToFormationListPage:(id)sender {
    FormationListViewController *viewController = [[FormationListViewController alloc] initWithNibName:@"FormationListViewController" bundle:nil];
    [_slideshowTimer invalidate];
    [self.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)goToSondageIUTPage:(id)sender {
    SondageViewController *viewController = [[SondageViewController alloc] initWithNibName:@"SondageViewController" bundle:nil];
    viewController.typeSondage = @"IUT";
    [_slideshowTimer invalidate];
    [self.navigationController performSelectorOnMainThread:@selector(pushViewController:animated:) withObject:viewController waitUntilDone:NO];
}

@end
