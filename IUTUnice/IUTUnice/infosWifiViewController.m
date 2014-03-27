//
//  infosWifiViewController.m
//  IUTUnice
//
//  Created by Wazany on 21/03/2014.
//  Copyright (c) 2014 UNS. All rights reserved.
//

#import "infosWifiViewController.h"

@interface infosWifiViewController ()

@end

@implementation infosWifiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title= @"Infos Wifi";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UILabel *labeltitle= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    labeltitle.text=@"HOME";
    labeltitle.textColor=[UIColor whiteColor];
    labeltitle.backgroundColor= [UIColor blackColor];
    labeltitle.textAlignment = NSTextAlignmentCenter;
    labeltitle.font= [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.titleView = labeltitle;
    
    // Create view loader include spinner
    
    UIView *viewLoader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    viewLoader.backgroundColor= [UIColor whiteColor];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 240);
    spinner.hidesWhenStopped = YES;
    [viewLoader addSubview:spinner];
    
    [self.view addSubview:viewLoader];
    
    [spinner startAnimating];
    

    
    
    
}

/*- (void) traverseElement:(TBXMLElement *)element {
    
    do {
        
        if ([[TBXML elementName:element] isEqualToString:@"categories"]) {
            NSLog(@"Categories Found");
            TBXMLElement *catElement = [TBXML childElementNamed:@"category" parentElement:element];
            if (catElement) {
                NSLog(@"Cat FOund");
                do {
                    MyCategory *aCat = [[MyCategory alloc] init];
                    TBXMLAttribute * attribute = catElement->firstAttribute;
                    while (attribute) {
                        if ([[TBXML attributeName:attribute] isEqualToString:@"id"]) {
                            aCat.idCat = [[TBXML attributeValue:attribute] intValue];
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"sort"]) {
                            aCat.sortCat = [[TBXML attributeValue:attribute] intValue];
                        }
                        if ([[TBXML attributeName:attribute] isEqualToString:@"name"]) {
                            aCat.nameCat = [TBXML attributeValue:attribute] ;
                        }
                        attribute = attribute->next;
                    }
                    
                    TBXMLElement *elementElem = [TBXML childElementNamed:@"element" parentElement:catElement];
                    aCat.ElmntCat = [[NSMutableArray alloc] init];
                    if (elementElem) {
                        NSLog(@"Elmnt Found");
                        do {
                            Element *aElement = [[Element alloc] init];
                            TBXMLAttribute * attribute = elementElem->firstAttribute;
                            while (attribute) {
                                if ([[TBXML attributeName:attribute] isEqualToString:@"id"]) {
                                    aElement.ID = [[TBXML attributeValue:attribute] intValue];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"sort"]) {
                                    aElement.sort = [[TBXML attributeValue:attribute] intValue];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"name"]) {
                                    aElement.name = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"subname"]) {
                                    aElement.subname = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"descr"]) {
                                    aElement.descr = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"image"]) {
                                    aElement.image = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"image_large"]) {
                                    aElement.image_large = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"phone"]) {
                                    aElement.phone = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"email"]) {
                                    aElement.email = [TBXML attributeValue:attribute];
                                }
                                if ([[TBXML attributeName:attribute] isEqualToString:@"bundle"]) {
                                    aElement.bundle = [TBXML attributeValue:attribute];
                                }
                                
                                
                                attribute = attribute->next;
                            }
                            
                            [aCat.ElmntCat addObject:aElement];
                            
                        } while ((elementElem = elementElem->nextSibling));
                    }
                    else {
                        //NSLog(@"No Session for EventID : %i",aEvent.ID);
                    }
                    
                    aCat.ElmntCat = [[NSMutableArray alloc] initWithArray:[aCat.ElmntCat sortedArrayUsingDescriptors: [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"sort" ascending:YES]]]];
                    [self.categories addObject:aCat];
                    
                } while ((catElement = catElement->nextSibling));
            }
            else {
                
            }
        }
		if (element->firstChild) [self traverseElement:element->firstChild];
	} while ((element = element->nextSibling));
    
}*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    NSString *CellIdentifier = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        

        
        
    }
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
