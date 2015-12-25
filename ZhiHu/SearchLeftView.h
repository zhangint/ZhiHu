//
//  SearchLeftView.h
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewModel.h"

@interface SearchLeftView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (weak, nonatomic) NSMutableArray<Question*> *questionData;



- (void)viewInit:(NSMutableArray<Question*> *)questionData;

@end
