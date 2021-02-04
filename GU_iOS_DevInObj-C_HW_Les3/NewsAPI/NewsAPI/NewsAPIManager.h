//
//  NewsAPIManager.h
//  NewsAPI
//
//  Created by Roman Kolosov on 23.01.2021.
//

#import <Foundation/Foundation.h>


@interface NewsAPIManager : NSObject

+(instancetype) sharedInstance;

- (void)newsWithCompletion:(void (^)(NSArray *newsElements))completion;

@end


