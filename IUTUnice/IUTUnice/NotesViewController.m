//
//  NotesViewController.m
//  IUTUnice
//
//  Created by Wazany on 14/02/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "NotesViewController.h"

@interface NotesViewController ()

@end

@implementation NotesViewController
@synthesize accordionN1;
@synthesize accordionN2;
@synthesize accordionN3;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
                //[self.accordion ]
        tab = [[NSMutableArray alloc]init];
        [tab addObject:@"mat1"];
        [tab addObject:@"mat2"];
        [tab addObject:@"mat3"];
        [tab addObject:@"mat4"];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.accordionN1 = [[OCBorghettiView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    self.accordionN1.accordionSectionHeight = 40;
    self.accordionN1.accordionSectionFont = [UIFont fontWithName:@"Notes" size:16];
    self.accordionN1.accordionSectionBorderColor = [UIColor darkGrayColor];
    self.accordionN1.accordionSectionColor = [UIColor grayColor];
    
    self.accordionN2 = [[OCBorghettiView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height - 64)];

    self.accordionN2.accordionSectionHeight = 40;
    self.accordionN2.accordionSectionFont = [UIFont fontWithName:@"Notes" size:16];
    self.accordionN2.accordionSectionBorderColor = [UIColor darkGrayColor];
    self.accordionN2.accordionSectionColor = [UIColor grayColor];
    
    NSLog(@"test accordion");
    
    
    
    UIView *vue1 = [[UIView alloc]init];
    [vue1 setTag:1];
    [self.accordionN1 addSectionWithTitle:@"Semestre 1"
                                andView:accordionN2];
    UIView *vue2 = [[UIView alloc]init];
    [vue2 setTag:2];
    [self.accordionN1 addSectionWithTitle:@"Semestre 2"
                                andView:vue2];
    
    
    UIView *vue3 = [[UIView alloc]init];
    [vue3 setTag:1];
    [self.accordionN1 addSectionWithTitle:@"Semestre 3"
                                andView:vue3];
    UIView *vue4 = [[UIView alloc]init];
    [vue4 setTag:2];
    [self.accordionN1 addSectionWithTitle:@"Semestre 4"
                                andView:vue4];
    
    // *********** UE ********************
    
    
    UITableView *matieres1 = [[UITableView alloc]init];
    UITableView *matieres2 = [[UITableView alloc]init];
    
    [self.accordionN2 addSectionWithTitle:@"\tUE1"
                                  andView:matieres1];
  

    [self.accordionN2 addSectionWithTitle:@"\tUE2"
                                  andView:matieres2];
    
    matieres1.delegate = self;
    matieres1.dataSource= self;
    matieres2.delegate=self;
    matieres2.dataSource=self;
    [matieres1 reloadData];
    [matieres2 reloadData];
    
    //************ matiere ****************
    



    
    
    
    [self.view addSubview:self.accordionN1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tab count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"borghetti_cell"];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"borghetti_cell"];
    
    NSLog(@"%@",[tab objectAtIndex:indexPath.row]);
    cell.textLabel.text = [tab objectAtIndex:indexPath.row];
    /*
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:16];
    cell.textLabel.text = [NSString stringWithFormat:@"Table %d - Cell %d", tableView.tag, indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:0.46f green:0.46f blue:0.46f alpha:1.0f];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    */
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
