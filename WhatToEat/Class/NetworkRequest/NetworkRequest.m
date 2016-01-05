//
//  NetworkRequest.m
//  WhatToEat
//
//  Created by ConnorJ on 15/10/14.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//


#import "NetworkRequest.h"
#import "WhatToEatPrefixHeader.pch"
#import "BaseModel.h"

@implementation NetworkRequest

+ (void)NetworkRequestWithDict:(NSDictionary *)dict
               BlockCompletion:(BlockCompletion)blockCompletion
                    ErrorBlock:(ErrorBlock)errorBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:DOMAIN_NAME parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSDictionary *dict = responseObject;
        NSMutableArray *dataArr = [NSMutableArray array];
        
        for (NSDictionary *dic in [dict objectForKey:@"data"]) {
            BaseModel *baseModel = [[BaseModel alloc] init];
            [baseModel setBaseModelWithDict:dic];
            [dataArr addObject:baseModel];
        }
        
        blockCompletion(dataArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        errorBlock(errorStr);
    }];
}
@end
