//
//  QuestionCell.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "QuestionCell.h"
#import "PubDefine.h"
#import "PubTool.h"

@implementation QuestionCell

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
        questionLabel.numberOfLines = 2;
        questionLabel.font = QUESTIONFONT;
        [self.contentView addSubview:questionLabel];
        _questionLabel = questionLabel;
        
        UILabel *answerNumLabel = [[UILabel alloc] init];//1E90FF
        answerNumLabel.textAlignment = UITextAlignmentCenter;
        answerNumLabel.backgroundColor = [PubTool createColor:0x0 green:0x9A blue:0xCD alpha:1.0];
        answerNumLabel.layer.cornerRadius = 6;
        answerNumLabel.layer.masksToBounds = YES;
        answerNumLabel.font = NAMEFONT;
        answerNumLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:answerNumLabel];
        _answerNumLabel = answerNumLabel;
        
        UILabel *topLevelLabel = [[UILabel alloc] init];
        topLevelLabel.numberOfLines = 2;
        topLevelLabel.font = NAMEFONT;
        topLevelLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:topLevelLabel];
        _topLevelLabel = topLevelLabel;
        
        UIImageView *photoView = [[UIImageView alloc] init];
        photoView.layer.masksToBounds = YES;
        photoView.layer.cornerRadius = 15;
        [self.contentView addSubview:photoView];
        _photoView = photoView;
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:lineLabel];
        _lineLabel = lineLabel;
    }
    return self;
}



- (void) layoutSubviews
{
    //距离右边框的距离
    NSInteger right_dis = 20;
    if (_showPhoto == 0)
    {
        right_dis = 30;
    }
    NSInteger vPos = 5;
    NSInteger hPos = 6;
    
    _nameLabel.frame = CGRectMake(hPos, vPos, _thankData.userNameSize.width+6, _thankData.userNameSize.height);
    hPos += _thankData.userNameSize.width;  //间距移位
    
    hPos += 6;                              //控件之间间隙
    _stateLabel.frame = CGRectMake(hPos, vPos, SWIDTH-right_dis-hPos, _thankData.userNameSize.height+2);
    vPos += _thankData.userNameSize.height;
    
    hPos = 8;
    vPos += 4;
    int height = _thankData.questionSize.height;
    _questionLabel.frame = CGRectMake(hPos, vPos, SWIDTH-right_dis-hPos, _thankData.questionSize.height);
    vPos += _thankData.questionSize.height;
    
    _answerNumLabel.frame = CGRectMake(hPos, vPos, 40, 24);
    hPos += 40;
    
    hPos += 4;
    _topLevelLabel.frame = CGRectMake(hPos, vPos, SWIDTH-right_dis-hPos, _thankData.topAnswerSize.height);
    
    hPos += 60;
    hPos += 6;
    _photoView.frame = CGRectMake(SWIDTH-40, 8, 30, 30);
    
    _lineLabel.frame = CGRectMake(30, _thankData.cellHeight-1, SWIDTH-30, 1);
}

@end
