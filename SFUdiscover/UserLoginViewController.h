//
//  UserLoginViewController.h
//  Header file for the User Login View Controller
//
//  SFUdiscover
//
//  Created by Yixuan Li on 2015-03-10.
//  Contributors: Yixuan Li
//
//  - Setup protocol for delegation to inform main menu user successfully logged in
//  - Declared delegate and keychain
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JNKeychain.h"

@protocol UserLoginViewControllerDelegate
- (void)UserLoginDidFinish;
@end

@interface UserLoginViewController : UIViewController <UITextFieldDelegate> {
    JNKeychain *keychain;
}

@property (nonatomic, strong) id<UserLoginViewControllerDelegate> delegate;

@end


