//
//  MovieDetailViewController.m
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(Movie *)newMovie {
    if (_movie != newMovie) {
        _movie = newMovie;
        
        [self configureView];
    }
}

- (void)configureView {
    if (self.movie) {
        self.detailImageView.image = self.movie.image;
        self.detailTitleLabel.text = self.movie.title;
        self.detailRatingLabel.text = [NSString stringWithFormat:@"Rating: %@/5.0", self.movie.rating];
        self.detailSynopsisLabel.text = self.movie.synopsis;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
