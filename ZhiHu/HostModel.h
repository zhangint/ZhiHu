//
//  HostModel.h
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//@会被两个页面访问，还是不用单例模式吧

@interface HostModel : NSObject



//主页的标题
@property (strong, readonly, nonatomic) NSArray *titleArray;

//标题下的图片名称
@property (strong, readonly, nonatomic) NSArray *picArray;

//头像
@property (strong, nonatomic) UIImage *photoImage;

//用户名
@property (strong, nonatomic) NSString *userName;

//默认数据初始化
- (instancetype)initData;

//个人主页下的相关属性  HostMainPge.h

//label显示属性名称的集合
@property (strong, readonly, nonatomic) NSArray *pageArray;

#pragma mask 属性分组1
@property (assign, nonatomic) NSUInteger userAttention;     //我关注的人
@property (assign, nonatomic) NSUInteger userAttentioned;   //关注我的人
@property (assign, nonatomic) NSUInteger glorify;           //被赞(荣誉）
@property (assign, nonatomic) NSUInteger collect;           //被收藏

#pragma  mask 属性分组2
@property (assign, nonatomic) NSUInteger userAnswer;        //我的回答
@property (assign, nonatomic) NSUInteger userAsk;           //用户提问
@property (assign, nonatomic) NSUInteger userArticle;       //我的文章
@property (assign, nonatomic) NSUInteger friendly;          //友善度

@end
