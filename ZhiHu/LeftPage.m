//
//  LeftPage.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//


#import "LeftPage.h"
#import "PubDefine.h"
#import "InfoViewModel.h"
#import "NoticeCell.h"
#import "PubTool.h"

@interface LeftPage ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableData;

 
//显示的数据模块
@property (weak, nonatomic) NSMutableArray *noteDataArr;


@end

@implementation LeftPage

  
- (instancetype) init
{
    self = [super init];
    if (self)
    {
       
        //_tableData = tableData;
    }
    return self;
}

- (void)viewInit
{
    _tableData = [[UITableView alloc] initWithFrame:self.bounds];
    _tableData.delegate =self;
    _tableData.dataSource = self;
    _tableData.tableFooterView = [[UIView alloc] init];
    _tableData.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:_tableData];
}



- (void) setDataModel:(InfoViewModel *)infoModel
{
    _noteDataArr = infoModel.noticeData;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *noticeId = @"noticeCell";
    NoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:noticeId];
    if (cell == nil)
    {
        cell = [[NoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noticeId];
    }
    
    NoticeData *noticeData = [_noteDataArr objectAtIndex:indexPath.row];
    [cell setNoticeData:noticeData];
    [cell setNeedsLayout];
    [self cellContent:cell data:noticeData];
    
    return  cell;
}

- (void)cellContent:(NoticeCell *)cell data:(NoticeData *)cellData
{
    NSInteger answerNum = cellData.answerNames.count;
    NSString *stateStr = @"回答了该问题:";
    if (answerNum > 1)
    {
        stateStr = [NSString stringWithFormat:@"...%@%ld%@回答了该问题:", @"等", answerNum, @"人"];
    }
    cell.nameLabel.text = [cellData.answerNames objectAtIndex:0];
    cell.stateLabel.text = stateStr;
    cell.questionLabel.text = cellData.questionName;
}

//计算cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self noticeHeight:indexPath];
}

- (NSInteger)noticeHeight:(NSIndexPath *)indexPath
{
    NoticeData *objData = [_noteDataArr objectAtIndex:indexPath.row];
    CGSize nameMaxSize = CGSizeMake(100, 16);
    objData.firstNameSize = [PubTool stringSize:objData.answerNames[0] maxSize:nameMaxSize font:NAMEFONT];
    
    CGSize questionMaxSize = CGSizeMake(SWIDTH-40, 80);
    objData.questionNameSize = [PubTool stringSize:objData.questionName maxSize:questionMaxSize font:QUESTIONFONT];
    
    objData.rowHeight = objData.firstNameSize.height + objData.questionNameSize.height + 25;
 
    return objData.rowHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_noteDataArr count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
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
