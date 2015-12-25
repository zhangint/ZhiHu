//
//  CenterPage.h
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewModel.h"

@interface CenterPage : UIView


//界面初始化
- (void)viewInit;

//设置该类的数据模型
- (void) setDataModel:(InfoViewModel *)infoModel;

@end
