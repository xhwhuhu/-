//
//  ItemDetailModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id", @"desc": @"description"};
}
@end


@implementation ItemDetailExtattrsModel
+ (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName firstCharUpper];
}
@end


