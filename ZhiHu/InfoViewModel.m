//
//  InfoViewModel.m
//  ZhiHu
//
//  Created by zp on 15/12/22.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "InfoViewModel.h"

//通知栏 数据实现
@implementation NoticeData

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.answerNames = [[NSMutableArray alloc] init];
    }
    return self;
} 


@end

//赞与感谢 数据实现
@implementation ThanksData

@end


//私信 模块数据实现

//聊天记录实现
@implementation ChatRecord

@end

//聊天记录 数据封装
@implementation PersonalData

- (instancetype)init
{
    self = [super init];
    _Record = [[NSMutableArray alloc] init];
    return self;
}

@end

@implementation InfoViewModel



- (NSMutableArray *)noticeData
{
    if (!_noticeData)
    {
    
    NoticeData *obj1 = [[NoticeData alloc] init];
    [obj1.answerNames addObjectsFromArray:@[@"at hrun", @"恶喵"]];
    obj1.questionName = @"如果知乎是一所大学，校训是什么最好?";
    
    NoticeData *obj2 = [[NoticeData alloc] init];
    [obj2.answerNames addObject:@"董飞"];
    obj2.questionName = @"如何成为杰出的软件工程师?";
    
    NoticeData *obj3 = [[NoticeData alloc] init];
    [obj3.answerNames addObjectsFromArray:@[@"匿名用户", @"San Cheung"]];
    obj3.questionName = @"习惯性放低姿态 ，甚至被人看低也无所谓的是什么心态? 这样对他们真的好吗?";
    
    NoticeData *obj4 = [[NoticeData alloc] init];
    [obj4.answerNames addObject:@"Alsey"];
    obj4.questionName = @"如何轻松阅读 GitHub 上的项目源代码?";
    
    NoticeData *obj5 = [[NoticeData alloc] init];
    [obj5.answerNames addObject:@"magasa"];
    obj5.questionName = @"如何评价iPhone 6 Plus?";
    
    NoticeData *obj6 = [[NoticeData alloc] init];
    [obj6.answerNames addObjectsFromArray:@[@"文艺老大爷", @"柴广军"]];
    obj6.questionName = @"为什么王思聪要发不支持魅族的微博?";
    
    _noticeData = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, obj4, obj5, obj6, nil];
    }
    return _noticeData;
}

- (NSMutableArray *)thanksData
{
    if (!_thanksData)
    {
        ThanksData *obj1 = [[ThanksData alloc] init];
        obj1.userName = @"王伟";
        obj1.answerState = NS_GLORIFY;
        obj1.question = @"入职后发现项目组代码异常混乱，是去还是留?";
        obj1.numberAnswer = 76;
        obj1.topAnswer = @"我是个测试，我刚到我现在这个组的时候，组里面的自动化测试代码也是一塌糊涂。连最基本的封装都没有。一旦有个feature变动，基本自动化case就是一片一片的挂。然后我实在忍不住被无穷无尽的fix自动化代码拖住，就把整个框架全部重写了一遍。\
        \
            重写的过程中整个人的技术和成就感完全爆表。而且更重要的是，以后我面对所有组的自动化测试的问题我比其他任何人更清楚的知道问题在哪里，应该怎么改。因为，所有的代码都是我写的。。。";
      
        ThanksData *obj2 = [[ThanksData alloc] init];
        obj2.userName = @"mu mu";
        obj2.answerState = NS_GREEN;
        obj2.question = @"在外国，有没有像耐克，奔驰，麦当劳一样被外国人熟知又喜欢的中国品牌？（最好是欧美发达国家）？";
        obj2.numberAnswer = 15;
        obj2.topAnswer = @"人生是一个过程，结果对于每一个人都是一样的，因为有死亡的背景，所以生命才应该得到认真的尊重。";
        
        ThanksData *obj3 = [[ThanksData alloc] init];
        obj3.userName = @"吴铭";
        obj3.answerState = NS_THANK;
        obj3.question = @"为什么机器人研究了几十年，还是给人感觉没有太大进展？";
        obj3.numberAnswer = 50000;
        obj3.topAnswer = @"因为有爱，所以有家；因为有孩子，所以家才有实质的形式和内容。回了家，实际上，我们每一个人，都是妞妞。每一个妞妞来到世上，都是爱的奇迹，爱是我们来到这个世界的唯一理由。所以每一个人忙忙碌碌为了谁，才会有一个相同的答案。";
        _thanksData = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, nil];
    }
    
    return _thanksData;
}

