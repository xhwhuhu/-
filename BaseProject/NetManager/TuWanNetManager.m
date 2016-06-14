//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"

#define kPath @"http://cache.tuwan.com/app/"
@implementation TuWanNetManager

+ (id)getTuWanInfoType:(Infotype)type start:(NSInteger)start completionHandle:(void (^)(TuWanModel *, NSError *))complete{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"appid": @1, @"appver": @2.1, @"start":@(start)}];
    switch (type) {
        case InfotypeTouTiao: {
            [params setObject:@"cos" forKey:@"class"];
            [params setObject:@"cos" forKey:@"mod"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@0 forKey:@"dtid"];
            break;
        }
        case InfotypeDuJia: {
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"八卦" forKey:@"mod"];
            break;
        }
        case InfotypeAnHei3: {
            [params setObject:@83623 forKey:@"dtid"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
        case InfotypeMoShou: {
            [params setObject:@31537 forKey:@"dtid"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
        case InfotypeFengBao: {
            [params setObject:@31538 forKey:@"dtid"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
        case InfotypeLuShi: {
            [params setObject:@31528 forKey:@"dtid"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
        case InfotypeXingJi2: {
            [params setObject:@91821 forKey:@"dtid"];
            break;
        }
        case InfotypeShouWang: {
            [params setObject:@57067 forKey:@"dtid"];
            break;
        }
        case InfotypeTuPian: {
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            [params setObject:@"pic" forKey:@"type"];
            break;
        }
        case InfotypeShiPin: {
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            [params setObject:@"video" forKey:@"type"];
            break;
        }
        case InfotypeGongLue: {
            [params setObject:@"83623,31528,31537,31538,57067,91821" forKey:@"dtid"];
            [params setObject:@"guide" forKey:@"type"];
            break;
        }
        case InfotypeHuanHua: {
            [params setObject:@"幻化" forKey:@"mod"];
            [params setObject:@"heronews" forKey:@"class"];
            break;
        }
        case InfotypeQuWen: {
            [params setObject:@0 forKey:@"dtid"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"趣闻" forKey:@"mod"];
            break;
        }
        case InfotypeCOS: {
            [params setObject:@0 forKey:@"dtid"];
            [params setObject:@"cos" forKey:@"mod"];
            [params setObject:@"cos" forKey:@"class"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
        case InfotypeMeiNv: {
            [params setObject:@"cos1" forKey:@"typechild"];
            [params setObject:@"美女" forKey:@"mod"];
            [params setObject:@"heronews" forKey:@"class"];
            [params setObject:@"indexpic" forKey:@"classmore"];
            break;
        }
    }
    NSString *path = [self percentPathWithPath:kPath params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}

@end
