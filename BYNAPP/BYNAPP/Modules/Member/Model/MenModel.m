//
//  MenModel.m
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "MenModel.h"

@implementation MenModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"children":[ChildrenModel class]};
    
}

@end




