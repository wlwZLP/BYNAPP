//
//  UISearchBar+Text.m
//  SDKText
//
//  Created by apple on 2019/11/5.
//  Copyright © 2019 zhulp. All rights reserved.
//

#import "UISearchBar+Text.h"

@implementation UISearchBar (Text)


-(UITextField *)BYNGetSearchTextFiled{
    
    if ([[[UIDevice currentDevice]systemVersion] floatValue] >= 13.0) {
        return self.searchTextField;
    }else{
        UITextField *searchTextField =  [self valueForKey:@"_searchField"];
        return searchTextField;
    }
    
}

@end
