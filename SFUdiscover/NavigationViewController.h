//
//  NavigationViewController.h
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *SFUBurnaby;
@property (strong, nonatomic, readonly) IBOutlet UIScrollView *scrollView;


@end
