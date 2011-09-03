//
//  Sec3FinalProjectAppDelegate.h
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sec3FinalProjectAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) NSMutableArray *restuarantArray;

-(void) copyDatabaseIfNeeded;
-(NSString *) DBPath;
@end
