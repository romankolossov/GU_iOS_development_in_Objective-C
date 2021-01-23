//
//  MainViewController.m
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import "MainViewController.h"
#import "NewsTableViewCell.h"

@interface MainViewController ()

@property (strong, nonnull) UITableView *newsTableView;
@property (strong) NSString *newsCellIdentifier;

@end

@implementation MainViewController

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNewsTableView];
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

    self.newsTableView.backgroundColor = [UIColor redColor];
    self.newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_newsTableView];
}

// MARK: - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 21;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:self.newsCellIdentifier];
    
    // MARK: Note
    // use this check if there is no cell register done in configureTable method
    /*
    if (!myCell) {
     newsCell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.newsCellIdentifier];
    }
     */
    
    newsCell.newsTextView.text = @"Hello World!";

    return newsCell;
}


// MARK: - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 188.0;
}

@end
