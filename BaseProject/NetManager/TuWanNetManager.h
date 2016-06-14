//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by xhwhuhu on 16/6/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"

//只要共用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可
//如果不会 可以参考汽车之家接口
typedef NS_ENUM(NSUInteger, Infotype) {
    InfotypeTouTiao, //头条
    InfotypeDuJia,   //独家
    InfotypeAnHei3,  //暗黑3
    InfotypeMoShou,  //魔兽
    InfotypeFengBao, //风暴
    InfotypeLuShi,   //炉石
    InfotypeXingJi2, //星际2
    InfotypeShouWang,//守望
    InfotypeTuPian,  //图片
    InfotypeShiPin,  //视频
    InfotypeGongLue, //攻略
    InfotypeHuanHua, //幻化
    InfotypeQuWen,   //趣闻
    InfotypeCOS,     //COS
    InfotypeMeiNv,   //mein
};
@interface TuWanNetManager : BaseNetManager

+ (id)getTuWanInfoType:(Infotype)type start:(NSInteger) start completionHandle:(void(^)(TuWanModel *model, NSError *error))complete;

@end








