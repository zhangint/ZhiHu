//
//  SearchViewModel.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "SearchViewModel.h"

@implementation AnswerDetail


@end

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _answerArr = [[NSMutableArray alloc] init];
    }
    return self;
}
@end

@implementation Collection

@end

@implementation SearchViewModel

- (NSMutableArray<Question*> *)recommandArr
{
    if (!_recommandArr)
    {
        Question *obj1 = [[Question alloc] init];
        obj1.questionName = @"歧视一定会导致不公平吗?";
        
        AnswerDetail *ans1 = [[AnswerDetail alloc] init];
        ans1.userName = @"马大哈";
        ans1.userPhoto = @"recommand_user_1";
        ans1.glorifyNum = 25;
        ans1.answerDetail = @"三清山，虽不及武夷的雄浑壮丽，但它神奇、峻拔、精美。";
        AnswerDetail *ans2 = [[AnswerDetail alloc] init];
        ans2.userName = @"啄木鸟";
        ans2.userPhoto = @"recommand_user_2";
        ans2.glorifyNum = 45;
        ans2.answerDetail = @"说它神奇，不仅因其得名于道教，为道教名山，有着千古流传的许多美丽神话，也因为它曾经三次遭海水淹没浸泡，经历过沧海桑田的神奇变化，远古时候的鱼虾戏水之域，变成了现今游人如织的“西海岸”和“阳光海岸”景区，还因为它的许多奇峰怪石似人、似猴、似蟒蛇……，不仅形似，而且神似，你看那司春女神，丰满俏丽，秀发齐肩，端坐山顶已经上亿年了，至今还在凝眸神思。说它峻拔，是因为三清山石柱凌空、奇峰参天，形状各异，一条悬空栈道沿着峭壁萦绕山间。无论你近观还是远眺这些峻拔的山峰，仰观则壁立千仞，俯察则深渊万丈，对于胆子不大的人来说";
        AnswerDetail *ans3 = [[AnswerDetail alloc] init];
        ans3.userName = @"虔诚今生";
        ans3.userPhoto = @"recommand_user_3";
        ans3.glorifyNum = 50;
        ans3.answerDetail = @"漫步栈道游览其间，会觉得惊悚恐怖。栈道急弯最窄处，只能容一个人通行，不少人侧身面崖扶壁小心而过，见此情形，走在后面的一个中年男子用南昌话大声惊叹“哎呀，真是嚇死吧人”，引来大家一阵哄笑。";
        [obj1.answerArr addObjectsFromArray:@[ans1, ans2, ans3]];
        
        
        Question *obj2 = [[Question alloc] init];
        obj2.questionName = @"树上村树在写作风格上是否显有一些细节显得他更像一个美国作家而非日本作家？若有，是哪些细节？";
        
        AnswerDetail *ans2_1 = [[AnswerDetail alloc] init];
        ans2_1.userName = @"张佳玮";
        ans2_1.userPhoto = @"recommand_user_4";
        ans2_1.glorifyNum = 10;
        ans2_1.answerDetail = @"是因为有奇峰怪石、峡谷溶洞，还有古代建筑、石雕石刻、劲松古树和名贵花木的点缀，加之飞瀑流泉、云海雾涛和花开花落的动态变化，不同的季节和气象都会幻化出不同的美景来。导游介绍，三清山纵横229平方公里，东险西奇，北秀南绝。在核心景区有奇峰48座，造型石89处，目前已开发的景物、景观有500多处。";
        AnswerDetail *ans2_2 = [[AnswerDetail alloc] init];
        ans2_2.userName = @"虎跳峡";
        ans2_2.userPhoto = @"recommand_user_5";
        ans2_2.glorifyNum = 3;
        ans2_2.answerDetail = @"我这是第二次游三清山，第一次是在十八年前，那时候景点开发不多，只看了南面的蟒蛇出山、女神峰几个地方。这次我们夫妻俩和小姨子一家乘着假期一起出游，五个人绕着三清山东西南北地转了一圈，更加深了三清山的印象：神奇、峻拔、秀美";
        [obj2.answerArr addObjectsFromArray:@[ans2_1, ans2_2]];
        
        _recommandArr = [[NSMutableArray alloc] initWithObjects:obj1, obj2, nil];
    }
    return _recommandArr;
}

