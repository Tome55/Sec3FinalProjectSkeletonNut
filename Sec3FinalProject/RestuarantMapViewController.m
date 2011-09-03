//
//  SecondViewController.m
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RestuarantMapViewController.h"
#import "Sec3FinalProjectAppDelegate.h"
#import "LocationDetailViewController.h"

@implementation RestuarantMapViewController
@synthesize mapView;

#pragma mark - View Life Cycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self clearAnnotations];
    [self addAnnotationFromDBToMap];
    
    // Set Map starting view
    if ([self.mapView.annotations count] > 0) {
        id<MKAnnotation> annotation = [self.mapView.annotations objectAtIndex:0];
        self.mapView.region = MKCoordinateRegionMake([annotation coordinate], MKCoordinateSpanMake(0.1, 0.1));
    }
    [super viewWillAppear:animated];
}

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
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Restuarant Map View Controller Instance Methods

- (void)clearAnnotations
{
    NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:10];
    for (id annotation in self.mapView.annotations)
    {
        if (annotation != self.mapView.userLocation)
            [toRemove addObject:annotation];
    }
    [self.mapView removeAnnotations:toRemove];
}

- (void)addAnnotationFromDBToMap
{
    Sec3FinalProjectAppDelegate* appDelegate = (Sec3FinalProjectAppDelegate*)[[UIApplication sharedApplication] delegate];
    [self.mapView addAnnotations:[appDelegate restuarantArray]];
}

#pragma mark - MKMapView Delegate Methods
- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Return default pin for user's location
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }else
    {
        // Return pin with special callout that can link to the new page
        // ------------------> TO DO <-------------------
        MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
        annView.pinColor = MKPinAnnotationColorGreen;
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        advertButton.tag = 1;
        
        annView.rightCalloutAccessoryView = advertButton;
        
        annView.animatesDrop    = YES;
        annView.canShowCallout  = YES;
        annView.calloutOffset = CGPointMake(0, 0);
        return annView;
        //OK
        
     
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // Go to detail page
    // ------------------> TO DO <-------------------
    
    NSLog(@"%@",control);
  //  UIButton *button = (UIButton*)control;
 
        LocationDetailViewController *detailViewController = [[LocationDetailViewController alloc]init];
    
     //   detailViewController.annotation =   view.annotation;
    
        [detailViewController setDataFromRestuarant: ( Restuarant* )view.annotation];
        [self.navigationController pushViewController:detailViewController animated:YES];
        [detailViewController release];
     
}
@end
