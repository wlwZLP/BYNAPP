//
//  UILabel+YY.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/11.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "UILabel+YY.h"

@implementation UILabel (YY)

-(void)addTarget:(id _Nullable )target action:(nonnull SEL)action{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:target action:action];
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:tap];
    
}


@end
