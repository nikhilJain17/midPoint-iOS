//
//  FirstViewController.m
//  midPoint
//
//  Created by Rishi Masand on 2/14/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//text`

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation FirstViewController

@synthesize preference, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11;



NSString *address1;
NSString *address2;
NSString *address3;
NSString *address4;
NSString *address5;
NSString *address6;
NSString *address7;
NSString *address8;
NSString *address9;
NSString *address10;
NSString *address11;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSString *fn;
NSString *ln;
NSString *theAddress;

NSInteger increment = 1;

- (IBAction)addContact:(id)sender {
    if(!peoplePicker) {
        peoplePicker = [[ABPeoplePickerNavigationController alloc]init];
        [peoplePicker setPeoplePickerDelegate:self];
    }
    [self presentViewController:peoplePicker animated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person {
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    ABMultiValueRef addresses = ABRecordCopyValue(person, kABPersonAddressProperty);
    
    NSMutableDictionary *contactAddress = [[NSMutableDictionary alloc]
                                           initWithObjects:@[@"", @"", @""]
                                           forKeys:@[@"street", @"state", @"city"]];
    
    
    
    if (ABMultiValueGetCount(addresses) > 0){
        NSDictionary *addressDict = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(addresses, 0);
        
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressStreetKey] forKey:@"street"];
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressStateKey] forKey:@"state"];
        [contactAddress setObject:[addressDict objectForKey:(NSString *)kABPersonAddressCityKey] forKey:@"city"];
        
    }
    
    NSString *street = (NSString*)[contactAddress objectForKey:@"street"];
    NSString *state = (NSString*)[contactAddress objectForKey:@"state"];
    NSString *city = (NSString*)[contactAddress objectForKey:@"city"];
    
    NSString *partialAddress = [street stringByAppendingString:[@" " stringByAppendingString:city]];
    NSString *address = [partialAddress stringByAppendingString:[@" " stringByAppendingString:state]];
    
    fn = firstName;
    ln = lastName;
    theAddress = address;
    
    
    if (increment == 1) {
        label1.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address1 = theAddress;
        /*
        address2 = 0;
        address3 = 0;
        address4 = 0;
        address5 = 0;
        address6 = 0;
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 2){
        label2.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address2 = theAddress;
        /*
        address3 = 0;
        address4 = 0;
        address5 = 0;
        address6 = 0;
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 3){
        label3.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address3 = theAddress;
        /*
        address4 = 0;
        address5 = 0;
        address6 = 0;
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 4){
        label4.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address4 = theAddress;
        /*
        address5 = 0;
        address6 = 0;
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 5){
        label5.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address5 = theAddress;
        /*
        address6 = 0;
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 6){
        label6.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address6 = theAddress;
        /*
        address7 = 0;
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 7){
        label7.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address7 = theAddress;
        /*
        address8 = 0;
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 8){
        label8.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address8 = theAddress;
        /*
        address9 = 0;
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 9){
        label9.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address9 = theAddress;
        /*
        address10 = 0;
        address11 = 0;
         */
    }
    else if (increment == 10){
        label10.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address10 = theAddress;
        //address11 = 0;
    }
    else if (increment == 11){
        label11.text = [fn stringByAppendingString:[@" " stringByAppendingString:ln]];
        address11 = theAddress;
    }
    
    NSLog(@"Address4: %@", address4);
    
    //label1.text = firstName;
    //txtLastName.text = lastName;
    //txtAddress.text = address;
    
        increment++;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    return YES;
    
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) addToDefaults {
    
    [self.userDefaults setValue:address1 forKey:@"Label1"];
    [self.userDefaults setValue:address2 forKey:@"Label2"];
    [self.userDefaults setValue:address3 forKey:@"Label3"];
    [self.userDefaults setValue:address4 forKey:@"Label4"];
    [self.userDefaults setValue:address5 forKey:@"Label5"];
    [self.userDefaults setValue:address6 forKey:@"Label6"];
    [self.userDefaults setValue:address7 forKey:@"Label7"];
    [self.userDefaults setValue:address8 forKey:@"Label8"];
    [self.userDefaults setValue:address9 forKey:@"Label9"];
    [self.userDefaults setValue:address10 forKey:@"Label10"];
    [self.userDefaults setValue:address11 forKey:@"Label11"];
    [self.userDefaults setValue:preference.text forKey:@"Preference"];
    
    NSString *lab1 = [self.userDefaults stringForKey:@"Label1"];
    NSLog(@"Address1: %@", lab1);
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.preference endEditing: YES];
    
}

- (IBAction)clear:(id)sender {
}

- (IBAction)submit:(id)sender {
    [self addToDefaults];
}
@end
