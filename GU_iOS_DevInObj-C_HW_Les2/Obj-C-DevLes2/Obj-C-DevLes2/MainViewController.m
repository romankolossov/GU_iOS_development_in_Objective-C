//
//  MainViewController.m
//  Obj-C-DevLes2
//
//  Created by Roman Kolosov on 17.01.2021.
//

#import "MainViewController.h"
#import "CustomTableViewCell.h"
#import "TableViewController.h"

@interface MainViewController ()

@property (strong, nonnull) UITableView *myTableView;
@property (strong) NSString *cellIdentifier;
@property (strong, nonnull) NSMutableArray *elements;

@end

@implementation MainViewController

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.elements = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", nil];
    
    [self configureTableView];
    [self configureMainVC];
}

// MARK: - Configure

- (void)configureTableView {
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // MARK: Note
    // - first set value for cellIdentifier then register cell
    // - if use register cell then no need to check "if (!myCell)" in cellForRowAtIndexPath delagate method and if not create myCell there
    self.cellIdentifier = @"MyCellIdentifier";
    [self.myTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:self.cellIdentifier];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;

    self.myTableView.backgroundColor = [UIColor redColor];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}

- (void)configureMainVC {
    self.title = @"Table View";
    
    //showTableViewControllerButton
    CGRect showTableVCButtonFrame = CGRectMake(80, 11, [UIScreen mainScreen].bounds.size.width - 160, 30);
    UIButton *showTableVCButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    showTableVCButton.frame = showTableVCButtonFrame;
    [showTableVCButton setTitle:@"Show TableVC" forState:UIControlStateNormal];
    showTableVCButton.backgroundColor = [UIColor lightGrayColor];
    showTableVCButton.tintColor = [UIColor whiteColor];
    [showTableVCButton addTarget:self action:@selector(openTableViewController) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = showTableVCButton;
   // [self.navigationController.navigationBar addSubview:showTableVCButton];
}

// MARK: - Actions

- (void)openTableViewController{
    TableViewController *tableVC = [[TableViewController alloc] init];
    
    //[self.navigationController showViewController:tableVC sender:self];
    
    [self.navigationController pushViewController:tableVC animated:YES];
    
    //[self presentViewController:tableVC animated:YES completion:nil];
}

// MARK: - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.elements.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    // MARK: Note
    // use this check if there is no cell register done in configureTable method
    /*
    if (!myCell) {
        myCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
     */
    
    myCell.leftLabel.text = [NSString stringWithFormat:@"left %@", self.elements[indexPath.row]];
    myCell.rightLabel.text = [NSString stringWithFormat:@"right %@", self.elements[indexPath.row]];
    
    return myCell;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.elements removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

// MARK: - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48.0;
}

@end
