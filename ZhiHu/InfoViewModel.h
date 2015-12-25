//
//  InfoViewModel.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**  @brief:为了方便，将该模块的所有数据模型都封装在该文件中
 *
 *
 */

/**
*通知    部分的数据结构封装
*
*/
 @interface NoticeData : NSObject

//回答该问题的用户名集合
@property (strong, nonatomic) NSMutableArray *answerNames;

//问题名称
@property (strong, nonatomic) NSString *questionName;

//第一个姓名字符串的长度 
@property (assign, nonatomic) CGSize firstNameSize;

//问题字符串的长度
@property (assign, nonatomic) CGSize questionNameSize;

//celelrow的高度
@property (assign, nonatomic) NSInteger rowHeight;

- (instancetype)init;

@end


/**
 *赞与感谢  部分的数据结构封装
 *
 */
typedef NS_ENUM(NSInteger, AnswerState)
{
    NS_GLORIFY = 0,     //赞扬
    NS_GREEN,           //赞同
    NS_COLLECT,         //收藏
    NS_THANK,           //感谢
    NS_NOTICE,          //关注

};

@interface ThanksData : NSObject

//用户名
@property (strong, nonatomic) NSString *userName;

//状态
@property (assign, nonatomic) AnswerState answerState;

//问题名称
@property (strong, nonatomic) NSString *question;

//有多少人回答
@property (assign, nonatomic) NSInteger numberAnswer;

//第一个人的答案
@property (strong, nonatomic) NSString *topAnswer;

//用户的头像
@property (strong, nonatomic) NSString *userPhoto;

//////////////////////////////////////////////////////////////////////////
                        //布局部分的属性
//////////////////////////////////////////////////////////////////////////

//用户名的大小
@property (assign, nonatomic) CGSize userNameSize;

//问题名称的大小
@property (assign, nonatomic) CGSize questionSize;

//第一层答案的大小
@property (assign, nonatomic) CGSize topAnswerSize;

//cell的高度
@property (assign, nonatomic) NSInteger cellHeight;

@end

/**
 *私信 栏的数据封装
 *
 */

//聊天信息的封装

typedef NS_ENUM(NSInteger, CHAT_DIRECTION)
{
    NS_ME = 0,      //我发出的消息
    NS_OTTHER         //对方发出的消息
};

@interface ChatRecord : NSObject

@property (strong, nonatomic) NSString *content;

@property (assign, nonatomic) CHAT_DIRECTION direction;

@end

@interface PersonalData : NSObject

//用户名
@property (strong, nonatomic) NSString *userName;

//用户的头像  (先用文件，如果网络的话数据格式应该是UIImage
@property (strong, nonatomic) NSString *imageName;

//聊天信息的记录
@property (strong, nonatomic) NSMutableArray<ChatRecord*> *Record;

@end


@interface InfoViewModel : NSObject

//通知 栏的数据集合
@property (strong, nonatomic) NSMutableArray *noticeData;

//赞与感谢 栏的数据集合
@property (strong, nonatomic) NSMutableArray *thanksData;

//私信部分 数据集合
@property (strong, nonatomic) NSMutableArray<PersonalData*> *letterData;


@end
