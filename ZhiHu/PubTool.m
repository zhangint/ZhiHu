//
//  PubTool.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "PubTool.h"

@implementation PubTool

+ (CGSize)stringSize:(NSString *) str maxSize:(CGSize) maxSize font:(UIFont *)font
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize strSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs                                            context:nil].size;
    
    return strSize;
}

+ (UIColor *)createColor:(CGFloat) red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/256 green:green/256 blue:blue/256 alpha:alpha];
}

@end
