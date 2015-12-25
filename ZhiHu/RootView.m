//
//  RootView.m
//  ZhiHu
//
//  Created by zp on 15/12/21.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "RootView.h"
#import "HostView.h"
#import "InfoView.h"
#import "SearchView.h"
#import "MessageView.h"

@interface RootView ()

@end

@implementation RootView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addPage
{
    MessageView *messageView = [[MessageView alloc] init];
    messageView.tabBarItem.image = [UIImage imageNamed:@"messageRelease"];
    //messageView.tabBarItem.selectedImage = [UIImage imageNamed:@"messageChose"];
    [self addNavTitle:@"消息中心" controller:messageView];
    
    SearchView *searchView = [[SearchView alloc] init];
    searchView.tabBarItem.image = [UIImage imageNamed:@"searchRelease" ];
    // searchView.tabBarItem.selectedImage = [UIImage imageNamed:@"searchChose"];
    [self addNavTitle:@"发现" controller:searchView];
    
    InfoView *infoView = [[InfoView alloc] init];
    infoView.tabBarItem.image = [UIImage imageNamed:@"infoRelease"];
    //infoView.tabBarItem.selectedImage = [UIImage imageNamed:@"infoChose"];
    [self addNavTitle:@"消息" controller:infoView];
    
    HostView *hostView = [[HostView alloc] init];
    hostView.tabBarItem.image = [UIImage imageNamed:@"hostRelease"];
    //  hostView.tabBarItem.selectedImage = [UIImage imageNamed:@"hostChose"];
    [self addNavTitle:@"个人" controller:hostView];
    
    
    //不需要这样初始化，否则会覆盖掉添加的页面
    //self.viewControllers = @[messageView, searchView,  infoView, hostView];
}

- (void) addNavTitle:(NSString *) title controller:(UIViewController *) controller
{
    controller.navigationItem.title = title;
   // controller.tabBarItem.image = [UIImage imageNamed:@"hostRelease"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
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
