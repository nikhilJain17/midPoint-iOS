//
//  FirstViewController.h
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate> {
    
    ABPeoplePickerNavigationController *peoplePicker;
    
}


@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UILabel *label4;

@property (weak, nonatomic) IBOutlet UILabel *label5;

@property (weak, nonatomic) IBOutlet UILabel *label6;

@property (weak, nonatomic) IBOutlet UILabel *label7;

@property (weak, nonatomic) IBOutlet UILabel *label8;

@property (weak, nonatomic) IBOutlet UILabel *label9;

@property (weak, nonatomic) IBOutlet UILabel *label10;

@property (weak, nonatomic) IBOutlet UILabel *label11;

@property (weak, nonatomic) IBOutlet UITextField *preference;

- (IBAction)addContact:(id)sender;

- (IBAction)clear:(id)sender;

- (IBAction)submit:(id)sender;

@end

