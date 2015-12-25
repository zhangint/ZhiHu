//
//  HostMainPage.h
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

//HostView下的个人主页

#import <UIKit/UIKit.h>
#import "HostModel.h"

@interface HostMainPage : UIViewController

- (instancetype) initUserData:(HostModel *)hostModel;
@end
