//
//  TuWanModel.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel


@end

@implementation TuWanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuWanDataIndexpicModel class], @"list": [TuWanDataIndexpicModel class]};
}

@end


@implementation TuWanDataIndexpicModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuWanDataIndexpicShowitemModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName": @"typename", @"desc": @"description"};
}
@end


@implementation TuWanDataIndexpicInfochildModel

@end


@implementation TuWanDataIndexpicShowitemModel

@end


@implementation TuWanDataIndexpicShowitemInfoModel

@end



