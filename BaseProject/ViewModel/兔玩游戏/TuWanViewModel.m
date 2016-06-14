//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
- (instancetype)initWithType:(Infotype)type{
    if (self = [super init]) {
        _type = &type;
    }
    return self;
}
//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
//如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __FUNCTION__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getTuWanInfoType:*(_type) start:_start completionHandle:^(TuWanModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (BOOL)isExistIndexPic{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

/** 根据showtype 0是没有图，1是有图 */
- (BOOL)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

- (NSString *)titleForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].longtitle;
}
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"人浏览"];
}

/** 滚动展示栏的图片 */
- (NSURL *)iconURLForrowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}

/** 滚动展示栏的图片数量 */
- (NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}



@end
