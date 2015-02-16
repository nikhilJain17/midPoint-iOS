//
//  SecondViewController.m
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "Annotation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize mapview, poiName, poiPhone;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *label1 = [userDefaults stringForKey:@"Label1"];
    NSString *label2 = [userDefaults stringForKey:@"Label2"];
    NSString *label3 = [userDefaults stringForKey:@"Label3"];
    NSString *label4 = [userDefaults stringForKey:@"Label4"];
    NSString *label5 = [userDefaults stringForKey:@"Label5"];
    NSString *label6 = [userDefaults stringForKey:@"Label6"];
    NSString *label7 = [userDefaults stringForKey:@"Label7"];
    NSString *label8 = [userDefaults stringForKey:@"Label8"];
    NSString *label9 = [userDefaults stringForKey:@"Label9"];
    NSString *label10 = [userDefaults stringForKey:@"Label10"];
    NSString *label11 = [userDefaults stringForKey:@"Label11"];
    NSString *preference = [userDefaults stringForKey:@"Preference"];
    
    //NSString *theTitle;
    //NSString *theSubtitle;
    
    
    
   
    
    NSLog(@"label1 %@", label1);
    
    CLLocationCoordinate2D lab1 = [self geoCodeUsingAddress:label1];
    CLLocationCoordinate2D lab2 = [self geoCodeUsingAddress:label2];
    CLLocationCoordinate2D lab3 = [self geoCodeUsingAddress:label3];
    CLLocationCoordinate2D lab4 = [self geoCodeUsingAddress:label4];
    CLLocationCoordinate2D lab5 = [self geoCodeUsingAddress:label5];
    CLLocationCoordinate2D lab6 = [self geoCodeUsingAddress:label6];
    CLLocationCoordinate2D lab7 = [self geoCodeUsingAddress:label7];
    CLLocationCoordinate2D lab8 = [self geoCodeUsingAddress:label8];
    CLLocationCoordinate2D lab9 = [self geoCodeUsingAddress:label9];
    CLLocationCoordinate2D lab10 = [self geoCodeUsingAddress:label10];
    CLLocationCoordinate2D lab11 = [self geoCodeUsingAddress:label11];
    
    
    CLLocationCoordinate2D midPoint;
    
    //increment is 5
    float numAdd = 5 - 1;
    
    float sumLat = 0;
    float sumLong = 0;
    
    for (int i = 1; i <= numAdd; i++){
        if (i == 1){
            sumLat += lab1.latitude;
            NSLog(@"Lab1 Lat %f", lab1.latitude);
            sumLong += lab1.longitude;
            NSLog(@"Lab1 Long %f", lab1.longitude);
        }
        if (i == 2){
            sumLat += lab2.latitude;
            NSLog(@"Lab2 Lat %f", lab1.latitude);
            sumLong += lab2.longitude;
            NSLog(@"Lab2 Long %f", lab1.longitude);
        }
        if (i == 3){
            sumLat += lab3.latitude;
            NSLog(@"Lab3 Lat %f", lab1.latitude);
            sumLong += lab3.longitude;
            NSLog(@"Lab3 Long %f", lab1.longitude);
        }
        if (i == 4){
            sumLat += lab4.latitude;
            NSLog(@"Lab4 Lat %f", lab1.latitude);
            sumLong += lab4.longitude;
            NSLog(@"Lab4 Long %f", lab1.longitude);
        }
        
        midPoint.latitude = sumLat/numAdd;
        midPoint.longitude = sumLong/numAdd;
    }
    
    
    /*
    NSString *lat;
    NSString *longdick;
    
    lat = [[NSString alloc] initWithFormat:@"%g", lab4.latitude];
    longdick = [[NSString alloc] initWithFormat:@"%g",lab4.longitude];
    
    NSLog(@"lat %@", lat);
    NSLog(@"long %@", longdick);
     */
    
    MKCoordinateSpan midSpan;
    midSpan.latitudeDelta = 0.06f;
    midSpan.longitudeDelta = 0.06f;
    MKCoordinateRegion midRegion;
    midRegion.center = midPoint;
    midRegion.span = midSpan;
    
    __block NSString *elTitulo2;
    __block NSString *elSubtitulo2;
    
    [mapview setRegion:midRegion animated:YES];
    
    __block NSString *poiLat;
    __block NSString *poiLong;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = preference;
    request.region = MKCoordinateRegionMakeWithDistance(midPoint, 2000, 2000);
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        for (MKMapItem *item in response.mapItems){
            
            __block NSString *elTitulo = item.name;
            NSLog(@"%@", elTitulo);
            __block NSString *elSubtitulo = item.phoneNumber;
            
            poiLat = [item.placemark.addressDictionary valueForKey:@"latitude"];
            poiLong = [item.placemark.addressDictionary valueForKey:@"longitude"];
        
            poiName.text = elTitulo;
            //elTitulo2 = elTitulo;
            poiPhone.text = elSubtitulo;
        }
    }];
    
    NSLog(@"T2 %@", elTitulo2);
    poiName.text = elTitulo2;
    
    float poiLatf = [poiLat floatValue];
    float poiLongf = [poiLong floatValue];
    
    NSMutableArray * allAnnotations = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D poiC;
    poiC.latitude = poiLatf;
    poiC.longitude = poiLongf;
    
    
    Annotation *myAnnotation;
    
    myAnnotation = [[Annotation alloc]init];
    myAnnotation.coordinate = poiC;
    myAnnotation.title = elTitulo2;
    [allAnnotations addObject:myAnnotation];

    myAnnotation = [[Annotation alloc]init];
        myAnnotation.coordinate = midPoint;
    myAnnotation.title = @"midPoint";
    //myAnnotation.subtitle = elSubtitulo2;
        [allAnnotations addObject:myAnnotation];
    
    
    myAnnotation = [[Annotation alloc]init];
    if (lab1.latitude != 57.4756){
        myAnnotation.coordinate = lab1;
        myAnnotation.title = @"Label1";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab2.latitude != 57.4756){
        myAnnotation.coordinate = lab2;
        myAnnotation.title = @"Label2";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab3.latitude != 57.4756){
        myAnnotation.coordinate = lab3;
        myAnnotation.title = @"Label3";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab4.latitude != 57.4756){
        myAnnotation.coordinate = lab4;
        myAnnotation.title = @"Label4";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab5.latitude != 57.4756){
        myAnnotation.coordinate = lab5;
        myAnnotation.title = @"Label5";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab6.latitude != 57.4756){
        myAnnotation.coordinate = lab6;
        myAnnotation.title = @"Label6";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab7.latitude != 57.4756){
        myAnnotation.coordinate = lab7;
        myAnnotation.title = @"Label7";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab8.latitude != 57.4756){
        myAnnotation.coordinate = lab8;
        myAnnotation.title = @"Label8";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab9.latitude != 57.4756){
        myAnnotation.coordinate = lab9;
        myAnnotation.title = @"Label9";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab10.latitude != 57.4756){
        myAnnotation.coordinate = lab10;
        myAnnotation.title = @"Label10";
        [allAnnotations addObject:myAnnotation];
    }
    
    myAnnotation = [[Annotation alloc]init];
    if (lab11.latitude != 57.4756){
        myAnnotation.coordinate = lab11;
        myAnnotation.title = @"Label11";
        [allAnnotations addObject:myAnnotation];
    }
    
    [self.mapview addAnnotations: allAnnotations];
    

}

- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [address
                           stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString
                     stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@",
                     esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL
                                                          URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] &&
            [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil]
                && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
