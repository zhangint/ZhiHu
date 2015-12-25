//
//  MessData.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

//@attention:该部分数据结构复用了 赞与感谢页面的  部分的数据结构封装
//           头文件为 InfoViewModel.h
//           复用结构为 ThanksData

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InfoViewModel.h"



@interface MessData : NSObject

@property (strong, nonatomic) NSMutableArray<ThanksData*> *messArr;

@end
