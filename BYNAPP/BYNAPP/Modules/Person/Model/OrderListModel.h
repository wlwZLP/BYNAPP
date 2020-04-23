//
//  OrderListModel.h
//  BYNAPP
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderListModel : NSObject

@property (nonatomic, readwrite, copy) NSString * order_no;
@property (nonatomic, readwrite, strong) NSString * category;
@property (nonatomic, readwrite, strong) NSString * pre_amount;
@property (nonatomic, readwrite, strong) NSString * status;
@property (nonatomic, readwrite, copy) NSString * item_image;
@property (nonatomic, readwrite, strong) NSString * pay_amount;
@property (nonatomic, readwrite, strong) NSString * status_txt;
@property (nonatomic, readwrite, strong) NSString * earning_time;
@property (nonatomic, readwrite, strong) NSString * item_title;
@property (nonatomic, readwrite, strong) NSString * create_time;

@end

NS_ASSUME_NONNULL_END
