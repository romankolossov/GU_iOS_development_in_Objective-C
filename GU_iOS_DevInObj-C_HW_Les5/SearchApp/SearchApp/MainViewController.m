//
//  MainViewController.m
//  SearchApp
//
//  Created by Roman Kolosov on 28.01.2021.
//

#import "MainViewController.h"
#import "CustomCollectionViewCell.h"

@interface MainViewController ()

@property (strong, nonatomic) NSString *identifier;

@end

@implementation MainViewController

//MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureCollectionView];
}

//MARK: - Configure

- (void)configureCollectionView {
    _identifier = @"CellIdentifier";
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(100.0, 100.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //[_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    
    [self.view addSubview:_collectionView];
}

//MARK: - UICollectionViewDataSource delegate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 11;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
   
    cell.carLabel.text = @"Hello, Car!";
    
    return  cell;
}


@end
