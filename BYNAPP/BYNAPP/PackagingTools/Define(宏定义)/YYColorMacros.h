//
//  FontAndColorMacros.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

//字体大小和颜色配置

#ifndef YYColorMacros_h
#define YYColorMacros_h


#pragma mark -  颜色区


#define YYMainColor [UIColor colorWithHexString:@"#FF2323"]
#define YY32Color   [UIColor colorWithHexString:@"#323232"]
#define YY66Color   [UIColor colorWithHexString:@"#665353"]
#define YY56Color   [UIColor colorWithHexString:@"#565656"]
#define YY99Color   [UIColor colorWithHexString:@"#999999"]
#define YYBGColor   [UIColor colorWithHexString:@"#F6F6F6"]
#define YYE1Color   [UIColor colorWithHexString:@"#E1E1E1"]
#define YYCCColor   [UIColor colorWithHexString:@"#CCCCCC"]
#define YYRandomColor KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)


//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define YYNSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define LPNSLog(format, ...)
#endif






#endif /* FontAndColorMacros_h */
