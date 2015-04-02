//
//  Movie.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *synopsis;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) UIImage *image;

- (id) initWithTitle:(NSString *)title;
+ (id) movieWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;

@end
