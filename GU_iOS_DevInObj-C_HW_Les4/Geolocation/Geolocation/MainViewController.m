//
//  MainViewController.m
//  Geolocation
//
//  Created by Roman Kolosov on 24.01.2021.
//

#import "MainViewController.h"
#import <MapKit/MapKit.h>

@interface MainViewController ()

@property (strong, nonnull) MKMapView *mapView;
@property (strong, nonnull) MKPointAnnotation *annotation;

@end

@implementation MainViewController

// MARK: - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureMap];
    [self configureMoscowAnnotation];
}

// MARK: - Configure

- (void)configureMap {
    CGRect mapFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    self.mapView = [[MKMapView alloc] initWithFrame:mapFrame];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    [self.mapView setRegion:region animated:YES];
    
    [self.view addSubview:self.mapView];
}

- (void)configureMoscowAnnotation {
    self.annotation = [[MKPointAnnotation alloc] init];
    
    self.annotation.title = @"Moscow city";
    self.annotation.subtitle = @"The Capital of Russia";
    self.annotation.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
    
    [self.mapView addAnnotation:self.annotation];
}

// MARK: - MKMapViewDelegate methods

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//
//}


@end
