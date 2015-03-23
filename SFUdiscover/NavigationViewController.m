//
//  NavigationViewController.m
//  Implementation file for the Navigation View Controller
//
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Contributors: Clayton Jian, James Voong
//
//  - Declared a scroll view for the zooming map image, an image view for the map, a mutable array for the available
//    location search options, arrays for different navigation options, buildings, and the search results
//  - Added functions to enable zooming of image, search functionality, and displaying of items and search results
//
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NavigationViewController.h"
#import "NavSearchResultsViewController.h"
#import "NarrowSearchViewController.h"

@interface NavigationViewController (){
    CLLocationManager *locationManager;
}

// created data types for use in view controller

@property (strong, nonatomic, readwrite) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSMutableArray *searchOptions;
@property (strong, nonatomic) NSArray *navOptions;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSArray *buildings;
@property (strong, nonatomic) NSArray *restaurants;
@property (strong, nonatomic) NSArray *restaurantLocs;

@property (weak, nonatomic) NSString *result;

@property (weak, nonatomic) IBOutlet UITableView *searchTable;
@property (weak, nonatomic) NSString *tableSelected;


@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;
@property (weak, nonatomic) IBOutlet UIButton *recentButton;
@property (weak, nonatomic) IBOutlet UIButton *getLoc;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) NSString *longValue;
@property (weak, nonatomic) NSString *latValue;


// declare functions for use in scroll view

- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;

@end

@implementation NavigationViewController

@synthesize scrollView = _scrollView;
@synthesize imageView = _imageView;

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:(YES)];
}

- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:(YES)];
}
- (IBAction)getUserLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    [locationManager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longValue = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latValue = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // recenters contents of scroll view
    
    [self centerScrollViewContents];
    
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // return view that you wish to zoom
    return self.imageView;
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
    // zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.scrollView.zoomScale / 1.5f;
    newZoomScale = MAX(newZoomScale, self.scrollView.minimumZoomScale);
    [self.scrollView setZoomScale:newZoomScale animated:YES];
    
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // zoom in map with double tapping
    CGPoint pointInView = [recognizer locationInView:self.imageView];
    
    CGFloat newZoomScale = self.scrollView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, self.scrollView.maximumZoomScale);
    
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:rectToZoomTo animated:YES];
    
}


- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    [self.searchTable setHidden:YES];
    
    
    // load map to image view
    UIImage *image = [UIImage imageNamed:@"SFU Burnaby.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.imageView setFrame:CGRectMake(250, 840, 14843.75, 9500)];
    [self.view addSubview:self.imageView];
    [self.scrollView addSubview:self.imageView];
    [self.imageView addSubview:self.favoritesButton];
    [self.imageView addSubview:self.recentButton];
    [self.imageView addSubview:self.getLoc];
    [self.imageView bringSubviewToFront:self.favoritesButton];
    [self.imageView bringSubviewToFront:self.recentButton];
    [self.imageView bringSubviewToFront:self.getLoc];
    
    // create available search options for search bar
    self.navOptions = [[NSArray alloc] initWithObjects:@"Building", @"Room", @"Recent", @"Favorites", @"Nearest Amenity", @"Restaurants", nil];
    self.searchResults = [[NSMutableArray alloc]init];
    self.buildings = [[NSArray alloc]initWithObjects:   @"Academic Quadrangle (AQ)",
                      @"Alcan Aquatic Research Centre (AAB)",
                      @"Applied Science Building (ASB)",
                      @"Blusson Hall (BLU)",
                      @"Bee Research Building (BEE)",
                      @"Childcare Centre (CCC)",
                      @"Diamond Alumni Centre (DAC)",
                      @"Dining Hall (DH)",
                      @"Discovery 1 (DIS1)",
                      @"Discovery 2 (DIS2)",
                      @"Education Building (EDB)",
                      @"Facilities Services (FS)",
                      @"Greenhouses (GH)",
                      @"Halpern Centre (HC)",
                      @"Lorne Davies Complex (LDC)",
                      @"Maggie Benston Centre (MBC)",
                      @"Robert C. Brown Hall (RCB)",
                      @"Saywell Hall (SWH)",
                      @"Shrum Science Centre Biology (SCB)",
                      @"Shrum Science Centre Chemistry (SCC)",
                      @"Shrum Science Centre Kinesiology (SCK)",
                      @"Science Research Annex (SRA)",
                      @"Strand Hall (SH)",
                      @"Strand Hall Annex (SHA)",
                      @"T3 - Archaeology Trailer (T3)",
                      @"Technology & Science Complex 1 (TASC 1)",
                      @"Technology & Science Complex 2 (TASC 2)," ,
                      @"Transportation Centre (TC)",
                      @"University Theatre (TH)",
                      @"W.A.C. Bennett Library (LIB)",
                      @"West Mall Centre (WMC)",
                      @"Water Tower Building (WTB)", nil];
    self.restaurants = [[NSArray alloc]initWithObjects: @"Renaissance Coffee",
                        @"Club Illia",
                        @"Spicy Stone",
                        @"Yeti Yogurt",nil];
    self.restaurantLocs = [[NSArray alloc]initWithObjects:@"Cornerstone", nil];
    self.searchOptions = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [self.navOptions count]; i++) {
        [self.searchOptions addObject:[self.navOptions objectAtIndex:i]];
    }
    for (int i = 0; i < [self.buildings count]; i++){
        [self.searchOptions addObject:[self.buildings objectAtIndex:i]];
    }
    for (int i = 0; i < [self.restaurants count]; i++){
        [self.searchOptions addObject:[self.restaurants objectAtIndex:i]];
    }
    for(int i = 0; i < [self.restaurantLocs count]; i++){
        [self.searchOptions addObject:[self.restaurantLocs objectAtIndex:i]];
    }
    
    
    self.scrollView.contentSize = image.size;
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
    twoFingerTapRecognizer.numberOfTapsRequired = 1;
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    [self.scrollView addGestureRecognizer:twoFingerTapRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect scrollViewFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    self.scrollView.minimumZoomScale = minScale;
    
    self.scrollView.maximumZoomScale = 1.0f;
    self.scrollView.zoomScale = minScale;
    
    [self centerScrollViewContents];
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //returns number of rows the search will display
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.searchOptions count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // writes the search option to each row
    static NSString *simpleTableIdentifier = @"showSearchDetail";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [self.searchOptions objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void) filterSearchResults: (NSString *)searchText scope:(NSString *)scope{
    // filters search results by keywords that contain search parameter
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF BEGINSWITH[c] %@", searchText];
    if([[self.searchOptions filteredArrayUsingPredicate:predicate] count] == 0){
        predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchText];
    }
    self.searchResults = [self.searchOptions filteredArrayUsingPredicate:predicate];
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterSearchResults:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableSelected = @"";
    if([[self.searchResults objectAtIndex:indexPath.row] isEqualToString:(@"Favorites")]){
        self.tableSelected = @"Favorites";
        [self performSegueWithIdentifier:@"NarrowSearch" sender:self];
    }
    else if ([[self.searchResults objectAtIndex:indexPath.row] isEqualToString:(@"Recent")]){
        self.tableSelected = @"Recent";
        [self performSegueWithIdentifier:@"NarrowSearch" sender:self];
    }
    else if ([[self.searchResults objectAtIndex:indexPath.row] isEqualToString:(@"Restaurants")]){
        self.tableSelected = @"RestaurantLocs";
        [self performSegueWithIdentifier:@"NarrowSearch" sender:self];
    }
    else{
        self.result = [self.searchResults objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"SearchResults" sender:self];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([self.tableSelected isEqualToString:@"Favorites"] || [self.tableSelected isEqualToString:@"Recent"] || [self.tableSelected isEqualToString:@"RestaurantLocs"]){
        NarrowSearchViewController *NS = [segue destinationViewController];
        NS.tableSelected = self.tableSelected;
        NS.restaurantLocs = self.restaurantLocs;
        NS.restaurants = self.restaurants;
    }
    else{
        NavSearchResultsViewController *NSR = [segue destinationViewController];
        NSR.title = self.result;
    }
}


@end
