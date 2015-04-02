//
//  MoviesCollectionViewController.m
//  RottenMangos
//
//  Created by Shahin on 2015-04-01.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "MoviesCollectionViewController.h"

@interface MoviesCollectionViewController ()

@property (strong, nonatomic) NSURL *movieURL;

@end

@implementation MoviesCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    self.movieURL = [NSURL URLWithString: @"https://www.kimonolabs.com/api/b556wofw?apikey=aRNY7R61fgpsobkeybrdMRkYywRTJPUF"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:self.movieURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSLog(@"%@", dataDictionary);
    
    self.movies = [NSMutableArray array];
    
    NSArray *moviesArray = dataDictionary[@"results"][@"collection1"];
    
    for (NSDictionary *movieDictionary in moviesArray) {
        Movie *movie = [Movie movieWithTitle:movieDictionary[@"title"]];
        movie.title = movieDictionary[@"title"];
        movie.thumbnail = movieDictionary[@"poster"][@"src"];
        movie.rating = movieDictionary[@"score"];
        movie.synopsis = movieDictionary[@"synopsis"][@"text"];
        [self.movies addObject:movie];
    }
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        Movie *selectedMovie = [Movie new];
        selectedMovie = self.movies[indexPath.row];
        MovieDetailViewController *movieDetail = (MovieDetailViewController *)[[segue destinationViewController] topViewController];
        [movieDetail setDetailItem:selectedMovie];
        movieDetail.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        movieDetail.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, NSData *data))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (!error) {
            completionBlock(YES, data);
        } else {
            completionBlock(NO, nil);
        }
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

- (MovieCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Movie *movie = [self.movies objectAtIndex:indexPath.item];

    [self downloadImageWithURL:[movie thumbnailURL] completionBlock:^(BOOL succeeded, NSData *data) {
        movie.image = [[UIImage alloc] initWithData:data];
        if (succeeded) {
            cell.imageView.image = movie.image;
        }
        else {
            cell.imageView.image = [UIImage imageNamed:@"movie-75.png"];
        }
    }];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
