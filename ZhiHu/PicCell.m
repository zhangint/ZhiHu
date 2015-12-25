//
//  PicCell.m
//  ZhiHu
//
//  Created by zp on 15/12/25.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "PicCell.h"
#import "PubDefine.h"

@implementation PicCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 130)];
       
        [self.contentView addSubview:imgView];
        _imgView = imgView;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
