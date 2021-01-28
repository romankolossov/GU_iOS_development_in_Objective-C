//
//  MainViewController.h
//  SearchApp
//
//  Created by Roman Kolosov on 28.01.2021.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

