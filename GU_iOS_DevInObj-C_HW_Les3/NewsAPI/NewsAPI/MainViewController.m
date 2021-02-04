//
//  MainViewController.m
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import "MainViewController.h"
#import "NewsTableViewCell.h"
#import "NewsAPIManager.h"
#import "OneNewsViewController.h"

@interface MainViewController ()

@property (strong, nonnull) UITableView *newsTableView;
@property (strong) NSString *newsCellIdentifier;
@property (strong, nonnull) NSMutableArray *newsElements;

@end

@implementation MainViewController

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMainVC];
    
    [self configureNewsTableView];
    [self loadNews];
}

// MARK: - Configure

- (void)configureNewsTableView {
    self.newsTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // MARK: Note
    // - first set value for cellIdentifier then register cell
    // - if use register cell then no need to check "if (!myCell)" in cellForRowAtIndexPath delagate method and if not create myCell there
    self.newsCellIdentifier = @"NewsCellIdentifier";
    [self.newsTableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:self.newsCellIdentifier];
    
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;

    self.newsTableView.backgroundColor = [UIColor yellowColor];
    self.newsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_newsTableView];
}

- (void)configureMainVC {
    self.title = @"News API";
}

// MARK: - Major methods

- (void)loadNews {
    self.newsElements = [[NSMutableArray alloc] init];
    
    [[NewsAPIManager sharedInstance] newsWithCompletion:^(NSArray *newsElements) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            for (NSString *element in newsElements) {
                [[self newsElements] addObject:element];
            }
            [self.newsTableView reloadData];
            
            NSLog(@"newsElements.count is: @%ld", self.newsElements.count);
        });
    }];
}

// MARK: - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsElements.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:self.newsCellIdentifier];
    
    // MARK: Note
    // use this check if there is no cell register done in configureTable method
    /*
    if (!newsCell) {
     newsCell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.newsCellIdentifier];
    }
     */
    newsCell.newsTextView.text = [NSString stringWithFormat:@"News: %@", self.newsElements[indexPath.row]];

    return newsCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OneNewsViewController *oneNewsVC = [[OneNewsViewController alloc] init];
    
    oneNewsVC.newsTextView.text = [NSString stringWithFormat:@"News: %@", self.newsElements[indexPath.row]];
    
    [self.navigationController pushViewController:oneNewsVC animated:YES];
}

// MARK: - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

@end
