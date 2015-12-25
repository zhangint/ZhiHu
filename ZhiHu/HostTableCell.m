//
//  HostTableCell.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "HostTableCell.h"
#import "PubDefine.h"

@implementation HostTableCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        NSUInteger rowno = indexPath.row;
        NSUInteger secno = indexPath.section;
        //姓名和头像的cell
        if (secno == 0 && rowno == 0)
        {
            [self initTitleCell];
        }
        //其它cell的初始化
        else
        {
            [self initNormalCell];
        }
       
    }
    return self;
}

//用户cell
- (void) initTitleCell
{
    UIImageView *photoView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 48, 48)];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 15, 200, 40)];
    UIImageView* selectView = [[UIImageView alloc] initWithFrame:CGRectMake(SWIDTH-10, 30, 24, 24)];
  
    photoView.layer.masksToBounds = YES;
    photoView.layer.cornerRadius = 24;
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:20];
    
    [self.contentView addSubview:photoView];
    [self.contentView addSubview:nameLabel];
    [self.contentView addSubview:selectView];
   
    _photoView = photoView;
    _nameLabel = nameLabel;
    _selectView = selectView;
}

 

//通用控件
- (void) initNormalCell
{
    UIImageView *photoView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 8, 24, 24)];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 4, 200, 32)];
    UIImageView* selectView = [[UIImageView alloc] initWithFrame:CGRectMake(SWIDTH-40, 4, 24, 24)];
    UISwitch * swiBtn = [[UISwitch alloc] initWithFrame:CGRectMake(SWIDTH-70, 5, 80, 30)];
    
    //默认情况下为隐藏
    swiBtn.hidden = YES;
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:swiBtn];
    [self.contentView addSubview:photoView];
    [self.contentView addSubview:nameLabel];
    [self.contentView addSubview:selectView];
    _photoView = photoView;
    _nameLabel = nameLabel;
    _swiBtn = swiBtn;
    _selectView = selectView;
    
    
}



@end