- (NSMutableArray<Question*> *)hotThemeArr
{
    if (!_hotThemeArr)
    {
        Question *obj1 = [[Question alloc] init];
        obj1.questionName = @"马上毕业了，不知是就业呢？还是创业？就怕去工厂久了视野变窄了？";
        
        AnswerDetail *ans1 = [[AnswerDetail alloc] init];
        ans1.userName = @"陈大锤";
        ans1.userPhoto = @"recommand_user_4";
        ans1.glorifyNum = 25;
        ans1.answerDetail = @"游名山，犹如读一部经典名著，读一遍是不够的，每读一遍都会有新的体会和收获。这次再游三清山，我印象最深的当属那条挑空建在悬崖峭壁上的水泥栈道。这条栈道由2002年建成的“西海岸”和2005年建成的“阳光海岸”两部分组成，平均海拔高度在1600米上下，全长近10公里，弯弯曲曲、时宽时窄依山而建、贴壁而伸的悬空栈道，远远看去就像一条飘逸、灵动的美丽玉带舞动在大山深处。据说这是目前为止，全中国乃至全世界海拔最高的一条旅游高空栈道。导游介绍说，由于近万工人和工程技术人员的共同努力，长达4公里的西海岸栈道，仅用五个月就建成了。修这条栈道，除了得人拉肩扛把水泥、钢筋等建材运上山，工人们还得用悬索吊着身子像荡秋千似的在绝壁上凿洞、穿筋、搭建脚手架，然后逐段灌注水泥。当地导游不无骄傲地告诉我们，这么艰巨、险峻的工程，却没有伤亡一个人，也没有损毁过一棵应该保护的古树名木。难怪栈道上有不少洞，从峭壁和栈道下的山崖上长出来的劲松自在地“穿”洞而过，在栈道上迎风摇曳，原来这些";
        AnswerDetail *ans2 = [[AnswerDetail alloc] init];
        ans2.userName = @"陈二锤";
        ans2.userPhoto = @"recommand_user_5";
        ans2.glorifyNum = 45;
        ans2.answerDetail = @"我这是第二次游三清山，第一次是在十八年前，那时候景点开发不多，只看了南面的蟒蛇出山、女神峰几个地方。这次我们夫妻俩和小姨子一家乘着假期一起出游，五个人绕着三清山东西南北地转了一圈，更加深了三清山的印象：神奇、峻拔、秀美。";
        AnswerDetail *ans3 = [[AnswerDetail alloc] init];
        ans3.userName = @"似水流年";
        ans3.userPhoto = @"recommand_user_6";
        ans3.glorifyNum = 50;
        ans3.answerDetail = @"和花开花落的动态变化，不同的季节和气象都会幻化出不同的美景来。导游介绍，三清山纵横229平方公里，东险西奇，北秀南绝。在核心景区有奇峰48座，造型石89处，目前已开发的景物、景观有500多处。美国国家";
        [obj1.answerArr addObjectsFromArray:@[ans1, ans2, ans3]];
        
        
        Question *obj2 = [[Question alloc] init];
        obj2.questionName = @"成年以后，父亲充当了生命里的什么角色？";
        
        AnswerDetail *ans2_1 = [[AnswerDetail alloc] init];
        ans2_1.userName = @"卑鄙的我";
        ans2_1.userPhoto = @"recommand_user_7";
        ans2_1.glorifyNum = 10;
        ans2_1.answerDetail = @"在谈信仰之前，我们还要了解一下人的“需要”理论，也就是我们常讲的~马斯洛需求层次理论，既人的需求有五个层次:第一层次~生理上的需要；第二层次~安全上的需要；第三层次~情感和归属的需要；第四层次~尊重的需要；第五层次~自我实现的需要。那么，问题来了，“信仰”是情感和归属的需要，属于第三层次。";
        AnswerDetail *ans2_2 = [[AnswerDetail alloc] init];
        ans2_2.userName = @"呵呵呵";
        ans2_2.userPhoto = @"recommand_user_6";
        ans2_2.glorifyNum = 3;
        ans2_2.answerDetail = @"我这是第二次游三清山，第一次是在十八年前，那时候景点开发不多，只看了南面的蟒蛇出山、女神峰几个地方。这次我们夫妻俩和小姨子一家乘着假期一起出游，五个人绕着三清山东西南北地转了一圈，更加深了三清山的印象：神奇、峻拔、秀美。";
        [obj2.answerArr addObjectsFromArray:@[ans2_1, ans2_2]];
        
        _hotThemeArr = [[NSMutableArray alloc] initWithObjects:obj1, obj2, nil];

    }
    return _hotThemeArr;
}

- (NSMutableArray<Collection*> *)collectionArr
{
    if (!_collectionArr)
    {
        Collection *obj1 = [[Collection alloc] init];
        obj1.title = @"学海无涯回头是岸";
        obj1.author = @"Airel";
        obj1.authorPhoto = @"col_user_1";
        obj1.wathchNum = 20;
        
        Collection *obj2 = [[Collection  alloc] init];
        obj2.title = @"技术活不是谁都能干";
        obj2.author = @"吕小布007";
        obj2.authorPhoto = @"col_user_2";
        obj2.wathchNum = 30;
        
        Collection *obj3 = [[Collection alloc] init];
        obj3.title = @"美容与健康";
        obj3.secondTitle = @"关注你我他";
        obj3.author = @"天天健康";
        obj3.authorPhoto = @"col_user_3";
        obj3.wathchNum = 300;
        
        Collection *obj4 = [[Collection alloc] init];
        obj4.title = @"好玩儿好笑的答案";
        obj4.secondTitle = @"不止童真时代才有";
        obj4.author = @"与时具进";
        obj4.wathchNum = 3000;
        obj4.authorPhoto = @"col_user_4";
        
        Collection *obj5 = [[Collection alloc] init];
        obj5.title = @"变得优秀";
        obj5.secondTitle = @"优秀是一种信仰";
        obj5.author = @"无尽";
        obj5.authorPhoto = @"col_user_5";
        obj5.wathchNum = 56;
        
        Collection *obj6 = [[Collection alloc] init];
        obj6.title = @"骑马爱好";
        obj6.secondTitle = @"因为喜欢，所以喜欢";
        obj6.author = @"死有所获";
        obj6.authorPhoto = @"col_user_6";
        obj6.wathchNum = 456;
        
        _collectionArr = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, obj4, obj5, obj6, nil];
    }
    return _collectionArr;
}














@end
