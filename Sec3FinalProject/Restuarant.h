//
//  Restuarant.h
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Restuarant : NSObject <MKAnnotation>
{
}
@property (nonatomic, readonly) NSInteger restuarantID;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *review;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, assign) BOOL isDirty;
@property (nonatomic, assign) BOOL isDetailViewHydrated;

// Class Methods
+ (void) getInitialDataToDisplayFromDatabase:(NSString *)dbPath;
+ (void) addRestuarantToDatabase:(Restuarant *)restuarant;
+ (void) finalizeStatements;

// Instance Methods
- (id)initWithPrimaryKey:(NSInteger)key;
- (void) addSelfToDatabase;
@end
