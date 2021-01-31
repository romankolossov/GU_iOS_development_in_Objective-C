//
//  MainViewController.m
//  SearchApp
//
//  Created by Roman Kolosov on 28.01.2021.
//

#import "MainViewController.h"
#import "CustomCollectionViewCell.h"
#import "ResultsViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonnull) NSMutableArray *carArray;

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsViewController *resultsController;

@end

@implementation MainViewController

//MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMainVC];
    
    [self configureResultsVC];
    [self configureCollectionView];
    
    [self setupData];
}

//MARK: - Configure
- (void)configureMainVC {
    self.title = @"Cars";
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (void)configureResultsVC {
    _resultsController = [[ResultsViewController alloc] init];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
    _searchController.searchResultsUpdater = self;
    self.navigationItem.searchController = _searchController;
    
    self.navigationItem.hidesSearchBarWhenScrolling = YES;
}

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

//MARK: - Setup data

-(void)setupData {
    self.carArray = [[NSMutableArray alloc] init];
    
    NSArray *carPhotos = [[NSArray alloc] init];
    NSArray *carNames = [[NSArray alloc] init];
    
    carPhotos= @[@"Acura.jpg", @"Alfa_Romeo.jpg", @"Aston_Martin.jpg", @"Audi.jpg", @"Bentley.jpg", @"BMW.jpg", @"Citroen.jpg", @"Ferrari.jpg", @"Jaguar.jpg", @"Land_Rover.jpg", @"Mercedes-Benz.jpg", @"Porsche.jpg", @"Rolls-Roys.jpg", @"Volvo.jpg"];
    
    carNames = @[@"Acura", @"Alfa Romeo", @"Aston Martin", @"Audi", @"Bentley", @"BMW", @"Citroen", @"Ferrari", @"Jaguar", @"Land Rover", @"Mercedes-Benz", @"Porsche", @"Rolls-Roys", @"Volvo"];
    
    NSDictionary *carDictionary = [[NSDictionary alloc] initWithObjects:carPhotos forKeys:carNames];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (id key in carDictionary) {
            
            id objects[] = {carDictionary[key]};
            id keys[] = {key};
            NSDictionary *car = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:1];
            //NSDictionary *car = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:1];
    
            [[self carArray] addObject:car];
        }
        [[self collectionView] reloadData];
    });
}

//MARK: - UICollectionViewDataSource delegate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.carArray.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    NSDictionary *car = self.carArray[indexPath.row];
    
    for (id key in car) {
        
        cell.carLabel.text = (NSString *)key;
        cell.carImageView.image = [UIImage imageNamed:car[key]];
    }
    return  cell;
}

//MARK: - UISearchResultsUpdating delegate methods

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text) {
        
        NSMutableArray *carNames = [[NSMutableArray alloc] init];
        NSArray *resultNames = [[NSArray alloc] init];
        NSMutableArray *resultCars = [[NSMutableArray alloc] init];
        
        for (id car in self.carArray) {
            for (id key in car) {
                
                [carNames addObject:(NSString *)key];
            }
        }
        resultNames = [carNames filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text]];
        
        for (id car in self.carArray) {
            for (id carName in resultNames) {
                for (id key in car) {
                    if (carName == (NSString *)key) {
                        
                        [resultCars addObject:car];
                    }
                }
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultsController.results = resultCars;
            
            [self.resultsController update];
        });
    }
}

@end
