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
    [self.mapView setDelegate:self];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:55.74188 longitude:37.60241];
    [self addressFromLocation:location];
    [self locationFromAddress:@"Обыденский 2-й переулок, 13"];
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

// MARK: - Major methods

- (void)addressFromLocation:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"@%@", placemark.name);
            }
        }
    }];
}

- (void)locationFromAddress:(NSString *)address {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
            }
        }
    }];
}

// MARK: - MKMapViewDelegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"MarkerIdentifier";
    
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    
    return  annotationView;
}

@end
