//
//  LocationDetailViewController.h
//  TestMapWithCustomAnnotation
//
//  Created by Thongrop Rodsavas on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Restuarant;
@interface LocationDetailViewController : UIViewController {
    
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *latLabel;
    UILabel *longLabel;
    UILabel *reviewLabel;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, copy) NSString *review;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *subTitleLabel;
@property (nonatomic, retain) IBOutlet UILabel *latLabel;
@property (nonatomic, retain) IBOutlet UILabel *longLabel;
@property (nonatomic, retain) IBOutlet UILabel *reviewLabel;

-(void)setDataFromRestuarant:(Restuarant*)restuarant;
@end
