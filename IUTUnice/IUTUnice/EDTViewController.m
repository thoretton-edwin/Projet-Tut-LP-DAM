//
//  EDTViewController.m
//  IUTUnice
//
//  Created by Edwin Thoretton on 13/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "EDTViewController.h"

@interface EDTViewController ()

@end

@implementation EDTViewController
@synthesize spinnerCircle;
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
    [spinnerCircle startAnimating];
	[self addEvent];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"calshow://"]];
	[spinnerCircle stopAnimating];
	
	//http://stackoverflow.com/questions/15742231/how-to-open-native-ios-calendar-from-my-app
	
	
}

-(void) addEvent
{
	EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent *event = [EKEvent eventWithEventStore:store];
        event.title = @"Event Title";
        event.startDate = [NSDate date]; //today
        event.endDate = [event.startDate dateByAddingTimeInterval:60*60];  //set 1 hour meeting
        [event setCalendar:[store defaultCalendarForNewEvents]];
        NSError *err = nil;
        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
        NSString *savedEventId = event.eventIdentifier;  //this is so you can access this event later
    }];
}

-(void)removeEvent:(NSString*)savedEventId
{
	EKEventStore* store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent* eventToRemove = [store eventWithIdentifier:savedEventId];
        if (eventToRemove) {
            NSError* error = nil;
            [store removeEvent:eventToRemove span:EKSpanThisEvent commit:YES error:&error];
        }
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
