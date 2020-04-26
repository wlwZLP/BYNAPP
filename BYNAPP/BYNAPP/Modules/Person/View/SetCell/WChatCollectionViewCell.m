//
//  WChatCollectionViewCell.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/19.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "WChatCollectionViewCell.h"

@implementation WChatCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YYBGColor;
       
        [self setup];
        
    }
    
    return self;
    
}



- (void)setup{
    
    
    UIView * MainView = [[UIView alloc] init];
    MainView.backgroundColor = UIColor.whiteColor;
    MainView.frame = CGRectMake(12 , 10, YYScreenWidth - 24, 60);
    [self addSubview:MainView];
    [YYTools ChangeView:MainView  RadiusSize:10 BorderColor:[UIColor clearColor]];
    
    
    UITextField * NameTextField = [[UITextField alloc] initWithFrame:CGRectMake(22, 10 , 300, 40)];
    NameTextField.placeholderColor = YY99Color;
    NameTextField.font = [UIFont systemFontOfSize:14];
    NameTextField.borderStyle = UITextBorderStyleNone;
    NameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [MainView addSubview:NameTextField];
    self.MainTextField = NameTextField;

    
}


-(void)setTextFieldString:(NSString *)TextFieldString{
    
    
    if ([TextFieldString isEqualToString:@"1"]) {
        [self.MainTextField setXmg_Placeholder:@"请输入对应的用户名"];
    }else if ([TextFieldString isEqualToString:@"2"]){
        [self.MainTextField setXmg_Placeholder:@"请输入对应的手机号"];
    }else{
        [self.MainTextField setXmg_Placeholder:@"请输入对应的微信号"];
    }
    
    
    
    
}


@end
