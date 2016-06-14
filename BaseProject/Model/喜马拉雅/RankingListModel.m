//
//  RankingListModel.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RankingListModel.h"

@implementation RankingListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RankListListModel class]};
}
@end
@implementation RankListListModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID": @"id"};
}

@end
