//
//  HostModel.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "HostModel.h"

@implementation HostModel

- (instancetype)initData
{
    self = [super init];
    if (self)
    {
        _titleArray = @[@"我的关注", @"我的收藏", @"我的草稿", @"反馈帮助中心", @"夜间模式", @"设置"];
        _picArray = @[@"attention", @"collect",  @"draft", @"help", @"dark", @"set"];
        _pageArray = @[ @"全部动态", @"我的回答", @"我的提问",@"我的文章", @"友善度", @"微博好友"];
         
    }
    return self;
}

@end
