//
//  NewsAPIManager.m
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import "NewsAPIManager.h"

#define API_KEY @"0fa373e04e1c63743565bf8e13cc1486"
#define API_URL_IP_ADDRESS @"https://newsapi.org/v2/top-headlines?country=us"
// https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY

@implementation NewsAPIManager

+ (instancetype)sharedInstance {
    static NewsAPIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NewsAPIManager alloc] init];
    });
    return instance;
}

// MARK: Major methods

//- (void)newsWithCompletion:(void (^)(NSString *ipAddress))completion {
//    NSString *newsURL = [NSString stringWithFormat:@"%@%@", API_URL_IP_ADDRESS, API_TOKEN ];
//
//    [self load:newsURL withCompletion:^(id  _Nullable result) {
//        NSDictionary *json = result;
//        completion([json valueForKey:@"ip"]);
//    }];
//}

- (void)newsWithCompletion:(void (^)(NSArray *newsElements))completion {
    NSString *urlString = [NSString stringWithFormat:@"%@&apiKey=%@", API_URL_IP_ADDRESS, API_KEY];
    
    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        
        if (response) {
            NSArray *json = [response valueForKey:@"title"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(json);
            });
        }
    }];
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (!error) {
         completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
        }
    }] resume] ;
}


@end
