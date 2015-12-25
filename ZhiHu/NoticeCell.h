//
//  NoticeCell.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

//@brief:通知栏的cell

#import <UIKit/UIKit.h>




@class NoticeData;

@interface NoticeCell : UITableViewCell

//回答者的姓名
@property (weak, nonatomic) UILabel *nameLabel;

//有几个人回答了该问题
@property (weak, nonatomic) UILabel *stateLabel;

//问题名称
@property (weak, nonatomic) UILabel *questionLabel;

//线条View
@property (weak, nonatomic) UILabel *lineLabel;

//数据
@property (strong, nonatomic) NoticeData *noticeData;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



@end
