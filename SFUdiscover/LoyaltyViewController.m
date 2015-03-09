//
//  LoyaltyViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Modified by Riku Kenju (Interface adjustment.
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//
//  02-28 added interface elements
//  03-01 formatted interface elements
//  03-02 delegation added
//  03-05 button formatting added in DidLoad method
//

#import "LoyaltyViewController.h"

@interface LoyaltyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loyaltyToHome;
@property (weak, nonatomic) IBOutlet UILabel *displayPoints;

@end

@implementation LoyaltyViewController
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:(YES)];
}
- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:(YES)];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //scroll view intializer
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 480)];
    
    //format for button borders
    _redeemButton.layer.borderWidth = .5f;
    _redeemButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _historyButton.layer.borderWidth = .5f;
    _historyButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _participantButton.layer.borderWidth = .5f;
    _participantButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _QRScanButton.layer.borderWidth = .5f;
    _QRScanButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
