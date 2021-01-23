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

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self configureMainVC];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[self openAnotherVC];
}

// MARK: - Configure

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
    myLabel.text = @"Hello, World! Label";
    [self.view addSubview:myLabel];
    
    //UIButton
    CGRect showVCButtonFrame = CGRectMake(40, 180, [UIScreen mainScreen].bounds.size.width - 80, 30);
    UIButton *showVCButton = [UIButton buttonWithType:UIButtonTypeSystem];
    showVCButton.frame = showVCButtonFrame;
    [showVCButton setTitle:@"Show VC" forState:UIControlStateNormal];
    showVCButton.backgroundColor = [UIColor blueColor];
    showVCButton.tintColor = [UIColor redColor];
    [showVCButton addTarget:self action:@selector(openAnotherVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showVCButton];
    
    //UITextField
    CGRect myTextFieldFrame = CGRectMake(40, 230, [UIScreen mainScreen].bounds.size.width - 80, 30);
    UITextField *myTextField = [[UITextField alloc] initWithFrame:myTextFieldFrame];
    myTextField.placeholder = @"Enter text in the TextField...";
    myTextField.font = [UIFont systemFontOfSize:21 weight:UIFontWeightLight];
    //myTextField.tintColor = [UIColor blueColor];
    myTextField.textColor = [UIColor blueColor];
    myTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myTextField];
    
    //UITextView
    CGRect myTextViewFrame = CGRectMake(40, 270, [UIScreen mainScreen].bounds.size.width - 80, 50);
    UITextView *myTextView = [[UITextView alloc] initWithFrame:myTextViewFrame];
    myTextView.text = @"Defalt text for the TextView";
    myTextView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    myTextView.textAlignment = NSTextAlignmentLeft;
    myTextView.textColor = [UIColor blackColor];
    myTextView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:myTextView];
    
    //UISegmentedControl
    CGRect mySegmentedControlFrame = CGRectMake(40, 350, [UIScreen mainScreen].bounds.size.width - 80, 20);
    UISegmentedControl *mySegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"First", @"Second", @"Third"]];
    mySegmentedControl.frame = mySegmentedControlFrame;
    mySegmentedControl.backgroundColor = [UIColor whiteColor];
    mySegmentedControl.selectedSegmentTintColor = [UIColor greenColor];
    mySegmentedControl.tintColor = [UIColor yellowColor]; //TO FIX
    mySegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:mySegmentedControl];
    
    //UISlider
    CGRect mySliderFrame = CGRectMake(40, 380, [UIScreen mainScreen].bounds.size.width - 80, 30);
    UISlider *mySlider = [[UISlider alloc] initWithFrame:mySliderFrame];
    mySlider.tintColor = [UIColor yellowColor];
    mySlider.value = 0.3;
    [self.view addSubview:mySlider];
    
    //UIActivityIndicatorView
    CGRect myActivityIndicatorViewFrame = CGRectMake(40, 420, [UIScreen mainScreen].bounds.size.width - 80, 30);
    UIActivityIndicatorView *myActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    myActivityIndicatorView.frame = myActivityIndicatorViewFrame;
    myActivityIndicatorView.color = [UIColor orangeColor];
    myActivityIndicatorView.hidesWhenStopped = YES;
    [myActivityIndicatorView startAnimating];
    [self.view addSubview:myActivityIndicatorView];
    
    //UIProgressView
    CGRect myProgressViewFrame = CGRectMake(40, 470, [UIScreen mainScreen].bounds.size.width - 80, 30);
    UIProgressView *myProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    myProgressView.frame = myProgressViewFrame;
    myProgressView.tintColor = [UIColor orangeColor];
    myProgressView.progress = 0.8;
    [self.view addSubview:myProgressView];
    
    //UIImageView
    CGRect myImageViewFrame = CGRectMake(40, 490, [UIScreen mainScreen].bounds.size.width - 80, 60);
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:myImageViewFrame];
    myImageView.image = [UIImage imageNamed:@"Ferrari"];
    myImageView.contentMode = UIViewContentModeScaleAspectFit;
    myImageView.backgroundColor = [UIColor redColor];
    myImageView.tintColor = [UIColor blueColor];
    [self.view addSubview:myImageView];
}

// MARK: - Actions

- (void)openAnotherVC {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //[self.navigationController showViewController:secondVC sender:self];
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
    //[self presentViewController:secondVC animated:YES completion:nil];
}

@end
