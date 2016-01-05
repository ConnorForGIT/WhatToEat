//
//  BaseModel.m
//  WhatToEat
//
//  Created by ConnorJ on 15/10/14.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import "BaseModel.h"
#import "payAbstractsModel.h"

@implementation BaseModel

- (void)setBaseModelWithDict:(NSDictionary *)dict
{
    NSDictionary *theDic = [dict objectForKey:@"poi"];
    self.name = [theDic objectForKey:@"name"];
    self.addr = [theDic objectForKey:@"addr"];
    self.frontImg = [theDic objectForKey:@"frontImg"];
    self.poiId = [theDic objectForKey:@"poiid"];
    self.avgPrice = [theDic objectForKey:@"avgPrice"];
    self.avgScore = [theDic objectForKey:@"avgScore"];
    
    self.payAbstracts = [NSMutableArray array];
    for (NSDictionary *dic in [theDic objectForKey:@"payAbstracts"]) {
        payAbstractsModel *model = [[payAbstractsModel alloc] init];
        [model setPayAbstractsModelWithDict:dic];
        [self.payAbstracts addObject:model];
    }
    
}

@end
