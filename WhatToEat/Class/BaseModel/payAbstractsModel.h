//
//  payAbstractsModel.h
//  WhatToEat
//
//  Created by ConnorJ on 15/10/15.
//  Copyright © 2015年 ConnorJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface payAbstractsModel : NSObject
@property (nonatomic, copy) NSString *abstract;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *type;

- (void)setPayAbstractsModelWithDict:(NSDictionary *)dict;
@end
