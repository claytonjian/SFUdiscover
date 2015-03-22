//
//  AgendaViewController.h
//  SFUdiscover
//
//  Created by James Voong on 3/8/15.
//  Contributors: James Voong
//
//  - Created and added UIViewController (James)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventTableViewController.h"

@interface AgendaViewController : UIViewController<AddEventTableViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableEvents;
@property (nonatomic, strong) NSArray *arrEvents;

-(void)loadEvents;

@end
