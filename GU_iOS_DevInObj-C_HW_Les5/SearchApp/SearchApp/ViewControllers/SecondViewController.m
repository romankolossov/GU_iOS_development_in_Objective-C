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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self presentPickerController];
}

//MARK: - Configure

- (void)configureSecondVC {
    self.title = @"Picker";
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

//MARK: - Major methods

- (void)presentPickerController {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    if (image) {
        
        NSLog(@"Получено изображение");
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
