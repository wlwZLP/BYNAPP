//
//  UIImageView+YY.m
//  BYNAPP
//
//  Created by apple on 2020/4/9.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "UIImageView+YY.h"



@implementation UIImageView (YY)


-(void)addTarget:(id _Nullable )target action:(nonnull SEL)action{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:target action:action];
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:tap];
    
}



@end
