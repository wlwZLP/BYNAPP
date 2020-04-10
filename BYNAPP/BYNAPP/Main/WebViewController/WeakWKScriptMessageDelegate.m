//
//  WeakWKScriptMessageDelegate.m
//  Coupon
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import "WeakWKScriptMessageDelegate.h"

@implementation WeakWKScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
     [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end
