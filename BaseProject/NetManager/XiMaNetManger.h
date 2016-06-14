//
//  XiMaNetManger.h
//  BaseProject
//
//  Created by xhwhuhu on 16/6/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

@interface XiMaNetManger : BaseNetManager

+ (id)getRankingListWithPageId:(NSInteger)pageId completionHandle:(void(^)(RankingListModel *model, NSError *error))complete;
+ (id)getAlbumWithId:(NSInteger)ID pageId:(NSInteger)pageId completionHandle:(void(^)(AlbumModel *model, NSError *error))complete;

@end
