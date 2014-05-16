//
//  EDTViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
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

-(EKEventStore*) addEvent
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
	
	return store;
}

-(EKEventStore*)removeEvent:(NSString*)savedEventId
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
	return store;
}

- (void)eventViewController:(EKEventViewController *)controller didCompleteWithAction:(EKEventViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[spinnerCircle startAnimating];
	
	//EKEventStore *store =[self addEvent];
	 
	[spinnerCircle stopAnimating];
	
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Synchronisation terminée" message:@"Votre emploi du temps est à jour" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Voir mon EDT", nil];
	
	[alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex==0)
	{
		[self.navigationController popViewControllerAnimated:YES];
	}
	else
	{
		[self.navigationController popViewControllerAnimated:YES];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"calshow://"]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
