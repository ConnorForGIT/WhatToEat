//
//  payAbstractsModel.m
//  WhatToEat
//
//  Created by ConnorJ on 15/10/15.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import "payAbstractsModel.h"

@implementation payAbstractsModel
- (void)setPayAbstractsModelWithDict:(NSDictionary *)dict
{
    self.abstract = [dict objectForKey:@"abstract"];
    self.iconUrl = [dict objectForKey:@"icon_url"];
    self.type = [dict objectForKey:@"type"];
}
@end
