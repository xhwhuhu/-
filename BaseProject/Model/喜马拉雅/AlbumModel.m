//
//  AlbumModel.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end


@implementation AlbumAlbumModel

@end


@implementation AlbumTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AlbumTracksListModel class]};
}

@end


@implementation AlbumTracksListModel

@end

