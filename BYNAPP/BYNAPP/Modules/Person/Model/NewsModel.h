//
//  NewsModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject

@property (nonatomic, copy) NSString * app_id;
@property (nonatomic, readwrite, strong) NSString * news_id;
@property (nonatomic, readwrite, copy) NSString * created_at;
@property (nonatomic, readwrite, copy) NSString * parent_id;
@property (nonatomic, readwrite, copy) NSString * updated_at;
@property (nonatomic, readwrite, copy) NSString * name;

@end

NS_ASSUME_NONNULL_END
