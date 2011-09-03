//
//  FirstViewController.m
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddNewRestuarantViewController.h"
#import "Restuarant.h"

@implementation AddNewRestuarantViewController
@synthesize titleTextField;
@synthesize subTitleTextField;
@synthesize latitudeTextField;
@synthesize longitudeTextField;
@synthesize reviewTextField;

#pragma mark - View Life Cycle
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [self setTitleTextField:nil];
    [self setSubTitleTextField:nil];
    [self setLatitudeTextField:nil];
    [self setLongitudeTextField:nil];
    [self setReviewTextField:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [titleTextField release];
    [subTitleTextField release];
    [latitudeTextField release];
    [longitudeTextField release];
    [reviewTextField release];
    [super dealloc];
}

#pragma mark - UITextField Delegate Methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - AddNewRestuarantViewController Instance Methods

- (IBAction)addToDatabase
{
    NSLog(@"addToDatabase");
    // Example of how to add new restuarant to database
    // You would want to replace the placeholder info 
    // to be the one you recieve from each text box instead.
    // ------------------> TO DO <-------------------
    Restuarant *newRes = [Restuarant new];
    newRes.title =  self.titleTextField.text;
    newRes.subtitle =  self.subTitleTextField.text;
    newRes.review =  self.reviewTextField.text;
    
    // OK
    
    newRes.coordinate = CLLocationCoordinate2DMake([self.latitudeTextField.text  doubleValue]  , [self.longitudeTextField.text doubleValue]  );
    [Restuarant addRestuarantToDatabase:newRes];
}
@end
