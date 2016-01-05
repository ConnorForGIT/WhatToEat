//
//  BaseModel.h
//  WhatToEat
//
//  Created by ConnorJ on 15/10/14.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *addr;
@property (nonatomic, copy) NSString *frontImg;
@property (nonatomic, copy) NSString *poiId;
@property (nonatomic, strong) NSMutableArray *payAbstracts;
@property (nonatomic, strong) NSString *avgScore;
@property (nonatomic, strong) NSString *avgPrice;

- (void)setBaseModelWithDict:(NSDictionary *)dict;
@end
