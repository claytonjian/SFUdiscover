//
//  NewsFeedCardTableViewCell.h
//  SFUdiscover
//
//  Created by Bonnie Ha on 2015-03-14.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedCardTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *sourceButton;
@property (weak, nonatomic) IBOutlet UITextView *messageText;

@property (weak, nonatomic) IBOutlet UIView *cardView;


@end
