//
//  HomePlistModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/7.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePlistModel : NSObject

@property (nonatomic, readwrite, strong) NSArray * children;
@property (nonatomic, readwrite, copy) NSString * sname;
@property (nonatomic, readwrite, copy) NSString * level;
@property (nonatomic, readwrite, copy) NSString * parent_id;
@property (nonatomic, readwrite, copy) NSString * name;
@property (nonatomic, readwrite, strong) NSString * logo;


@end

NS_ASSUME_NONNULL_END
