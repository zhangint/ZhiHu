//
//  CollectCell.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "CollectCell.h"
#import "PubDefine.h"
#import "PubTool.h"

@implementation CollectCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = QUESTIONFONT;
        titleLabel.textColor = [PubTool createColor:0x19 green:0x19 blue:0x70 alpha:1.0];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        UILabel *secondTitleLabel = [[UILabel alloc] init];
        secondTitleLabel.font = NAMEFONT;
        secondTitleLabel.textColor = [UIColor grayColor];
        [self addSubview:secondTitleLabel];
        _secondTitleLabel = secondTitleLabel;
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineLabel];
        _lineLabel = lineLabel;
        
        UILabel *noticeLabel = [[UILabel alloc] init];
        noticeLabel.font = NAMEFONT;
        noticeLabel.textColor = [UIColor grayColor];
        [self addSubview:noticeLabel];
        _noticeLabel = noticeLabel;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = NAMEFONT;
        nameLabel.textColor = [UIColor grayColor];
        [self addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.layer.masksToBounds = YES;
        imgView.layer.cornerRadius = 15;
        [self addSubview:imgView];
        _imgView = imgView;
    }
    return self;
}

- (void)layoutSubviews
{
    if (_hasSecondTitle == YES)
    {
        _cellHeight = 100;
    }
    self.contentView.frame = CGRectMake(_groupSpace, 0, SWIDTH-2*_groupSpace, _cellHeight);
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 6;
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 1;
    
    NSInteger width = self.contentView.bounds.size.width;
    
    NSInteger vPos = 6;
    NSInteger hPos = _groupSpace + 6;
    _titleLabel.frame = CGRectMake(hPos, vPos, width-hPos, 20);
    vPos += 20;
    
    if (_hasSecondTitle)
    {
        vPos += 4;
        _secondTitleLabel.frame = CGRectMake(hPos, vPos, width-hPos, 20);
        vPos += 20;
    }
    
    vPos += 4;
    _lineLabel.frame = CGRectMake(hPos, vPos, width-hPos, 1);
    vPos += 1;
    
    vPos += 4;
    _imgView.frame = CGRectMake(hPos, vPos, 30, 30);
    hPos += 30;
    
    hPos += 6;
    _nameLabel.frame = CGRectMake(hPos, vPos, 200, 20);
    
    _noticeLabel.frame = CGRectMake(width-80, vPos, 120, 20);
}

@end
