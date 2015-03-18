//
//  QRScanViewController.h
//  SFUdiscover
//
//  Created by Riku Kenju on 2015-03-05.
//  Contributors: Riku Kenju
//
//  - Created (Riku)
//  - Implemented AV Capture Interface (Riku)
//
//  Known Bugs:
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//
//  03-05 created
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//implements AV capture
@interface QRViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@end