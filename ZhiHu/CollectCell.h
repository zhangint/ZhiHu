//
//  CollectCell.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

//@brief:收藏页面cell重写

#import <UIKit/UIKit.h>


@interface CollectCell : UITableViewCell

//主题
@property (weak, nonatomic) UILabel *titleLabel;

//副主题
@property (weak, nonatomic) UILabel *secondTitleLabel;

//中间分隔的线条
@property (weak, nonatomic) UILabel *lineLabel;

//主题发起人
@property (weak, nonatomic) UILabel *nameLabel;

//多少人关注
@property (weak, nonatomic) UILabel *noticeLabel;

//发起人头像
@property (weak, nonatomic) UIImageView *imgView;

//是否有副标题
@property (assign, nonatomic) BOOL hasSecondTitle;

//group风格 ，两边的空隙
@property (assign, nonatomic) NSInteger groupSpace;

@property (assign, nonatomic) NSInteger cellHeight;



@end
