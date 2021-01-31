//
//  ResultsViewController.m
//  SearchApp
//
//  Created by Roman Kolosov on 31.01.2021.
//

#import "ResultsViewController.h"
#import "CustomCollectionViewCell.h"

@interface ResultsViewController ()

@property (strong, nonatomic) NSString *identifier;

@end

@implementation ResultsViewController

//MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureResultsVC];
    
    [self configureCollectionView];
}

//MARK: - Configure

- (void)configureResultsVC {
    self.title = @"Car search results";
    
    self.navigationController.navigationBar.prefersLargeTitles = NO;
}

- (void)configureCollectionView {
    _identifier = @"ResultCellIdentifier";
    // it is possible to use the same identifier name for cell as in the MainVC
    //_identifier = @"CellIdentifier";
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(100.0, 100.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    
    [self.view addSubview:_collectionView];
}

//MARK: - Major methods

- (void) update {
    [self.collectionView reloadData];
}

//MARK: - UICollectionViewDataSource delegate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.results.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    NSDictionary *car = self.results[indexPath.row];

    for (id key in car) {

        cell.carLabel.text = (NSString *)key;
        cell.carImageView.image = [UIImage imageNamed:car[key]];
    }
    return  cell;
}

@end
