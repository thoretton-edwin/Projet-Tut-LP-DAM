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
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    [[UIImage imageNamed:@"appBackground.png"] drawInRect:[UIScreen mainScreen].bounds];
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
    
    
    _myUiscrollView.layer.cornerRadius=6.0;
    _myUiscrollView.layer.borderColor=[UIColor grayColor].CGColor;
    _myUiscrollView.layer.borderWidth=1.0;
    _myUiscrollView.contentMode = UIViewContentModeCenter;

    
    _myUiscrollView.text = presentationText;
    _myUiscrollView.textColor = [UIColor blackColor];
    _myUiscrollView.font =[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    //[_myUiscrollView setBackgroundColor:[UIColor clearColor]];
    _myUiscrollView.editable = NO;
    _myUiscrollView.scrollEnabled = YES;

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
