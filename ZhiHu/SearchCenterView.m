//
//  SearchCenterView.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchCenterView.h"
#import "SearchCell.h"
#import "SearchViewModel.h"
#import "PubDefine.h"
#import "PubTool.h"

@interface SearchCenterView() <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;


@end

@implementation SearchCenterView


- (void)viewInit:(NSMutableArray<Question*> *)hotThemeData
{
    _hotThemeData = hotThemeData;
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tableView.backgroundColor = [UIColor ]
    
    [self addSubview:tableView];
    _tableView = tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"searchNormalCell";
    
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId indexPath:indexPath];
    }
    Question *question = [_hotThemeData objectAtIndex:indexPath.section];
    [cell setContentViewWidth:16];
    [cell setQuestionData:question];
    [cell setNeedsLayout];
    [self setCellData:cell question:question];
    
    return cell;
}

- (void)setCellData:(SearchCell *)cell question:(Question *)question
{
    cell.titleLabel.text = question.questionName;
    
    AnswerDetail *ansDetail = [question.answerArr objectAtIndex:0];
    cell.answerLabel.text = ansDetail.answerDetail;
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", ansDetail.glorifyNum];
    cell.photoImage.image = [UIImage imageNamed:ansDetail.userPhoto];
    cell.detailImage.image = [UIImage imageNamed:@"hostClicked"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _hotThemeData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize questionMaxSize = CGSizeMake(SWIDTH-50, 50); //18*2
    Question *question = [_hotThemeData objectAtIndex:indexPath.section];
    CGSize queSize = [PubTool stringSize:question.questionName maxSize:questionMaxSize font:QUESTIONFONT];
    question.questionSize = CGSizeMake(queSize.width+2, queSize.height+2);
    
    CGSize firstAnsMaxSize = CGSizeMake(SWIDTH-75, 80);
    AnswerDetail *detail = question.answerArr[0];
    CGSize detailSize = [PubTool stringSize:detail.answerDetail maxSize:firstAnsMaxSize font:NAMEFONT];
    question.firstAnsSize = CGSizeMake(detailSize.width+2, detailSize.height+2);
    NSInteger height = question.questionSize.height + question.firstAnsSize.height + 25;
    
    if (height < 100)
    {
        height = 100;
    }
    question.height = height;
    return question.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
