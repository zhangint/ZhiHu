//
//  SearchCell.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewModel.h"

@interface SearchCell : UITableViewCell

//问题的标题
@property (weak, nonatomic) UILabel* titleLabel;

//答案
@property (weak, nonatomic) UILabel *answerLabel;

//计数
@property (weak, nonatomic) UILabel *numberLabel;

//用户头像
@property (weak, nonatomic) UIImageView *photoImage;

//详细信息图片
@property (weak, nonatomic) UIImageView *detailImage;

//cell的数据
@property (weak, nonatomic) Question *questionData;

//contentView的宽度
@property (assign, nonatomic) NSInteger contentViewWidth;



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *) indexPath;

@end
