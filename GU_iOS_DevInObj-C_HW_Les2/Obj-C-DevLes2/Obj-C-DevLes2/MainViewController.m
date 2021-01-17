//
//  MainViewController.m
//  Obj-C-DevLes2
//
//  Created by Roman Kolosov on 17.01.2021.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self configureMainVC];
}

// MARK: - Configure

- (void)configureMainVC {
    //UIButton
    CGRect showVCButtonFrame = CGRectMake(110, 11, [UIScreen mainScreen].bounds.size.width - 220, 30);
    UIButton *showVCButton = [UIButton buttonWithType:UIButtonTypeSystem];
    showVCButton.frame = showVCButtonFrame;
    [showVCButton setTitle:@"Show VC" forState:UIControlStateNormal];
    showVCButton.backgroundColor = [UIColor lightGrayColor];
    showVCButton.tintColor = [UIColor blueColor];
    //[showVCButton addTarget:self action:@selector(openAnotherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:showVCButton];
}

// MARK: - Actions

- (void)openAnotherVC {
    //SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //[self.navigationController showViewController:secondVC sender:self];
    
    //[self.navigationController pushViewController:secondVC animated:YES];
    
    //[self presentViewController:secondVC animated:YES completion:nil];
    
}


@end
