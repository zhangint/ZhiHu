//
//  Header.h
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define NAMEFONT        [UIFont systemFontOfSize:14]
#define QUESTIONFONT    [UIFont systemFontOfSize:16]

#define SWIDTH      [UIScreen mainScreen].bounds.size.width
#define SHEIGHT     [UIScreen mainScreen].bounds.size.height


#define STARTHEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height)

#define TABHEIGHT   (self.tabBarController.tabBar.frame.size.height)

//系统推送的用户名
#define SYSNAME     @"知乎"


#endif /* Header_h */
