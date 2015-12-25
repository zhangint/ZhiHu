//
//  QuestionCell.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

//@attention:该cell和Message

#import <UIKit/UIKit.h>
#import "InfoViewModel.h"


@interface QuestionCell : UITableViewCell

//提问或者答问的名称
@property (weak, nonatomic) UILabel *nameLabel;

//状态
@property (weak, nonatomic) UILabel *stateLabel;

//问题
@property (weak, nonatomic) UILabel *questionLabel;

//多少人回答
@property (weak, nonatomic) UILabel *answerNumLabel;

//一楼的答案
@property (weak, nonatomic) UILabel *topLevelLabel;

//用户头像 （该属性是messageView属性）
@property (weak, nonatomic) UIImageView *photoView;

//分割的线条
@property (weak, nonatomic) UILabel *lineLabel;


// 0 为Message的cell    1 消息栏的属性
@property (assign, nonatomic) BOOL showPhoto;

@property (weak, nonatomic) ThanksData *thankData;

@end
