//
//  MoviesCollectionViewController.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "MovieCollectionViewCell.h"
#import "MovieDetailViewController.h"

@interface MoviesCollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *movies;

@end
