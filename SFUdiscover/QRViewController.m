//
//  QRScanViewController.m
//  SFUdiscover
//
//  Created by Riku Kenju on 2015-03-05.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//
//  03-05 Added buttons, views and other interface elements
//  03-06 Implemented QR scanner code
//  03-07 Implemented button behaviors
//

#import "QRViewController.h"


@interface QRViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QRScanToHome;
@property (weak, nonatomic) IBOutlet UIView *preview;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (nonatomic) BOOL isScanning;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic, strong) AVCaptureSession *capture;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation QRViewController


- (IBAction)StartStopScan:(id)sender {
    
    //change the button label depending on the state
    if (!_isScanning) {
        if ([self startScan]) {
            [_startButton setTitle:@"Stop" forState:normal];
        }
    }
    else {
        [self stopScan];
        [_startButton setTitle:@"Scan" forState:normal];
        
    }
    
}


- (BOOL) startScan {
    
    NSError *error;
    
    //will be capturing Video
    AVCaptureDevice *capDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:capDevice error:&error];
    
    //if for any reason the camera could not be started, give error log and quit this method
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    //initialize capturesession object for use
    _capture = [[AVCaptureSession alloc] init];
    [_capture addInput:input];
    
    //use captureSession object with the delegate to intercept any QR code captured by the camera
    //captureSession object needs input AND output to work properly
    AVCaptureMetadataOutput *capMetaOut = [[AVCaptureMetadataOutput alloc] init];
    [_capture addOutput:capMetaOut];
    
    //create queue to hold methods for the delegate
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    
    //set this class as the delegate for the captureMetadataOutput object
    [capMetaOut setMetadataObjectsDelegate:self queue:dispatchQueue];
    //set object type to QR code
    [capMetaOut setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_capture];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setFrame:_preview.layer.bounds];
    [_preview.layer addSublayer: _previewLayer];
    
    [_capture startRunning];
    
    return YES;
    
}

- (void) captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    //make sure the NSArray is not nil and has at least one object in it
    if (metadataObjects != nil && [metadataObjects count] > 0){
        AVMetadataMachineReadableCodeObject *metaObj = [metadataObjects objectAtIndex:0];
        if ([[metaObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            [_status performSelectorOnMainThread:@selector(setText:) withObject:[metaObj stringValue] waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(stopScan) withObject:nil waitUntilDone:NO];
            [_startButton performSelectorOnMainThread:@selector(setTitle:) withObject:@"Scan" waitUntilDone:NO];
            _isScanning = NO;
        }
        
    }
}

- (void) stopScan{
    
    [_capture stopRunning];
    _capture = nil;
    [_previewLayer removeFromSuperlayer];
}


- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:(YES)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialize the scan button to "Scan"
    
    _isScanning = NO;
    _capture = nil;
}

@end