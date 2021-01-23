//
//  NewsAPIManager.m
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import "NewsAPIManager.h"

#define API_TOKEN @"0fa373e04e1c63743565bf8e13cc1486"
#define API_URL_IP_ADDRESS @"https://api.travelpayouts.com/v1/prices/cheap"

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
    NSString *urlString = [NSString stringWithFormat:@"%@?%@&token=%@", API_URL_IP_ADDRESS, API_TOKEN];
    
    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        
        if (response) {
            NSDictionary *json = [[response valueForKey:@"data"] valueForKey:request.destionation];
            NSMutableArray *array = [NSMutableArray new];
            for (NSString *key in json) {
                NSDictionary *value = [json valueForKey: key];
                Ticket *ticket = [[Ticket alloc] initWithDictionary:value];
                ticket.from = request.origin;
                ticket.to = request.destionation;
                [array addObject:ticket];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(array);
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
