//
//  infoView.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "InfoView.h"
#import "PubDefine.h"
#import "LeftPage.h"
#import "CenterPage.h"
#import "RightPage.h"
#import "InfoViewModel.h"

@interface InfoView () <UIScrollViewDelegate>

//标题上的View
@property (weak, nonatomic) UIView *titleView;

//通知的Btn
@property (weak, nonatomic) UIButton *noticeBtn;

//赞与感谢的Btn
@property (weak, nonatomic) UIButton *glorifyBtn;

//私信的Btn
@property (weak, nonatomic) UIButton *letterBtn;

//滚动条
@property (weak, nonatomic) UIScrollView *scrollView;

//滚动条下的三个页面
@property (strong, nonatomic) LeftPage *leftPage;

@property (strong, nonatomic) CenterPage *centerPage;

@property (strong, nonatomic) RightPage *rightPage;



//数据栏实例
@property (strong, nonatomic)InfoViewModel *dataModel;

@end

//获取状态栏和navibar的高度，作为控件开始的位置

static const int titleHeight = 30;
@implementation InfoView

typedef NS_ENUM(NSInteger, TitleBtnTag)
{
    NS_TITLE_LEFT = 1001,
    NS_TITLE_CENTER,
    NS_TITLE_RIGHT
};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataModel = [[InfoViewModel alloc] init];
    
    [self titleView];
    [self scrollView];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        int heightPos = STARTHEIGHT + titleHeight;
        int scrollHeight = SHEIGHT - TABHEIGHT - heightPos;
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, heightPos, SWIDTH, scrollHeight)];
        scrollView.contentSize = CGSizeMake(SWIDTH*3, scrollHeight);
        scrollView.showsHorizontalScrollIndicator = YES;
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
        scrollView.indicatorStyle = UIScrollViewKeyboardDismissModeInteractive;
        
        
        LeftPage *leftPage = [[LeftPage alloc] init];
        leftPage.frame = CGRectMake(0, 0, SWIDTH, scrollHeight);
        [leftPage setDataModel:_dataModel];
        [leftPage viewInit];
        
        CenterPage *centerPage = [[CenterPage alloc] init];
        centerPage.frame = CGRectMake(SWIDTH, 0, SWIDTH, scrollHeight);
        [centerPage setDataModel:_dataModel];
        [centerPage viewInit];
        
        RightPage *rightPage = [[RightPage alloc] init];
        rightPage.frame = CGRectMake(SWIDTH*2, 0, SWIDTH, scrollHeight);
        [rightPage setPageData:_dataModel.letterData];
        [rightPage viewInit];
        
        [scrollView addSubview:leftPage];
        [scrollView addSubview:centerPage];
        [scrollView addSubview:rightPage];
        _leftPage = leftPage;
        _centerPage = centerPage;
        _rightPage = rightPage;
        [self.view addSubview: scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}



- (UIView *)titleView
{
    if (!_titleView)
    {
        NSInteger btnWidth = SWIDTH / 3;
        //获取状态栏的高度
        //=  self.navigationController.view.frame.size.height;
        UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, STARTHEIGHT, SWIDTH, titleHeight)];
        
        UIButton *noticeBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth*0, 0, btnWidth, titleHeight)];
        [self setTitleBtnPro:noticeBtn title:@"通知" btnTag:NS_TITLE_LEFT];
        [titleView addSubview:noticeBtn];
        _noticeBtn = noticeBtn;
        
        UIButton *glorifyBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth*1, 0, btnWidth, titleHeight)];
        [self setTitleBtnPro:glorifyBtn title:@"赞与感谢" btnTag:NS_TITLE_CENTER];
        [titleView addSubview:glorifyBtn];
        _glorifyBtn = glorifyBtn;
        
        UIButton *letterBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth*2, 0, btnWidth, titleHeight)];
        [self setTitleBtnPro:letterBtn title:@"私信" btnTag:NS_TITLE_RIGHT];
        [titleView addSubview:letterBtn];
        _letterBtn = letterBtn;
        
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleHeight-1, SWIDTH, 1)];
        lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [titleView addSubview:lineLabel];
        
        [self.view addSubview:titleView];
        _titleView = titleView;
    }
    return _titleView;
}

//设置标题栏上3个按钮的属性
- (void) setTitleBtnPro:(UIButton *) proBtn title:(NSString *)title btnTag:(TitleBtnTag)tag
{
    proBtn.tag = tag;
    [proBtn setTitle:title forState:UIControlStateNormal];
    [proBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [proBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [proBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

//点击事件的处理
- (void) titleBtnClick:(UIButton *)sender
{
    switch (sender.tag)
    {
        case NS_TITLE_LEFT:
            NSLog(@"left clicked");
            break;
        case NS_TITLE_CENTER:
            NSLog(@"center clicked");
            break;
        case NS_TITLE_RIGHT:
            NSLog(@"right clicked");
            break;
    }
}

#pragma mask 滚动条 委托函数 
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == SWIDTH)
    {
        [_leftPage setNeedsDisplay];
        [_leftPage setNeedsUpdateConstraints];
        
    }
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
