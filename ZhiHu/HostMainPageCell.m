//
//  HostMainPageCell.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "HostMainPageCell.h"
#import "PubDefine.h"

@implementation HostMainPageCell

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
    if (self)
    {
        if (indexPath.section == 0 && indexPath.row == 0)
        {
            [self initTitle];
        }
        else if(indexPath.section == 3)
        {
            [self initNormal:1];
        }
        else
        {
            [self initNormal:0];
        }
    }
    return self;
}

//标题部分的初始化
- (void)initTitle
{
    NSInteger normalSize = 12;               //通用字体大小
    NSInteger begin = 70;                   //label 开始的位置
    NSInteger step = (SWIDTH - begin) / 3;  //label 之间的间距 （水平）
    //NSInteger vstep = 4;                    //label 之间的垂直间距
    NSInteger vPos = 10;                    //垂直方向距离计算
   
    UIImageView *photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4, 20, 70, 70)];
    photoImageView.layer.cornerRadius = 35;
    photoImageView.layer.masksToBounds = YES;
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(begin, vPos, 200, 36)];
    userNameLabel.font = [UIFont fontWithName:@"ArialHebrew" size:16];
    [self.contentView addSubview:photoImageView];
    [self.contentView addSubview:userNameLabel];
    _photoImageView = photoImageView;
    _userNameLabel = userNameLabel;
    
    UILabel *upLine = [[UILabel alloc] initWithFrame:CGRectMake(SWIDTH-170, vPos+36+3, 170, 1)];
    upLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:upLine];
    
    vPos += 36;
    NSInteger vStep = 6;
    UILabel *userAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(begin+step*0, vPos+vStep, 80, 16)];
    userAnswerLabel.font = [UIFont fontWithName:@"ArialHebrew" size:normalSize];
    [self.contentView addSubview:userAnswerLabel];
    _userAnswerLabel = userAnswerLabel;
    
    UILabel *userAttentionLabel = [[UILabel alloc] initWithFrame:CGRectMake(begin+step*1, vPos+vStep, 80, 16)];
    userAttentionLabel.font = [UIFont fontWithName:@"ArialHebrew" size:normalSize];
    [self.contentView addSubview:userAttentionLabel];
    _userAttentionLabel = userAttentionLabel;
    
    UILabel *userAttentionedLabel = [[UILabel alloc] initWithFrame:CGRectMake(begin+step*2, vPos+vStep, 80, 16)];
    userAttentionedLabel.font = [UIFont fontWithName:@"ArialHebrew" size:normalSize];
    [self.contentView addSubview:userAttentionedLabel];
    _userAttentionedLabel = userAttentionedLabel;
    
    
    vPos += vStep + 16;
    vStep = 3;
    UILabel *answerName = [[UILabel alloc] initWithFrame:CGRectMake(begin, vPos+vStep, 80, 16)];
    answerName.font = [UIFont systemFontOfSize:normalSize];
    answerName.text = @"我的回答";
    answerName.textColor = [UIColor grayColor];
    [self.contentView addSubview:answerName];
    
    UILabel *attentionName = [[UILabel alloc] initWithFrame:CGRectMake(begin+step*1, vPos+vStep, 80, 16)];
    attentionName.font = [UIFont systemFontOfSize:normalSize];
    attentionName.text = @"我关注的人";
    attentionName.textColor = [UIColor grayColor];
    [self.contentView addSubview:attentionName];
    
    UILabel *attentionedName = [[UILabel alloc] initWithFrame:CGRectMake(begin+step*2, vPos+vStep, 80, 16)];
    attentionedName.font = [UIFont systemFontOfSize:normalSize];
    attentionedName.text = @"关注我的人";
    attentionedName.textColor = [UIColor grayColor];
    [self.contentView addSubview:attentionedName];
    
    //线条
    vPos += vStep + 16;
    vPos += 10;
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, vPos+vStep, SWIDTH, 1)];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineLabel];
    
    vPos +=  8;
    vStep = 4;
    UIImageView *glorifyImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, vPos+vStep, 12, 12)];
    glorifyImage.image = [UIImage imageNamed:@"glorify"];
    [self.contentView addSubview:glorifyImage];
    
    UILabel *glorifyLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, vPos+vStep, 50, 16)];
    glorifyLabel.font = [UIFont systemFontOfSize:normalSize];
    [self.contentView addSubview:glorifyLabel];
    _glorifyLabel = glorifyLabel;
    
    UIImageView *collectImage = [[UIImageView alloc] initWithFrame:CGRectMake(75, vPos+vStep, 12, 12)];
    collectImage.image = [UIImage imageNamed:@"love"];
    [self.contentView addSubview:collectImage];
    
    UILabel *collectLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, vPos+vStep, 50, 16)];
    collectLabel.font = [UIFont systemFontOfSize:normalSize];
    [self.contentView addSubview:collectLabel];
    _collectLabel = collectLabel;
    /*@property (weak, nonatomic) UILabel *userName;              //用户名
    @property (weak, nonatomic) UIImageView *photoView;         //用户头像
    @property (weak, nonatomic) UILabel *userAnswer;            //我的回答
    @property (weak, nonatomic) UILabel *userAttentionLabel;    //我关注的人
    @property (weak, nonatomic) UILabel *userAttentionedLabel;  //关注我的人
    @property (weak, nonatomic) UILabel *glorifyLabel;          //获取的赞
    @property (weak, nonatomic) UILabel *collectLabel;          //收藏*/
}

//通用cell 的初始化
- (void)initNormal:(NSInteger) isFriendly
{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 170, 20)];
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLabel];
    _nameLabel = nameLabel;
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(SWIDTH-40-25, 5, 20, 20)];
    numberLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:numberLabel];
    _numberLabel = numberLabel;
    
    if (isFriendly)
    {
        UIView* friendlyView = [[UIView alloc] initWithFrame:CGRectMake(SWIDTH-80, 5, 80, 20)];
        [self.contentView addSubview:friendlyView];
        _friendlyView = friendlyView;
    }
    else
    {
        UIImageView *detailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SWIDTH-40, 5, 20, 20)];
        
        [self.contentView addSubview:detailImageView];
        [self.contentView addSubview:detailImageView];
        _detailImageView = detailImageView;
    }
}




@end
