//
//  DuoWanNetManager.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "DuoWanModel.h"

//凡是自己写的宏定义 都需要k开头，这是编码习惯
//很多具有共同点的东西，可以统一宏定义 ，比如
#define kOSType @"OSType":[@"iOS" stringByAppendingString:[UIDevice currentDevice].systemVersion]//9.1是当前手机系统版本，需要到info文件中取

#define kVersionName @"versionName": @"2.4.0"
#define kV           @"v": @140

#define kChangeKey(key)    [dic setObject:[dic objectForKey:[enName stringByAppendingString:key]]\
forKey:[@"desc" stringByAppendingString:key]];\
[dic removeObjectForKey:[enName stringByAppendingString:key]]

//把path写到文件头部，使用宏定义形式。方便后期维护
//把所有路径宏定义封装到DuoWanRequestPath.h文件中,太多东西放在文件头部,好乱的说😊
@implementation DuoWanNetManager

+ (id)getHeroWithType:(HeroType)type kCompletionHandle{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{kOSType, kV}];
    switch (type) {
        case HeroTypeFree: {
            [dic setObject:@"free" forKey:@"type"];
            break;
        }
        case HeroTypeAll: {
            [dic setObject:@"all" forKey:@"type"];
            break;
        }
        default:{
            NSAssert1(NO, @"%s:type类型不正确", __FUNCTION__);
        }
    }
    return [self GET:kHeroPath parameters:dic completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeFree: {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            case HeroTypeAll: {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj], error);
                break;
            }
            default:{
                completionHandle(nil, error);
            }
        }
    }];
}

+ (id)getHeroSkinsWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSkinPath parameters:@{kOSType, kV, kVersionName, @"hero": heroName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroSoundWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroSoundPath parameters:@{kOSType, kV, kVersionName, @"hero": enName} completionHandler:^(id responseObj, NSError *error) {
//Json数据就是标准数组，不需要解析
        completionHandle(responseObj, error);
    }];
}

+ (id)getHeroVideosWithPage:(NSInteger)page tag:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroVideoPath parameters:@{kOSType, kVersionName, @"action": @"l", @"p": @(page), @"src": @"letv", @"tag": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroCZWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroCZPath parameters:@{kV, kOSType, @"limit":@7, @"championName": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroDetailWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroDetailPath parameters:@{kV, kOSType, @"heroName": enName} completionHandler:^(id responseObj, NSError *error) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObj];
        kChangeKey(@"_Q");
        kChangeKey(@"_R");
        kChangeKey(@"_W");
        kChangeKey(@"_B");
        kChangeKey(@"_E");
        completionHandle([HeroDetailModel objectWithKeyValues:dic], error);
    }];
}

+ (id)getHeroGiftAndRun:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftAndRunPath parameters:@{kV, kOSType, @"hero": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroGiftModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getHeroInfoWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroInfoPath parameters:@{kV, kOSType, @"name": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId": @(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroWeekDataModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getToolMenukCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{kV, kVersionName, kOSType, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBCategorykCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBCategoryPath parameters:@{} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getZBItemListWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBItemListPath parameters:@{@"tag": tag, kV, kOSType, kVersionName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBItemModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

+ (id)getItemDetailWithItemId:(NSInteger)itemId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kItemDetailPath parameters:@{kV, kOSType, @"id": @(itemId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getGIftCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GiftModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getRunesCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kRunesPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RuneModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kSumAbilityPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getHeroBestGroupCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kBestGroupPath parameters:@{kV, kOSType} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestGroupModel objectWithKeyValues:responseObj], error);
    }];
}


@end










