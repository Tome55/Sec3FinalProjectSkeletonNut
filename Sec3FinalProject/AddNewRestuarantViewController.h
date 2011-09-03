//
//  FirstViewController.h
//  Sec3FinalProject
//
//  Created by Thongrop Rodsavas on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddNewRestuarantViewController : UIViewController <UITextFieldDelegate>
{

    UITextField *titleTextField;
    UITextField *subTitleTextField;
    UITextField *latitudeTextField;
    UITextField *longitudeTextField;
    UITextField *reviewTextField;
}
@property (nonatomic, retain) IBOutlet UITextField *titleTextField;
@property (nonatomic, retain) IBOutlet UITextField *subTitleTextField;
@property (nonatomic, retain) IBOutlet UITextField *latitudeTextField;
@property (nonatomic, retain) IBOutlet UITextField *longitudeTextField;
@property (nonatomic, retain) IBOutlet UITextField *reviewTextField;


-(IBAction)addToDatabase;
@end
