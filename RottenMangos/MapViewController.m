//
//  MapViewController.m
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (strong, nonatomic) NSURL *locationURL;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationURL = [NSURL URLWithString: @"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=V7P3G7&movie=Paddington"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:self.locationURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.locations = [NSMutableArray array];
    
    NSArray *theatresArray = dataDictionary[@"theatres"];
    
    for (NSDictionary *theatreDictionary in theatresArray) {
        Theatre *theatre = [Theatre theatreWithName:theatreDictionary[@"name"] address:theatreDictionary[@"address"]];
        theatre.name = theatreDictionary[@"name"];
        theatre.address = theatreDictionary[@"address"];
        theatre.latitude = [theatreDictionary[@"lat"] doubleValue];
        theatre.longitude = [theatreDictionary[@"lng"] doubleValue];
        theatre.coordinate = CLLocationCoordinate2DMake(theatre.latitude, theatre.longitude);
        theatre.title = theatre.name;
        theatre.subtitle = theatre.address;
        [self.locations addObject:theatre];
    }
    
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation =true;
    MKCoordinateRegion startingRegion;
    CLLocationCoordinate2D loc = self.locationManager.location.coordinate;
    startingRegion.center = loc;
    startingRegion.span.latitudeDelta = 0.25;
    startingRegion.span.longitudeDelta = 0.25;
    
//    MKPointAnnotation *theatreMarker = [[MKPointAnnotation alloc] init];
    for (Theatre *theatre in self.locations) {
//        CLLocationCoordinate2D theatreLocation;
//        theatreLocation.latitude = theatre.latitude;
//        theatreLocation.longitude = theatre.longitude;
        [self.mapView addAnnotation:theatre];
        NSLog(@"%@\n", theatre.name);
    }
    
    [self.mapView setRegion:startingRegion];
    
}

- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse){
        NSLog(@"We got permission yo");
    } else if (status == kCLAuthorizationStatusDenied ){
        NSLog(@"the user is not a fan of being stalked");
    }
}

- (void)loadLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = 1000;
    
    [self.locationManager startUpdatingLocation];
}

//- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
//    [self.locationManager stopUpdatingLocation];
//    
//    CLLocation *location = [locations firstObject];
//    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
//    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
//        CLPlacemark *placemark = [placemarks firstObject];
//        self.location = placemark.name;
//    }];
//}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    
    if (annotation == self.mapView.userLocation){
        return nil; //default to blue dot
    }
    
    static NSString* annotationIdentifier = @"theatreAnnotation";
    
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)
    [self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    
    if (!pinView) {
        // if an existing pin view was not available, create one
        pinView = [[MKPinAnnotationView alloc]
                   initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    }
    
    pinView.canShowCallout = YES;
//    pinView.pinColor = MKPinAnnotationColorGreen;
    pinView.image = [UIImage imageNamed:@"cinema"];
    //pinView.calloutOffset = CGPointMake(-7, 0);

    NSLog(@"%@", pinView);

    return pinView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
