//
//  SecondViewController.h
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <MapKit/MapKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@property (weak, nonatomic) IBOutlet UILabel *poiName;
@property (weak, nonatomic) IBOutlet UILabel *poiPhone;

@end