//构造模拟数据
- (NSMutableArray<PersonalData*>*)letterData
{
    if (!_letterData)
    {
        PersonalData *obj1 = [[PersonalData alloc] init];
        obj1.userName = @"狼大人";
        obj1.imageName = @"info_user1";
        
        ChatRecord *chat1 = [[ChatRecord alloc] init];
        chat1.content = @"在开始IAP开发前，先要对IAP有个大概的了解，下面这片文章就是给你预备的";
        chat1.direction = NS_ME;
        ChatRecord *chat2 = [[ChatRecord alloc] init];
        chat2.content = @"崔健的歌唱道：\"不是我不明白，这世界变化快。\"一位画家朋友对我说：\"如今不是凡·高的时代了，生前出不了名的，死后也出不了名，世人早已把你忘记。\"";
        chat2.direction = NS_OTTHER;
        [obj1.Record addObjectsFromArray:@[chat1, chat2]];
        
        PersonalData *obj2 = [[PersonalData alloc] init];
        obj2.userName = @"龙大人";
        obj2.imageName = @"info_user2";
        
        ChatRecord *chat3 = [[ChatRecord alloc] init];
        chat3.direction = NS_OTTHER;
        chat3.content = @"在西方，\"寻求灵魂的现代人\"已是一个典型形象。人的肉体曾经与土地血肉相连，技术文明把它们隔离了开来。";
        ChatRecord *chat4 = [[ChatRecord alloc] init];
        chat4.direction = NS_ME;
        chat4.content = @"有人曾同我争论：中国的当务之急是建设现代物质文明，然后才谈得上疗治文明的弊病。我只能怯生生地问道：难道几代人的灵魂寻求是无足轻重的吗?我承认我不是理直气壮，因为我能感觉到时代的两难困境";
        ChatRecord *chat5 = [[ChatRecord alloc] init];
        chat5.direction = NS_ME;
        chat5.content = @"野蛮的符咒尚未挣脱，文明的压抑接踵而至。一方面，权贵贪欲的膨胀使得腐败丛生；另一方面，金钱力量的崛起导致精神平庸。鉴于前者，仁人志士戮力于改革、开放和振兴之举；面对后者，哲人贤士呼唤着性灵、爱心和净化之道。";
        [obj2.Record addObjectsFromArray:@[chat3, chat4, chat5]];
        
        PersonalData *obj3 = [[PersonalData alloc] init];
        obj3.userName = @"马大人";
        obj3.imageName= @"info_user3";
        ChatRecord *chat6 = [[ChatRecord alloc] init];
        chat6.direction = NS_ME;
        chat6.content = @"马大人，你好";
        ChatRecord *chat7 = [[ChatRecord alloc] init];
        chat7.direction = NS_ME;
        chat7.content = @"马大人，你在吗";
        [obj3.Record addObjectsFromArray:@[chat6, chat7]];
        
        PersonalData *obj4 = [[PersonalData alloc] init];
        obj4.userName = @"知乎";
        obj4.imageName = @"zhihu";
        
        ChatRecord *chat8 = [[ChatRecord alloc] init];
        chat8.content = @"知乎是一个真实的网络问答社区，社区氛围友好与理性，连接各行各业的精英。用户分享着彼此的专业知识、经验和见解，为中文互联网源源不断地提供高质量的信息。知乎网站2010年12月开放，三个月后获得了李开复的投资，一年后获得启明创投的近千万美元。知乎过去采用邀请制注册方式。2013年3月，知乎向公众开放注册。不到一年时间，注册用户迅速由40万攀升至400万。";
        chat8.direction = NS_OTTHER;
        [obj4.Record addObject:chat8];
        
        //将数据添加到数组中去
        _letterData = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, obj4, nil];
    }
    return _letterData;
}

@end
