//
//  NewArticlesModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/16.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewArticlesModel : NSObject

@property (nonatomic, copy) NSString * app_id;
@property (nonatomic, readwrite, strong) NSString * created_at;
@property (nonatomic, readwrite, copy) NSString * title;
@property (nonatomic, readwrite, copy) NSString * cover;
@property (nonatomic, readwrite, copy) NSString * page_url;


@end

NS_ASSUME_NONNULL_END
