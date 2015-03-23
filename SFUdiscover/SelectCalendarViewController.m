//
//  SelectCalendarViewController.m
//  SFUdiscover
//
//  Created by Bonnie Ha on 3/21/15.
//  Copyright (c) 2015 EngagingFoundations. All rights reserved.
//

#import "SelectCalendarViewController.h"
#import "AppDelegate.h"

@interface SelectCalendarViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation SelectCalendarViewController

NSUInteger _selectedIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Make self the delegate and datasource of the table view
    self.calendarTableView.delegate = self;
    self.calendarTableView.dataSource = self;
    
    // Instantiate the appDelegate property, so we can access its eventManager property
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    _selectedIndex = [self.calendarArray indexOfObject:self.calendarArray];
    
    [self loadEventCalendars];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadEventCalendars {
    
    self.calendarArray = [self.appDelegate.eventManager getLocalEventCalendars];
    
    [self.calendarTableView reloadData];
    
}
- (IBAction)editCalendars:(id)sender {
    
    // Set the table in editing mode.
    [self.calendarTableView setEditing:!self.calendarTableView.isEditing animated:YES];
    
    // Reload the table view.
    [self.calendarTableView reloadData];
}

- (IBAction)backToAddEvent:(id)sender {
    
    // Pop the current view controller from the navigation stack.
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createCalendar{
    
    // Hide the keyboard. To do so, it's necessary to access the textfield of the first cell.
    UITextField *textfield = (UITextField *)[[self.calendarTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] viewWithTag:10];
    [textfield resignFirstResponder];
    
    /*
    // In case that no text was typed in the textfield then do nothing.
    if (textfield.text.length == 0) {
        return;
    }*/
    
    // Create a new calendar.
    EKCalendar *calendar = [EKCalendar calendarForEntityType:EKEntityTypeEvent
                                                  eventStore:self.appDelegate.eventManager.eventStore];
    
    // Set the calendar title.
    //calendar.title = textfield.text;
    calendar.title = @"Known Bug: does not accept text";
    
    // Find the proper source type value.
    for (int i=0; i<self.appDelegate.eventManager.eventStore.sources.count; i++) {
        EKSource *source = (EKSource *)[self.appDelegate.eventManager.eventStore.sources objectAtIndex:i];
        EKSourceType currentSourceType = source.sourceType;
        
        if (currentSourceType == EKSourceTypeLocal) {
            calendar.source = source;
            break;
        }
    }
    
    // Save and commit the calendar.
    NSError *error;
    [self.appDelegate.eventManager.eventStore saveCalendar:calendar commit:YES error:&error];
    
    // If no error occurs then turn the editing mode off, store the new calendar identifier and reload the calendars.
    if (error == nil) {
        
        // Turn off the edit mode.
        [self.calendarTableView setEditing:NO animated:YES];
        
        // Store the calendar identifier.
        [self.appDelegate.eventManager saveCustomCalendarIdentifier:calendar.calendarIdentifier];
        
        // Reload all calendars.
        [self loadEventCalendars];
        
    }
    else{
        // Display the error description to the debugger.
        NSLog(@"%@", [error localizedDescription]);

    }
    
}

#pragma mark - UITableView Delegate and Datasource method implementation

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.calendarTableView.isEditing) {
        return self.calendarArray.count;
    }
    else{
        return self.calendarArray.count + 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellSelectCalendar"];
    
    
    if (self.calendarTableView.isEditing) {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"idCellEdit"];
            
            UITextField *textfield = (UITextField *)[cell viewWithTag:10];
            textfield.delegate = self;
        }
    }
    
    if (!self.calendarTableView.isEditing || (self.calendarTableView.isEditing && indexPath.row != 0)) {
        NSInteger row = self.calendarTableView.isEditing ? indexPath.row - 1 : indexPath.row;
        
        EKCalendar *currentCalendar = [self.calendarArray objectAtIndex:row];
        
        cell.textLabel.text = currentCalendar.title;
        
        if (!self.calendarTableView.isEditing) {
            
            // If selected, display a check mark
            if (indexPath.row == _selectedIndex) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Deselect the tapped row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // If no row is selected, display no checkmark
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:
                                 [NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Add a checkmark to the selected row
    _selectedIndex = indexPath.row;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    // Return the calendar name to the delegate
    EKCalendar *calendarName = self.calendarArray[indexPath.row];
    [self.delegate selectedCalendar:calendarName];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self createCalendar];
    }
    else{
        
    }
}

# pragma mark - UITextFieldDelegate method implementation

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self createCalendar];
    
    return YES;
}

@end
