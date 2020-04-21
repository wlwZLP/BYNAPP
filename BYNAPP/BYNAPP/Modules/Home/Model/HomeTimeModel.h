//
//  HomeTimeModel.h
//  BYNAPP
//
//  Created by zhulp on 2020/4/14.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTimeModel : NSObject

@property (nonatomic, readwrite, strong) NSString * desc;
@property (nonatomic, readwrite, strong) NSString * status;
@property (nonatomic, readwrite, strong) NSArray * data;
@property (nonatomic, readwrite, strong) NSString * is_active;
@property (nonatomic, readwrite, strong) NSString * show_time;
@property (nonatomic, readwrite, strong) NSString * time;

@end

NS_ASSUME_NONNULL_END
