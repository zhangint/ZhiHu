
//
//  SearchCell.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchCell.h"
#import "PubDefine.h"
#import "PubTool.h"

@implementation SearchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *) indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self cellInit];
    return self;
}

- (void)cellInit
{ 
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = QUESTIONFONT;
    //607B8B 4A708B 27408B
    titleLabel.textColor = [PubTool createColor:0x27 green:0x40 blue:0x8B alpha:1.0];
    titleLabel.numberOfLines = 2;
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UILabel *answerLabel = [[UILabel alloc] init];
    answerLabel.font = NAMEFONT;
    answerLabel.textColor = [UIColor grayColor];
    answerLabel.numberOfLines = 4;
    [self.contentView addSubview:answerLabel];
    _answerLabel = answerLabel;
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.font = NAMEFONT;
    numberLabel.textAlignment = UITextAlignmentCenter;
    numberLabel.layer.cornerRadius = 6;
    numberLabel.layer.masksToBounds = YES;
    numberLabel.backgroundColor = [PubTool createColor:0x98 green:0xFB blue:0x98 alpha:1.0];
    [self.contentView addSubview:numberLabel];
    _numberLabel = numberLabel;
    
    UIImageView *photoImage = [[UIImageView alloc] init];
    _photoImage.layer.masksToBounds = YES;
    _photoImage.layer.cornerRadius = 10;
    [self.contentView addSubview:photoImage];
    _photoImage = photoImage;
    
    UIImageView *detailImage = [[UIImageView alloc] init];
    [self.contentView addSubview:detailImage];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _detailImage = detailImage;
}
//重新布局
- (void)layoutSubviews
{
    self.contentView.frame = CGRectMake(8, 0, SWIDTH-_contentViewWidth, _questionData.height);
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 1;
    
    NSInteger hPos = 5;
    NSInteger vPos = 6;
    NSInteger width = self.contentView.frame.size.width;
    _titleLabel.frame = CGRectMake(hPos, vPos, width-40, _questionData.questionSize.height);
    _detailImage.frame = CGRectMake(width-30, vPos, 20, 20);
    vPos += _questionData.questionSize.height;
    
    vPos += 2;
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, vPos, width, 1)];
    lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineLabel];
    vPos += 1;
    
    vPos += 4;
    _photoImage.frame = CGRectMake(5, vPos+1, 32, 32);
    _numberLabel.frame = CGRectMake(6, vPos+1+32+2, 30, 20);
    
    hPos = 40;
    _answerLabel.frame = CGRectMake(hPos, vPos, width-40, _questionData.firstAnsSize.height);


}


@end
