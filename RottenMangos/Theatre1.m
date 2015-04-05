//
//  Theatre.m
//  RottenMangos
//
//  Created by Shahin on 2015-04-02.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (id) initWithName:(NSString *)name address:(NSString *)address
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.address = address;
        self.longitude = 0;
        self.latitude = 0;
        self.title = name;
        self.subtitle = address;
    }
    return self;
}

+ (id) theatreWithName:(NSString *)name address:(NSString *)address
{
    return [[self alloc] initWithName:name address:address];
}

- (NSString *)subtitle
{
    return _subtitle;
}

- (NSString *)title
{
    return _title;
}

@end
