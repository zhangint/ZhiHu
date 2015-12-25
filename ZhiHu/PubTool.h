//
//  PubTool.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PubTool : NSObject


//获取string所需要的大小
+ (CGSize)stringSize:(NSString *) str maxSize:(CGSize) maxSize font:(UIFont *)font;

+ (UIColor *)createColor:(CGFloat) red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat) alpha;

@end
