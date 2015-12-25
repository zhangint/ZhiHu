//
//  PersonalLetterCell.h
//  ZhiHu
//
//  Created by zp on 15/12/23.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalLetterCell : UITableViewCell

//照片
@property (weak, nonatomic) UIImageView *photoImage;

//名称
@property (weak, nonatomic) UILabel  *titleLabel;

//内容
@property (weak, nonatomic) UILabel *contentLabel;

//详细按钮的图片
@property (weak, nonatomic) UIImageView *detailImage;

//cell的高度 默认为50
@property (assign, nonatomic) NSInteger cellHeight;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@end
