//
//  MenModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChildrenModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MenModel : NSObject

@property (nonatomic, copy) NSString * Men_id;

@property (nonatomic, copy) NSArray <ChildrenModel*> * children;

@property (nonatomic, copy) NSString * sname;

@property (nonatomic, copy) NSString * level;

@property (nonatomic, copy) NSString * parent_id;

@property (nonatomic, copy) NSString * name;

@end





NS_ASSUME_NONNULL_END
