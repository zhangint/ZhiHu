//
//  NoticeCell.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "NoticeCell.h"
#import "InfoViewModel.h"
#import "PubTool.h"
#import "PubDefine.h"


@implementation NoticeCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor lightGrayColor];
        nameLabel.font = NAMEFONT;
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        UILabel *stateLabel = [[UILabel alloc] init];
        stateLabel.textColor = [UIColor grayColor];
        stateLabel.font = NAMEFONT;
        [self.contentView addSubview:stateLabel];
        _stateLabel = stateLabel;
        
        UILabel *questionLabel = [[UILabel alloc] init];
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = QUESTIONFONT;
        questionLabel.numberOfLines = 2;                    //允许多行显示
        [self.contentView addSubview:questionLabel];
        _questionLabel = questionLabel;
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:lineLabel];
        _lineLabel = lineLabel;
    }
    return self;
}

- (void) layoutSubviews
{
    
    int width = _noticeData.firstNameSize.width+6;
    NSInteger vPos = 8;
    NSInteger hPos = 12;
    _nameLabel.frame = CGRectMake(hPos, vPos, width, _noticeData.firstNameSize.height);
    hPos += width;
    
    _stateLabel.frame = CGRectMake(hPos+2, vPos, SWIDTH-hPos-12, _noticeData.firstNameSize.height);
    vPos += _noticeData.firstNameSize.height;
    
    vPos += 4;
    hPos = 12;
    _questionLabel.frame = CGRectMake(hPos, vPos, SWIDTH-hPos-12, _noticeData.questionNameSize.height + 8);
    
    _lineLabel.frame = CGRectMake(30, _noticeData.rowHeight-1, SWIDTH, 1);
    //第一个姓名字符串的长度
    //@property (assign, nonatomic) CGSize firstNameSize;
    
    //问题字符串的长度
    //@property (assign, nonatomic) CGSize questionNameSize;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
