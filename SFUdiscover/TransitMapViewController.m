//
//  TransitMapViewController.m
//  SFUdiscover
//
//  Created by Yixuan Li on 3/5/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "TransitMapViewController.h"
#import "MapPin.h"

@interface TransitMapViewController ()

@end

@implementation TransitMapViewController

@synthesize mapView, selection;
//@synthesize TMVCDelegate;

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) location{
    MKCoordinateRegion region;
    region.center.latitude = 49.277777;
    region.center.longitude = -122.917777;
    region.span.latitudeDelta = 0.0225;
    region.span.longitudeDelta = 0.0225;
    [self.mapView setRegion:region animated:YES];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *myPin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"current"];
    myPin.pinColor = MKPinAnnotationColorPurple;
    myPin.animatesDrop = TRUE;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    selection = annotation.title;
    myPin.canShowCallout = YES;
    myPin.rightCalloutAccessoryView = button;
    
    
    return myPin;
}

-(void)confirm: (id) sender{
    NSString *alertMessage = [[NSString alloc]initWithFormat:@"You have selected %@, is this the right choice?", selection];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message: alertMessage delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [self.TMVCDelegate passBack:self busStop:selection];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mapView.delegate = self;
    mapView.MapType = MKMapTypeStandard;
    [self location];
    
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    
    MapPin *transportationCenter1 = [[MapPin alloc] init];
    region.center.latitude = 49.279611;
    region.center.longitude = -122.920422;
    transportationCenter1.coordinate = region.center;
    transportationCenter1.title = @"Transportation Center 1";
    [mapView addAnnotation:transportationCenter1];
    
    MapPin *transportationCenter2 = [[MapPin alloc] init];
    region.center.latitude = 49.279553;
    region.center.longitude = -122.91987;
    transportationCenter2.coordinate = region.center;
    transportationCenter2.title = @"Transportation Center 2";
    [mapView addAnnotation:transportationCenter2];
    
    MapPin *transitExchange = [[MapPin alloc] init];
    region.center.latitude = 49.278636;
    region.center.longitude = -122.912733;
    transitExchange.coordinate = region.center;
    transitExchange.title = @"Transit Exchange";
    [mapView addAnnotation:transitExchange];
    
    MapPin *universityHighStreet = [[MapPin alloc] init];
    region.center.latitude = 49.27711;
    region.center.longitude = -122.909425;
    universityHighStreet.coordinate = region.center;
    universityHighStreet.title = @"University High Street";
    [mapView addAnnotation:universityHighStreet];
    
    MapPin *scienceRoad = [[MapPin alloc] init];
    region.center.latitude = 49.276592;
    region.center.longitude = -122.916056;
    scienceRoad.coordinate = region.center;
    scienceRoad.title = @"Science Road";
    [mapView addAnnotation:scienceRoad];
    
    MapPin *westCampusRoad = [[MapPin alloc] init];
    region.center.latitude = 49.281219;
    region.center.longitude = -122.92824;
    westCampusRoad.coordinate = region.center;
    westCampusRoad.title = @"West Campus Road";
    [mapView addAnnotation:westCampusRoad];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
