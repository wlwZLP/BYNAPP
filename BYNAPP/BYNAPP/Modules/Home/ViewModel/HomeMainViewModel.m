//
//  HomeMainViewModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "HomeMainViewModel.h"

@implementation HomeMainViewModel


- (instancetype)init
    {
        if(self = [super init])
        {
            [self setUp];
        }
        return self;
    }
    
- (void)setUp{
    
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
    // 创建信号
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
            
           
    
    
            return nil;
            
      }];
        
    
        return signal;
        
    }];
}



@end
