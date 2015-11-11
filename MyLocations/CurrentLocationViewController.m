//
//  FirstViewController.m
//  MyLocations
//
//  Created by Nguyen Van Anh Tuan on 11/10/15.
//  Copyright © 2015 Nguyen Van Anh Tuan. All rights reserved.
//

#import "CurrentLocationViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController
{
    CLLocationManager *_locationManager;
    CLLocation *_location;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

-(IBAction)getLocation:(id)sender {
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    [_locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
//phương thức này sẽ được gọi khi dịch vụ locations bị tắt
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
    NSLog(@"didFailWithError %@", error);
}

- (void)updateLabels {
    if (_location != nil) {
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", _location.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", _location.coordinate.longitude];
        self.tagButton.hidden = NO;
        self.messageLabel.text = @"";
    } else {
        self.latitudeLabel.text = @"";
        self.longitudeLabel.text = @"";
        self.addressLabel.text = @"";
        self.tagButton.hidden = YES;
        self.messageLabel.text = @"Press the Button to Start";
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"didUpdateLocations %@", newLocation);

    _location = newLocation;
    [self updateLabels];
}

@end
