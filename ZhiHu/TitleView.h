//
//  TitleView.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

/**@brief:根据标题的个数对UIView进行分组，当点击事件发生的时候，触发titleClicked协议
 *
 * @attention:字体颜色默认为灰色
 */


#import <UIKit/UIKit.h>

@protocol TitleDelegate <NSObject>

//@parameter    index:被点击编号，从0开始
- (void)titleClicked:(NSInteger)index;

@end

@interface TitleView : UIView

@property (weak, nonatomic) id<TitleDelegate> delegate;

//每一个title的宽度
@property (readonly, nonatomic) CGFloat width;

//@parameter    titleName:标题分组集合
//              font:字体
//              rect:该UIView的位置和大小

//@attention
- (instancetype)init:(NSArray *)titleNames Font:(UIFont *)font withRect:(CGRect)rect;

//设置背景颜色
- (void)setBackColor:(UIColor *)backColor withIndex:(NSInteger)index;

//设置字体颜色
- (void)setTextColor:(UIColor *)textColor;



@end
