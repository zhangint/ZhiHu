//
//  RightPage.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "RightPage.h"
#import "PersonalLetterCell.h"
#import "InfoViewModel.h"
#import "PubDefine.h"

@interface RightPage () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) NSMutableArray *pageData;

@end

@implementation RightPage

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewInit
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    _tableView = tableView;
}

- (void)setPageData:(NSMutableArray *) pageData
{
    _pageData = pageData;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _pageData.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"personalLetter";
    if (indexPath.row == 0)
    {
        cellId = @"firstPersonalLetter";
    }
    PersonalLetterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[PersonalLetterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId indexPath:indexPath];
    }
    if (indexPath.row > 0)
    {
         [self setCellData: _pageData[indexPath.row-1] personCell:cell];
    }
    return cell;
}

- (void) setCellData:(PersonalData *)celldata personCell:(PersonalLetterCell *)cell
{
    cell.photoImage.image = [UIImage imageNamed:celldata.imageName];
    cell.titleLabel.text = celldata.userName;
    if (celldata.Record.count > 0)
    {
        cell.contentLabel.text = celldata.Record[0].content;
    }
    if (![celldata.userName isEqualToString:SYSNAME])
    {
        cell.detailImage.image = [UIImage imageNamed:@"nextPage"];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}






/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
