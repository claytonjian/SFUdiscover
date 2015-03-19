//
//  NarrowSearchViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 3/18/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NarrowSearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (weak, nonatomic) NSString *tableSelected;

@end
