//
//  NavSearchResultsViewController.m
//  SFUdiscover
//
//  Created by Clayton Jian on 3/12/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "NavSearchResultsViewController.h"

@interface NavSearchResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentResult;
@property (weak, nonatomic) NSString *title;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@property (strong, nonatomic) NSMutableArray *favorites;
@property (strong, nonatomic) NSMutableArray *recents;
@property (strong, nonatomic) NSUserDefaults *prefs;
@property (nonatomic, assign) int index;
@end

@implementation NavSearchResultsViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)toggleFavorite:(id)sender {
    self.favoriteButton.selected = !self.favoriteButton.selected;
    if(self.favoriteButton.selected == YES){
        [self.favoriteButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self.favorites addObject: self.title];
        [self.favorites sortUsingSelector:@selector(caseInsensitiveCompare:)];
        [self.prefs setObject:self.favorites forKey:@"favorites"];
    }
    else{
        [self.favoriteButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.favorites removeObject:self.title];
        [self.prefs setObject:self.favorites forKey:@"favorites"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentResult.text = self.title;
    self.index = [self.favorites indexOfObject:self.title];
    self.prefs = [NSUserDefaults standardUserDefaults];
    self.favorites = [self.prefs mutableArrayValueForKey:@"favorites"];
    self.recents = [self.prefs mutableArrayValueForKey:@"recents"];
    if ([self.favorites containsObject:self.title] == YES){
        self.favoriteButton.selected = YES;
    }
    if([self.recents containsObject:self.title]){
        [self.recents removeObject:self.title];
    }
    [self.recents addObject:self.title];
    [self.prefs setObject:self.recents forKey:@"recents"];
    for (int i = 0; i < [self.recents count]; i++){
        NSLog(@"Object %i is %@", i, [self.recents objectAtIndex:i]);
    }
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
