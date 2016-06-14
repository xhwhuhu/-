//
//  XiMaNetManger.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaNetManger.h"

@implementation XiMaNetManger

+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void (^)(RankingListModel *, NSError *))complete{
    NSString *path = @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album";
    NSDictionary *params = @{@"device": @"iPhone", @"key": @"ranking:album:played:1:2", @"pageId": @(pageId), @"pageSize": @"20", @"title": @"排行榜",};
    path = [self percentPathWithPath:path params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([RankingListModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId completionHandle:(void (^)(AlbumModel *, NSError *))complete{
    NSString *path = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%ld/true/%ld/20", ID, pageId];
    return [self GET:path parameters:@{@"device": @"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        complete([AlbumModel objectWithKeyValues:responseObj], error);
    }];
}
@end
