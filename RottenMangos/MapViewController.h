//
//  MapViewController.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Theatre.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *locations;
@property (strong, nonatomic) Theatre *theatre;

@end

