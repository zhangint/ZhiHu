//
//  CenterPage.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "CenterPage.h"
#import "InfoViewModel.h"
#import "PubDefine.h"
#import "PubTool.h"
#import "QuestionCell.h"

@interface CenterPage () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) NSMutableArray  *thanksDataArr;

@end

@implementation CenterPage


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewInit
{
    //注意这个地方是 用self.bounds 不是self.frame
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.separatorStyle = UITableViewScrollPositionNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    _tableView = tableView;
}

- (void) setDataModel:(InfoViewModel *)infoModel
{
    _thanksDataArr = infoModel.thanksData;
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
    [cell setThankData:[_thanksDataArr objectAtIndex:indexPath.row]];
    [cell setNeedsLayout];
    [self setCellData:[_thanksDataArr objectAtIndex:indexPath.row] cellView:cell];
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
            break;
    }
    cellView.nameLabel.text = celldata.userName;
    cellView.stateLabel.text = [NSString stringWithFormat:@"%@你的回答", state];
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
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _thanksDataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThanksData* tksData = [_thanksDataArr objectAtIndex:indexPath.row];
    CGFloat height = [self calcuteAttrSize:tksData];
    
    //控件之间的间隔
    tksData.cellHeight = height + 20;
    return  tksData.cellHeight;
}

//计算各个属性的size
- (CGFloat) calcuteAttrSize:(ThanksData *)thanksData
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

/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
