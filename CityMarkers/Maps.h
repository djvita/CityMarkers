//
//  Maps.h
//  CityMarkers
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/20/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;


@interface Maps : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic)   CLLocationManager   *locationManager;
@property (strong, nonatomic)   CLLocation          *location;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UILabel *lblLat;
@property (strong, nonatomic) IBOutlet UILabel *lblLong;

- (IBAction)btnBackPressed:(id)sender;

@end
