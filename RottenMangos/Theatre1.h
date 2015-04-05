//
//  Theatre.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-02.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Theatre : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;

- (id) initWithName:(NSString *)name address:(NSString *)address;
+ (id) theatreWithName:(NSString *)name address:(NSString *)address;

@end
