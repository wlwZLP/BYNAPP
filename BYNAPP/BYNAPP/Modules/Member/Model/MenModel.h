//
//  MenModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenModel : NSObject

@property (nonatomic, copy) NSString * Men_id;

@property (nonatomic, copy) NSArray * children;

@property (nonatomic, copy) NSString * sname;

@property (nonatomic, copy) NSString * level;

@property (nonatomic, copy) NSString * parent_id;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * logo;


@end

@interface ChildrenModel : NSObject

@property (nonatomic, copy) NSString * Child_id;

@property (nonatomic, copy) NSString * sname;

@property (nonatomic, copy) NSString * level;

@property (nonatomic, copy) NSString * parent_id;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * logo;

@end



NS_ASSUME_NONNULL_END
