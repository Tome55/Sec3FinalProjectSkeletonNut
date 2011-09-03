//
//  SecondViewController.h
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RestuarantMapViewController : UIViewController <MKMapViewDelegate>
{
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(void)clearAnnotations;
-(void)addAnnotationFromDBToMap;
@end
