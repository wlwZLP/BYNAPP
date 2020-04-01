//
//  YYLiveCollectionViewController.m
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "YYLiveCollectionViewController.h"

@interface YYLiveCollectionViewController ()



@end

@implementation YYLiveCollectionViewController



- (void)viewDidLoad {
    

     [super viewDidLoad];
    
   

    
}




- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    NSString *text = @"重新加载";
    UIFont   *font = [UIFont systemFontOfSize:15.0];
    // 设置默认状态、点击高亮状态下的按钮字体颜色
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:font      forKey:NSFontAttributeName];
    [attributes setObject:YY66Color forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
}



- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {

    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                  //发送信号
//        [self.btnClickSingle sendNext:@"按钮点击咯"];//这句代码时demo3的

    }];
    
}

//-(RACSubject *)btnClickSingle{
//    if (!_btnClickSingle) {
//        _btnClickSingle = [RACSubject subject];
//    }
//    return _btnClickSingle;
//}




@end
