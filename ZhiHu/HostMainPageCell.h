//
//  HostMainPageCell.h
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostMainPageCell : UITableViewCell


//第一个表格属性列表
@property (weak, nonatomic) UILabel *userNameLabel;              //用户名
@property (weak, nonatomic) UIImageView *photoImageView;         //用户头像
@property (weak, nonatomic) UILabel *userAnswerLabel;            //我的回答
@property (weak, nonatomic) UILabel *userAttentionLabel;    //我关注的人
@property (weak, nonatomic) UILabel *userAttentionedLabel;  //关注我的人
@property (weak, nonatomic) UILabel *glorifyLabel;          //获取的赞
@property (weak, nonatomic) UILabel *collectLabel;          //收藏

//其它表格的属性列表
@property (weak, nonatomic) UILabel *nameLabel;             //属性名称
@property (weak, nonatomic) UILabel *numberLabel;           //属性值
@property (weak, nonatomic) UIImageView *detailImageView;   //显示详细信息的image 该属性和友善度复用
@property (weak, nonatomic) UIView *friendlyView;           //显示友好信息的view
//@property (weak, nonatomic) UIImageView *numberLabel;       //属性值

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@end
