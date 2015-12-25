//
//  LeftPage.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoViewModel;

@interface LeftPage : UIView
 

//设置数据模型
- (void)setDataModel:(InfoViewModel *)infoModel;


- (void)viewInit;

@end
