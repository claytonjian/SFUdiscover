//
//  NavigationViewController.h
//  Header file for the Navigation View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian
//
//  - Created delegates for viewing the map, search function, and adding favorites screen (to be implemented)
//  - Declared a scroll view
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface NavigationViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate, UIAlertViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic, readonly) IBOutlet UIScrollView *scrollView;

@end


