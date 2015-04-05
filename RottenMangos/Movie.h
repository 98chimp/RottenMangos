//
//  Movie.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-03.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Movie : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDecimalNumber * rating;
@property (nonatomic, retain) NSString * synopsis;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSData * image;

@end
