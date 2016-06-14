//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by xhwhuhu on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
/** 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithType:(Infotype)type;
@property (nonatomic) Infotype *type;

@property (nonatomic) NSInteger rowNumber;
/** 判断某一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/** 返回列表中某行数据的题目 */
- (NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row;
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row;

/** 滚动展示栏的图片 */
- (NSURL *)iconURLForrowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property (nonatomic) NSInteger indexPicNumber;

/** 存放头部滚动栏 */
@property (nonatomic, strong) NSArray *indexPicArr;
/** 是否有头部滚动栏 */
@property (nonatomic, getter=isExistIndexPic) BOOL existIndexPic;

@property (nonatomic) NSInteger start;  //当前页数索引值







@end















