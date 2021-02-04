//
//  OneNewsViewController.m
//  NewsAPI
//
//  Created by Roman Kolosov on 04.02.2021.
//

#import "OneNewsViewController.h"

@interface OneNewsViewController ()

@end

@implementation OneNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGRect newsTextViewFrame = CGRectMake(11, [UIScreen mainScreen].bounds.size.height / 2, [UIScreen mainScreen].bounds.size.width - 22, 136);
    
    _newsTextView = [[UITextView alloc] initWithFrame:newsTextViewFrame];
    _newsTextView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    _newsTextView.textAlignment = NSTextAlignmentLeft;
    _newsTextView.textColor = [UIColor blackColor];
    _newsTextView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_newsTextView];
}


@end
