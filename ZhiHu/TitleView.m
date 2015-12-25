//
//  TitleView.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//


#import "TitleView.h"



@implementation TitleView

- (instancetype)init:(NSArray *)titleNames Font:(UIFont *)font withRect:(CGRect)rect
{
    self = [super init];
    if (self)
    {
        self.frame = rect;
        NSInteger count = titleNames.count;
        _width = rect.size.width / count;
        CGFloat height = rect.size.height;
        for (int i=0; i<count; i++)
        {
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_width*i, 0, _width, height)];
            nameLabel.textAlignment = UITextAlignmentCenter;
            nameLabel.font = font;
            nameLabel.text = titleNames[i];
            nameLabel.textColor = [UIColor grayColor];
            UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height-1, rect.size.width, 1)];
            lineLabel.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:lineLabel];
            [self addSubview:nameLabel];
        }
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)cellClicked:(UITapGestureRecognizer *)gesture
{
    CGPoint localPoint = [gesture locationInView:self];
    NSInteger index = localPoint.x / _width; 
    if ([_delegate respondsToSelector:@selector(titleClicked:)])
    {
        [_delegate titleClicked:index];
    }
}

//设置背景颜色
- (void)setBackColor:(UIColor *)backColor withIndex:(NSInteger) index
{
    if (index == -1)
    {
        self.backgroundColor = backColor;
    }
    else
    {
        if (self.subviews.count > index)
        {
            UILabel *label = (UILabel*)[self.subviews objectAtIndex:index];
            [label setBackgroundColor:backColor];
        }
    }
}

//设置字体颜色
- (void)setTextColor:(UIColor *)textColor
{
    for (UILabel *label in self.subviews)
    {
        [label setTextColor:textColor];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
