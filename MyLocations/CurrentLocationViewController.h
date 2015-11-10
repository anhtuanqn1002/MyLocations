//
//  FirstViewController.h
//  MyLocations
//
//  Created by Nguyen Van Anh Tuan on 11/10/15.
//  Copyright © 2015 Nguyen Van Anh Tuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentLocationViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *longitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UIButton *tagButton;
@property (nonatomic, weak) IBOutlet UIButton *getButton;

-(IBAction)getLocation:(id)sender;
@end

