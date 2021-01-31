//
//  TabBarController.m
//  SearchApp
//
//  Created by Roman Kolosov on 31.01.2021.
//

#import "TabBarController.h"
#import "MainViewController.h"
#import "SecondViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

//MARK: - Initializator

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        MainViewController *mainViewController = [[MainViewController alloc] init];
        mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
        
        UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        
              
        SecondViewController *secondViewController = [[SecondViewController alloc] init];
        secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
        
        UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
        
        self.viewControllers = @[mainNavigationController, secondNavigationController];
        self.tabBar.tintColor = [UIColor blackColor];
        self.selectedIndex = 0;
    }
    return self;
}

//MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
