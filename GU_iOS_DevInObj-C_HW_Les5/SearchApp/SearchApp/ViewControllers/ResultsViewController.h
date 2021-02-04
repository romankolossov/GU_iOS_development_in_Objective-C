//
//  ResultsViewController.h
//  SearchApp
//
//  Created by Roman Kolosov on 31.01.2021.
//

#import <UIKit/UIKit.h>


@interface ResultsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *results;

- (void)update;

@end

