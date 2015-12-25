//
//  PersonalLetterCell.m
//  ZhiHu
//
//  Created by zp on 15/12/23.
//  Copyright © 2015年 ZP. All rights reserved.
//

/**
**私信页面的cell
*
*/

#import "PersonalLetterCell.h"
#import "PubTool.h"
#import "PubDefine.h"

@implementation PersonalLetterCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _cellHeight = 50;
    //写私信cell 构造
    if (indexPath.row != 0)
    {
        [self initNormalCell];
    }
    else
    {
        [self initWriteCell];
    }
    return self;
}

//写私信
- (void)initWriteCell
{
    NSInteger midPoint = SWIDTH / 2 - 30;
    UIImageView *photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(midPoint, 16, 16, 16)];
    photoImage.image = [UIImage imageNamed:@"personalLetter"];
    [self.contentView addSubview:photoImage];
    _photoImage = photoImage;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(midPoint+24, 14, 120, 20)];
    titleLabel.font = NAMEFONT;
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.text = @"写私信";
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _cellHeight-1, SWIDTH, 1)];
    lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineLabel];
}

//通用私信
- (void)initNormalCell
{
    NSInteger hPos = 8;
    NSInteger vPos = 6;
    
    UIImageView *photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(hPos, vPos, 40, 40)];
    photoImage.layer.masksToBounds = YES;
    photoImage.layer.cornerRadius = 20;
    [self.contentView addSubview:photoImage];
    _photoImage = photoImage;
    hPos += 40;

    hPos += 6;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(hPos, vPos, 200, 20)];
    titleLabel.font = NAMEFONT;
    titleLabel.textColor = [PubTool createColor:0x4F green:0x4F blue:0x4F alpha:1.0];
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    vPos += 20;
    
    vPos += 3;
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(hPos, vPos, SWIDTH-30-hPos, 20)];
    contentLabel.textColor = [UIColor grayColor];
    contentLabel.font = NAMEFONT;
    [self.contentView addSubview:contentLabel];
    _contentLabel = contentLabel;
    
    UIImageView *detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(SWIDTH-30, 12, 16, 16)];
    [self.contentView addSubview:detailImage];
    _detailImage = detailImage;
}


@end
