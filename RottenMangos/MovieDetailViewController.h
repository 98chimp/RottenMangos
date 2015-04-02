//
//  MovieDetailViewController.h
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailSynopsisLabel;
@property (strong, nonatomic) Movie *movie;

- (void)setDetailItem:(Movie *)movie;

@end
