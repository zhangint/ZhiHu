//
//  SearchRightView.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchRightView.h"
#import "SearchViewModel.h"
#import "CollectCell.h"
#import "PubDefine.h"
#import "PubTool.h"

@interface SearchRightView() <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) NSMutableArray *collectionData;

@end

@implementation SearchRightView




- (void)viewInit:(NSMutableArray<Collection*> *) collectionData
{
    _collectionData = collectionData;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    _tableView = tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"collect";
    CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[CollectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    Collection *colData = [_collectionData objectAtIndex:indexPath.section];
    cell.cellHeight = 80;
    cell.groupSpace = 10;
    cell.hasSecondTitle = [self hasSecondTitle:colData];
    [cell setNeedsLayout];
    [self setCellData:cell colData:colData hasSecond:cell.hasSecondTitle];
    
    return cell;
}

- (void)setCellData:(CollectCell *)cell colData:(Collection *)colData hasSecond:(BOOL)secondTitle
{
    cell.titleLabel.text = colData.title;    
    cell.nameLabel.text = colData.author;
    cell.noticeLabel.text = [NSString stringWithFormat:@"%ld 人关注", colData.wathchNum];
    cell.imgView.image = [UIImage imageNamed:colData.authorPhoto];
    if (secondTitle)
    {
        cell.secondTitleLabel.text = colData.secondTitle;
    }
}

//判断是否有副标题
- (BOOL)hasSecondTitle:(Collection *)colData
{
    BOOL hasSecond = NO;
    if (colData.secondTitle!=nil && colData.secondTitle.length>0)
    {
        hasSecond = YES;
    }
    return hasSecond;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Collection *colData = [_collectionData objectAtIndex:indexPath.section];
    if ([self hasSecondTitle:colData])
    {
        colData.height = 100;
    }
    else
    {
        colData.height = 80;
    }
    
    return colData.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _collectionData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
