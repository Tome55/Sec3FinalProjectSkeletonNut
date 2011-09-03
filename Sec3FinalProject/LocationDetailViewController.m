//
//  LocationDetailViewController.m
//  TestMapWithCustomAnnotation
//
//  Created by Thongrop Rodsavas on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "Restuarant.h"

@implementation LocationDetailViewController
@synthesize titleLabel;
@synthesize subTitleLabel;
@synthesize latLabel;
@synthesize longLabel;
@synthesize reviewLabel;
@synthesize title, subtitle, longitude, latitude, review;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [titleLabel release];
    [subTitleLabel release];
    [latLabel release];
    [longLabel release];
    [reviewLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Set UILabel to show the data we retrieve from restuarant
    // ------------------> TO DO <-------------------
    self.titleLabel.text = self.title;
    self.subTitleLabel.text = self.subtitle;
    self.latLabel.text = [NSString stringWithFormat:@"%d", self.latitude];
      self.longLabel.text = [NSString stringWithFormat:@"%d", self.longitude];
      self.reviewLabel.text =  self.review;
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setSubTitleLabel:nil];
    [self setLatLabel:nil];
    [self setLongLabel:nil];
    [self setReviewLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Location Detail View Instance Methods

// Read information from a Restuarant object and assign
// them to the controller's instance variable so that
// we can display these to the views.
- (void)setDataFromRestuarant:(Restuarant *)restuarant
{
    self.title = restuarant.title;
    self.subtitle = restuarant.subtitle;
    self.latitude = restuarant.coordinate.latitude;
    self.longitude = restuarant.coordinate.longitude;
    self.review = restuarant.review;
}

@end
