//
//  SearchCenterView.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewModel.h"
#import "SearchCell.h"

@interface SearchCenterView : UIView

//热门页面的数据
@property (weak, nonatomic) NSMutableArray<Question*> *hotThemeData;

- (void)viewInit:(NSMutableArray<Question*> *)hotThemeData;

@end
