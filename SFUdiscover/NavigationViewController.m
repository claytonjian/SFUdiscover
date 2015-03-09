//
//  NavigationViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 2015-02-27.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController (){
    // CGRect bHallFrame;
}

@property (weak, nonatomic) IBOutlet UIButton *navigationToHome;
@property (strong, nonatomic, readwrite) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *navOptions;
@property (strong, nonatomic) NSArray *searchResults;

/*
@property (strong, nonatomic) IBOutlet UIView *buttons;
@property (weak, nonatomic) IBOutlet UIButton *bHall;
 */

- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;

@end

@implementation NavigationViewController

@synthesize scrollView = _scrollView;
@synthesize imageView = _imageView;

// @synthesize buttons = _buttons;


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

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so you need to re-center the contents
    
    [self centerScrollViewContents];
    
    /*
     self.bHall.frame = CGRectMake((bHallFrame.origin.x * self.scrollView.zoomScale),
                                  (bHallFrame.origin.y * self.scrollView.zoomScale),
                                  bHallFrame.size.width,
                                  bHallFrame.size.height);
    */
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that you want to zoom
    return self.imageView;
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.scrollView.zoomScale / 1.5f;
    newZoomScale = MAX(newZoomScale, self.scrollView.minimumZoomScale);
    [self.scrollView setZoomScale:newZoomScale animated:YES];
    
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // 1
    CGPoint pointInView = [recognizer locationInView:self.imageView];
    
    // 2
    CGFloat newZoomScale = self.scrollView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, self.scrollView.maximumZoomScale);
    
    // 3
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    // 4
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
    // bHallFrame = self.bHall.frame;
    
    
    
    // 1
    UIImage *image = [UIImage imageNamed:@"Page1.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    // factor of 1.5625
    // Blusson Hall - (5237, 900)
    [self.imageView setFrame:CGRectMake(250, 840, 14218.75, 9100)];
    [self.scrollView addSubview:self.imageView];
    
    NSLog(@"The image has width %f", image.size.width);
    NSLog(@"The image has height %f", image.size.height);
    
    /*
    self.bHall = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.bHall addTarget:self action:@selector(aMethod:)forControlEvents:UIControlEventTouchUpInside];
    [self.bHall setTitle:@"Blusson Hall" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.bHall];
    bHallFrame.origin.x = 8182.8125;
    bHallFrame.origin.y = 1406.25;
    NSLog(@"The X Coordinate of bHall is %f", bHallFrame.origin.x);
    NSLog(@"The width of map is %f", self.imageView.frame.size.width);
    */
    self.navOptions = [[NSArray alloc] initWithObjects:@"Building", @"Room", @"Recent", @"Favorites", @"Nearest Amenity", nil];
    self.searchResults = [[NSArray alloc]init];
    
    
    // 2
    self.scrollView.contentSize = image.size;
    
    // 3
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
    
    // 4
    CGRect scrollViewFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    self.scrollView.minimumZoomScale = minScale;
    
    // 5
    self.scrollView.maximumZoomScale = 1.0f;
    self.scrollView.zoomScale = minScale;
    
    // 6
    [self centerScrollViewContents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    }
    else{
        return [self.navOptions count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [self.navOptions objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void) filterSearchResults: (NSString *)searchText scope:(NSString *)scope{
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF contains[c] %@", searchText];
    self.searchResults = [self.navOptions filteredArrayUsingPredicate:predicate];
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterSearchResults:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
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
