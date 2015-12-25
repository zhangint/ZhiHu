//
//  SearchLeftView.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchLeftView.h"
#import "SearchCell.h"
#import "PubDefine.h"
#import "PicCell.h"
#import "PubTool.h"

@implementation SearchLeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewInit:(NSMutableArray<Question*> *)questionData;
{
    _questionData = questionData;
    //是在这个地方设置分组样式
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    _tableView = tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId;
    //展示数据的cell
    id cellView;
    if (indexPath.section != 0)
    {
        cellId = @"searchFirstCell";
        SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell)
        {
            cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId indexPath:indexPath];
        }
        
        Question *question = [_questionData objectAtIndex:indexPath.section-1];
        [cell setContentViewWidth:16];
        [cell setQuestionData:question];
        [cell setNeedsLayout];
        [self setCellData:cell question:question];
        cellView = cell;
    }
    //展示图片的cell
    else
    {
        cellId = @"pngCell";
        PicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (!cell)
        {
            cell = [[PicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
            NSArray *picArr = @[@"picShow1.png", @"picShow2.png", @"picShow3.png", @"picShow4.png"];
            
        
            NSMutableArray *imgArr = [[NSMutableArray alloc] init];
            for (int i=0; i<picArr.count; i++)
            {
                UIImage *img = [UIImage imageNamed:picArr[i]];
                if (img)
                {
                    [imgArr addObject:img];
                }
            } 
            [cell.imageView stopAnimating];
            cell.imgView.animationImages = imgArr;
            cell.imgView.animationDuration = 10;
            cell.imgView.animationRepeatCount = -1;
            [cell.imgView startAnimating];
        }
        
        cellView = cell;
    }
    
    
    return cellView;
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
    return _questionData.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一个区域为图片的固定高度
    if (indexPath.section == 0)
    {
        return 130;
    }
    
    CGSize questionMaxSize = CGSizeMake(SWIDTH-50, 50); //18*2
    Question *question = [_questionData objectAtIndex:indexPath.section-1];
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

@end
