//
//  MessData.m
//  ZhiHu
//
//  Created by zp on 15/12/24.
//  Copyright © 2015年 ZP. All rights reserved.
//

#import "MessData.h"

 
@implementation MessData

-(NSMutableArray<ThanksData*> *)messArr
{
    if (!_messArr)
    {    
        ThanksData* obj1 = [[ThanksData alloc] init];
        obj1.userName = @"Flyer";
        obj1.answerState = NS_NOTICE;
        obj1.question = @"80、90后老师如何处理早恋？";
        obj1.numberAnswer = 30;
        obj1.userPhoto = @"mess_user_1";
        obj1.topAnswer = @"你妈妈那里，反正只要你有成绩，不影响学习，别做太出格的事，应该没太大问题，就不知道你老妈是不是封建保守的家长嘞~\
        \
        你是北京人吗？北京初中的孩子每个星期都要有1~2次的男女生正常需要的交往呀~现在都什么社会了、喜欢就说出来，没事！";
        
        ThanksData *obj2 = [[ThanksData alloc] init];
        obj2.question = @"为什么有人能一碰枕头就睡着";
        obj2.userName = @"小Q";
        obj2.answerState = NS_COLLECT;
        obj2.numberAnswer = 500;
        obj2.userPhoto = @"mess_user_2";
        obj2.topAnswer = @"秒睡能力是强大的超能力。我大学有个室友基本是手机大声放着电影，跟我们聊着天，然后3.2.1睡着。还打呼噜，超级大声，我们几个身边都自备矿泉水瓶几个，晚上他声音太大了就丢过去一个，不过放心他一定不会醒，只不过会打断他的呼吸频率然后声音小了一段。";
        
        
        ThanksData *obj3 = [[ThanksData alloc] init];
        obj3.userName = @"金刚害虫";
        obj3.question = @"历史上有哪些打脸的故事？";
        obj3.answerState = NS_GREEN;
        obj3.numberAnswer = 5000;
        obj3.userPhoto = @"mess_user_2";
        obj3.topAnswer = @"1上课睡觉对我来说实在小意思，因为练就了坐着拿支笔睡觉的神功。当然也有后遗症，看4。2小时候家里房间少，和我姐一间睡。某天傍晚只有我在家，觉得怕怕，就反锁卧室门。结果不小心睡着了。 凌晨被尿憋醒，才看到我姐在客厅沙发躺着。听到我起来了，爸妈都过来讲他们有多努力敲门拍窗就是震不醒我";
        
        _messArr = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, nil];
    }
    return _messArr;
}

@end
