//
//  HostMainPage.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "HostMainPage.h" 
#import "PubDefine.h"
#import "HostMainPageCell.h"

@interface HostMainPage () <UITableViewDataSource, UITableViewDelegate>

//Host相关数据维护类
@property (weak, nonatomic) HostModel *hostModel;

//tableView用于显示相关信息
@property (weak, nonatomic) UITableView *tableView;

@end


@implementation HostMainPage

NSInteger initCellNum;

- (instancetype)initUserData:(HostModel *)hostModel
{
    self = [super init];
    if (self)
    {
        _hostModel = hostModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, SHEIGHT)];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HostMainPageCell *cell = [[HostMainPageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mainPageCell" indexPath:indexPath];
    [self setCellData:cell indexPath:indexPath];
    initCellNum++;
    initCellNum = (initCellNum % _hostModel.pageArray.count == 0 ) ? 1:initCellNum;
    
    //initCellNum++;
    return cell;
}

- (void)setCellData:(HostMainPageCell *)cell indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        [self setTitleData:cell];
    }
    else
    {
        [self setNormalData:cell indexPath:indexPath];
    }
}

- (void)setNormalData:(HostMainPageCell *)cell indexPath:(NSIndexPath *)indexPath
{
    
    cell.nameLabel.text = [_hostModel.pageArray objectAtIndex:initCellNum-1];
    cell.detailImageView.image = [UIImage imageNamed:@"hostClicked"];
    if (indexPath.section == 2 || indexPath.section == 4)
    {
        cell.numberLabel.text = @"12";
    }
    else if (indexPath.section == 3)
    {
        UIImage *img = [UIImage imageNamed:@"friendly"];
        for (int i=0; i<3; i++)
        {
            UIImageView *startImage = [[UIImageView alloc] initWithFrame:CGRectMake(5+20*i, 0, 20, 20)];
            startImage.image = img;
            [cell.friendlyView addSubview:startImage];
        }
    }
}

- (void)setTitleData:(HostMainPageCell *)cell
{
    cell.userNameLabel.text = @"张乎乎";
    cell.photoImageView.image = [UIImage imageNamed:@"myPhoto"];
    cell.userAnswerLabel.text = @"1";
    cell.userAttentionLabel.text = @"23";
    cell.userAttentionedLabel.text = @"50";
    cell.glorifyLabel.text = @"12";
    cell.collectLabel.text = @"23";
    /*
    //@property (weak, nonatomic) UILabel *userNameLabel;              //用户名
    @property (weak, nonatomic) UIImageView *photoImageView;         //用户头像
    @property (weak, nonatomic) UILabel *userAnswerLabel;            //我的回答
    @property (weak, nonatomic) UILabel *userAttentionLabel;    //我关注的人
    @property (weak, nonatomic) UILabel *userAttentionedLabel;  //关注我的人
    @property (weak, nonatomic) UILabel *glorifyLabel;          //获取的赞
    @property (weak, nonatomic) UILabel *collectLabel;          //收藏cell.
     */
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (section == 4)
    {
        UIView *infoView = [[UIView  alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, 40)];
        infoView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //infoView.backgroundColor = [UIColor grayColor];
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 120, 20)];
        infoLabel.textColor = [UIColor grayColor];
        infoLabel.text = @"仅自己可见";
        infoLabel.font = [UIFont systemFontOfSize:14];
        [infoView addSubview:infoLabel];
        return infoView;
    }
    else
        return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        return 130;
    }
    else
    {
        return 40;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 3;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4 || section == 3)
    {
        return 0;
    }
    return 20;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 4)
    {
        return 40;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
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
