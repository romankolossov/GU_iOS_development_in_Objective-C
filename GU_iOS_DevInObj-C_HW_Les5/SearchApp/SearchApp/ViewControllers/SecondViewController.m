//
//  SecondViewController.m
//  SearchApp
//
//  Created by Roman Kolosov on 31.01.2021.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

//MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSecondVC];
}

//MARK: - Configure

- (void)configureSecondVC {
    self.title = @"Picker";
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

@end
