//
//  ChildrenModel.m
//  BYNAPP
//
//  Created by zhulp on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import "ChildrenModel.h"

@implementation ChildrenModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"Child_id":@"id"};
    
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"children":[SubChildrenModel class]};
    
}

@end
