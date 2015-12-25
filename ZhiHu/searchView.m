//
//  searchView.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchView.h"
#import "PubDefine.h"
#import "PubTool.h"
#import "SearchViewModel.h"
#import "TitleView.h"
#import "SearchLeftView.h"
#import "SearchCenterView.h"
#import "SearchRightView.h"

@interface SearchView () <TitleDelegate>

//该模块的数据封装
@property (strong, nonatomic) SearchViewModel *searchData;

//滚动条
@property (strong, nonatomic) UIScrollView *scrollView;

@property (weak,nonatomic) UIView *titleView;

//推荐页面
@property (weak, nonatomic) SearchLeftView *leftPage;

//热门页面
@property (weak, nonatomic) SearchCenterView *centerpage;

//收藏页面
@property (weak, nonatomic) SearchRightView *rightPage;

@end

@implementation SearchView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //数据模块初始化
    _searchData = [[SearchViewModel alloc] init];

    //标题栏初始化
    CGRect titleRect = CGRectMake(0, STARTHEIGHT, SWIDTH, 30);
    TitleView *titleView = [[TitleView alloc] init:@[@"推荐", @"热门", @"收藏"] Font:[UIFont systemFontOfSize:16] withRect:titleRect];
    titleView.delegate = self;
    [self.view addSubview:titleView];
    _titleView = titleView;
    
    //滚动条初始化
    [self scrollView];
    
}

- (void)titleClicked:(NSInteger)index
{
    NSLog(@"clicked index:%ld",  index);
    //翻页需要记录当前的页码，暂不实现
    //[_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x+index*SWIDTH, 0)];
}


- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        NSInteger viewHeight = SHEIGHT - STARTHEIGHT - TABHEIGHT - 30;
        CGRect viewRect = CGRectMake(0, STARTHEIGHT+30, SWIDTH, viewHeight);
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:viewRect];
        scrollView.contentSize = CGSizeMake(SWIDTH*3, viewHeight);
        scrollView.showsHorizontalScrollIndicator = YES;
        scrollView.pagingEnabled = YES;         
        scrollView.shouldGroupAccessibilityChildren = YES;
        
        SearchLeftView *leftPage = [[SearchLeftView alloc] initWithFrame:CGRectMake(0, 0, SWIDTH, viewHeight)];
        [leftPage viewInit:_searchData.recommandArr];
        leftPage.backgroundColor = [UIColor grayColor];
        
        SearchCenterView *centerPage = [[SearchCenterView alloc] initWithFrame:CGRectMake(SWIDTH, 0, SWIDTH, viewHeight)];
        [centerPage viewInit:_searchData.hotThemeArr];
        centerPage.backgroundColor = [UIColor grayColor];
        
        SearchRightView *rightPage = [[SearchRightView alloc]  initWithFrame:CGRectMake(SWIDTH*2, 0, SWIDTH, viewHeight)];
        [rightPage viewInit:_searchData.collectionArr];  
        
        [scrollView addSubview:leftPage];
        [scrollView addSubview:centerPage];
        [scrollView addSubview:rightPage];
        _leftPage = leftPage;
        _centerpage = centerPage;
        _rightPage = rightPage;
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
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
