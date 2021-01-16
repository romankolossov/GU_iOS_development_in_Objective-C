//
//  MainViewController.m
//  Obj-C-DevLes1
//
//  Created by Roman Kolosov on 16.01.2021.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self configureMainVC];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[self openAnotherVC];
}

- (void)openAnotherVC {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //[self.navigationController showViewController:secondVC sender:self];
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
    //[self presentViewController:secondVC animated:YES completion:nil];
}

- (void)configureMainVC {
    // UIView
    CGRect yellowViewFrame = CGRectMake(40, 80, [UIScreen mainScreen].bounds.size.width - 80, 60);
    UIView *yellowView = [[UIView alloc] initWithFrame:yellowViewFrame];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    // UILabel
    CGRect myLabelFrame = CGRectMake(40, 150, [UIScreen mainScreen].bounds.size.width - 80, 20);
    UILabel *myLabel = [[UILabel alloc] initWithFrame:myLabelFrame];
    myLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    myLabel.textColor = [UIColor darkGrayColor];
    myLabel.textAlignment = NSTextAlignmentNatural;
    myLabel.backgroundColor = [UIColor greenColor];
    myLabel.text = @"Hello, World!";
    [self.view addSubview:myLabel];
    
    
}


@end
