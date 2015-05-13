//
//  CarModel.h
//  AF
//
//  Created by XWQ on 15/5/13.
//  Copyright (c) 2015年 _Name.im_. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"


@interface CarModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *identiter;
@property (nonatomic, copy, readonly) NSString *address;
@property (nonatomic, copy, readonly) NSString *nearby;

@property (nonatomic, copy, readonly) NSNumber *status;
@property (nonatomic, strong) NSArray *picArr;

@end
