//
//  NetworkRequest.h
//  WhatToEat
//
//  Created by ConnorJ on 15/10/14.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BlockCompletion)(id result);
typedef void (^ErrorBlock)(id result);

@interface NetworkRequest : NSObject

+ (void)NetworkRequestWithDict:(NSDictionary *)dict
               BlockCompletion:(BlockCompletion)blockCompletion
                    ErrorBlock:(ErrorBlock)errorBlock;

@end
