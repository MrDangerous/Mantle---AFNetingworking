//
//  CarModel.m
//  AF
//
//  Created by XWQ on 15/5/13.
//  Copyright (c) 2015年 _Name.im_. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             NSStringFromSelector(@selector(name)) : @"data.name",
             NSStringFromSelector(@selector(picArr)) : @"data.picture",

             NSStringFromSelector(@selector(identiter)) : @"data.id",
             NSStringFromSelector(@selector(address)) : @"data.address",
             NSStringFromSelector(@selector(nearby)) : @"data.nearby",
             NSStringFromSelector(@selector(status)) : @"status",
             };
}
@end
