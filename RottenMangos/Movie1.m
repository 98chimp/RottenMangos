//
//  Movie.m
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id) initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self) {
        self.title = title;
        self.thumbnail = nil;
    }
    return self;
}

+ (id) movieWithTitle:(NSString *)title
{
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) thumbnailURL
{
    return [NSURL URLWithString:self.thumbnail];
}

@end
