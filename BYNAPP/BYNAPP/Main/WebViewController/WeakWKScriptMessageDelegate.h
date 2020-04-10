//
//  WeakWKScriptMessageDelegate.h
//  Coupon
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WKScriptMessageHandler.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakWKScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, assign) id<WKScriptMessageHandler> scriptDelegate;

-(instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;


@end



NS_ASSUME_NONNULL_END
