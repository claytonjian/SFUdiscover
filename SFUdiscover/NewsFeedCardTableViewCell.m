//
//  NewsFeedCardTableViewCell.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 2015-03-14.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NewsFeedCardTableViewCell.h"

@implementation NewsFeedCardTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [self cardSetup];
}

- (void) cardSetup
{
    [self.cardView setAlpha:1];
    self.cardView.layer.masksToBounds = NO;
    self.cardView.layer.cornerRadius = 1;
    
    // create shadow
    self.cardView.layer.shadowOffset = CGSizeMake(-.2f, .2f);
    self.cardView.layer.shadowRadius = 1;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.cardView.bounds];
    self.cardView.layer.shadowPath = path.CGPath;
    self.cardView.layer.shadowOpacity = 0.2;
}

@end
