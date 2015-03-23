//
//  SubscribedAccountsViewController.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/2015.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubscribedAccountsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableAccounts;

@property(nonatomic, strong) NSArray *arrSubscribedAccounts;

-(NSArray *)getSubscribedAccounts;

@end
