//
//  ChildrenModel.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubChildrenModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChildrenModel : NSObject

@property (nonatomic, copy) NSString * Child_id;

@property (nonatomic, copy) NSArray<SubChildrenModel*> * children;

@property (nonatomic, copy) NSString * sname;

@property (nonatomic, copy) NSString * level;

@property (nonatomic, copy) NSString * parent_id;

@property (nonatomic, copy) NSString * name;

@end

NS_ASSUME_NONNULL_END
