//
//  hostView.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "HostView.h"
#import "HostTableCell.h"
#import "PubDefine.h"
#import "HostModel.h"
#import "HostMainPage.h"

@interface HostView () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) HostModel *hostData;

@end

@implementation HostView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //数据初始化
    _hostData = [[HostModel alloc] initData];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT)];
    //去掉tableView 底部多余的分割线
    tableView.tableFooterView = [[UIView alloc] init];
    
    //tableView.backgroundColor = [UIColor grayColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HostTableCell *cell = [[HostTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hostcell" indexPath:indexPath];
    
    [self setCellData:indexPath hostTableCell:cell];
    
    return cell;
    
    /* //该页面为个人中心设置页面，tableview的cell较少，而且cell的行数不多，就不用循环队列了
     static NSString *cellId = @"cellId";
    HostTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
    {
        cell = [[HostTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }*/
}

- (void) setCellData:(NSIndexPath *)indexPath hostTableCell:(HostTableCell *) cell
{
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        cell.photoView.image = [UIImage imageNamed:@"myPhoto"];
        cell.nameLabel.text = @"张乎乎";
        cell.selectView.image = [UIImage imageNamed:@"hostClicked"];
        return;
    }
    if (indexPath.section == 2 && indexPath.row == 1)
    {
        cell.swiBtn.hidden = NO;
        cell.selectView.hidden = YES;
    }
    cell.nameLabel.text = [_hostData.titleArray objectAtIndex:(indexPath.section-1)*3+indexPath.row];
    NSString *imageName = [_hostData.picArray objectAtIndex:(indexPath.section-1)*3+indexPath.row];
    cell.photoView.image = [UIImage imageNamed:imageName]; 
    cell.selectView.image = [UIImage imageNamed:@"hostClicked"];
}


- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2)
        return 0;
    return 20;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 70;
    }
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showMainPage];
    
}

- (void)showMainPage
{
    HostMainPage *mainPage = [[HostMainPage alloc] initUserData:_hostData];
    mainPage.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:mainPage animated:YES];
    //mainPage.backgroundColor = [UIColor grayColor];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
