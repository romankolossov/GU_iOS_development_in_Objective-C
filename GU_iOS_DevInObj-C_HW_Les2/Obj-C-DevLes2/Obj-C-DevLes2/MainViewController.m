//
//  MainViewController.m
//  Obj-C-DevLes2
//
//  Created by Roman Kolosov on 17.01.2021.
//

#import "MainViewController.h"
#import "CustomTableViewCell.h"

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
    
    self.myTableView.dataSource = self;
    //self.myTableView.delegate = self;
    self.myTableView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_myTableView];
    self.cellIdentifier = @"CellIdentifier";
}

- (void)configureMainVC {
    //showTableViewControllerButton
    CGRect showTableVCButtonFrame = CGRectMake(60, 11, [UIScreen mainScreen].bounds.size.width - 120, 30);
    UIButton *showTableVCButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    showTableVCButton.frame = showTableVCButtonFrame;
    [showTableVCButton setTitle:@"Show TableViewController" forState:UIControlStateNormal];
    showTableVCButton.backgroundColor = [UIColor lightGrayColor];
    showTableVCButton.tintColor = [UIColor whiteColor];
    [showTableVCButton addTarget:self action:@selector(openTableViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar addSubview:showTableVCButton];
}

// MARK: - Actions

- (void)openTableViewController{
    //SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //[self.navigationController showViewController:secondVC sender:self];
    
    //[self.navigationController pushViewController:secondVC animated:YES];
    
    //[self presentViewController:secondVC animated:YES completion:nil];
    
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.elements.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (!myCell) {
        myCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    myCell.leftLabel.text = [NSString stringWithFormat:@"left %@", self.elements[indexPath.row]];
    myCell.rightLabel.text = [NSString stringWithFormat:@"right %@", self.elements[indexPath.row]];
    
    return myCell;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.elements removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
