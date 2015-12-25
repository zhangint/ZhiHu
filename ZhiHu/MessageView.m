//
//  messageView.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "MessageView.h"
#import "PubDefine.h"
#import "PubTool.h"
#import "MessData.h"
#import "QuestionCell.h"

@interface MessageView () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) UITextField *searchFiled;

@property (weak,  nonatomic) UIButton *searchBtn;

@property (weak, nonatomic) NSMutableArray<ThanksData*> *messDataArr;

@property (strong, nonatomic) MessData *messData;


@end

@implementation MessageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _messData = [[MessData alloc] init];
    
    _messDataArr = _messData.messArr;
    [self viewInit];
    self.navigationItem.titleView = [self titleView];
    //self.navigationController.navigationItem.titleView = [self titleView];
}

- (UIView *)titleView
{
    //NSInteger statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    NSInteger navHeight = self.navigationController.navigationBar.frame.size.height;
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, navHeight)];
    
    UITextField *searchFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 8, SWIDTH-40, 25)];
    searchFiled.delegate = self;
    searchFiled.borderStyle = UITextBorderStyleRoundedRect;
    searchFiled.placeholder = @"搜索问题、话题、人";
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(SWIDTH-35, 8, 25, 25)];
    [searchBtn setTitle:@"找" forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [titleView addSubview:searchBtn];
    [titleView addSubview:searchFiled];
    
    _searchFiled = searchFiled;
    _searchBtn = searchBtn;
    
    return titleView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)viewInit
{
    NSInteger height = SHEIGHT - TABHEIGHT;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, SWIDTH, height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    _tableView = tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"QuestionCell";
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[QuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //传递数据，用于重新布局
    [cell setThankData:[_messDataArr objectAtIndex:indexPath.row]];
    [cell setShowPhoto:YES];
    [cell setNeedsLayout];
    [self setCellData:[_messDataArr objectAtIndex:indexPath.row] cellView:cell];
    return cell;
}

- (void)setCellData:(ThanksData *)celldata cellView:(QuestionCell *)cellView
{
    
    NSString *state;
    switch (celldata.answerState) {
        case NS_GLORIFY:
            state = @"赞扬";
            break;
        case NS_GREEN:
            state = @"同意";
            break;
        case NS_COLLECT:
            state = @"收藏";
            break;
        case NS_THANK:
            state = @"感谢";
        case NS_NOTICE:
            state = @"关注";
            break;
    }
    cellView.nameLabel.text = celldata.userName;
    cellView.stateLabel.text = [NSString stringWithFormat:@"%@了该回答", state];
    cellView.questionLabel.text = celldata.question;
    if (celldata.numberAnswer >=1000)
    {
        cellView.answerNumLabel.text = [NSString stringWithFormat:@"%.1lfk", (CGFloat)celldata.numberAnswer/1000];
    }
    else
    {
        cellView.answerNumLabel.text = [NSString stringWithFormat:@"%ld", celldata.numberAnswer];
    }
    cellView.topLevelLabel.text = celldata.topAnswer;
    cellView.photoView.image = [UIImage imageNamed:celldata.userPhoto];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messDataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThanksData* tksData = [_messDataArr objectAtIndex:indexPath.row];
    CGFloat height = [self calcuteAttrSize:tksData];
    
    //控件之间的间隔
    tksData.cellHeight = height + 20;
    return  tksData.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}

//计算各个属性的size
- (CGFloat)calcuteAttrSize:(ThanksData *)thanksData
{
    CGFloat height = 0;
    
    CGSize nameMaxSize = CGSizeMake(170, 25);
    thanksData.userNameSize = [PubTool stringSize:thanksData.userName maxSize:nameMaxSize font:NAMEFONT];
    thanksData.userNameSize = CGSizeMake(thanksData.userNameSize.width+4, thanksData.userNameSize.height+4);
    
    CGSize questionMaxSize = CGSizeMake(SWIDTH-30, 50);
    thanksData.questionSize = [PubTool stringSize:thanksData.question maxSize:questionMaxSize font:QUESTIONFONT];
    thanksData.questionSize = CGSizeMake(thanksData.questionSize.width+4, thanksData.questionSize.height+4);
    
    CGSize topAnswerMaxSize = CGSizeMake(SWIDTH -90, 50);
    thanksData.topAnswerSize = [PubTool stringSize:thanksData.topAnswer maxSize:topAnswerMaxSize font:NAMEFONT];
    thanksData.topAnswerSize = CGSizeMake(thanksData.topAnswerSize.width+4, thanksData.topAnswerSize.height+4);
    
    height = thanksData.userNameSize.height + thanksData.questionSize.height + thanksData.topAnswerSize.height;
    
    return height;
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
