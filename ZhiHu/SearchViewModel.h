//
//  SearchViewModel.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

/** @brief:查找view的所有数据结构封装
 *
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/////////////////////////////////////////////////////////////////////
//                  推荐页面 和 热门页面 数据格式封装
/////////////////////////////////////////////////////////////////////

//答案的详细信息
@interface AnswerDetail : NSObject

//用户名
@property (strong, nonatomic) NSString *userName;

//用户头像
@property (strong, nonatomic) NSString *userPhoto;

//点赞数
@property (assign, nonatomic) NSInteger glorifyNum;

//答案详细信息
@property (strong, nonatomic) NSString *answerDetail;

@end

@interface Question : NSObject

//问题
@property (strong, nonatomic) NSString *questionName;

//答案列表
@property (strong, nonatomic) NSMutableArray *answerArr;

//问题的大小信息
@property (assign, nonatomic) CGSize questionSize;

//第一个答案的大小信息
@property (assign, nonatomic) CGSize firstAnsSize;

//cell的高度
@property (assign, nonatomic) NSInteger height;

@end

//////////////////////////////////////////////////////////////////////
                    //收藏页面数据封装
//////////////////////////////////////////////////////////////////////

@interface Collection : NSObject

//标题
@property (strong, nonatomic) NSString *title;

//副标题  (可以为空 nil)
@property (strong, nonatomic) NSString *secondTitle;

//作者
@property (strong, nonatomic) NSString *author;

//关注人数
@property (assign, nonatomic) NSInteger wathchNum;

//作者头像名称
@property (strong, nonatomic) NSString *authorPhoto;

//cell的高度
@property (assign, nonatomic) NSInteger height;

@end

@interface SearchViewModel : NSObject

//推荐数据结构
@property (strong, nonatomic) NSMutableArray<Question*> *recommandArr;

//热门数据结构
@property (strong, nonatomic) NSMutableArray<Question*> *hotThemeArr;

//收藏数据结构
@property (strong, nonatomic) NSMutableArray<Collection*> *collectionArr;

@end
