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

#define YYMMColor   [UIColor colorWithHexString:@"#FFD409"]
#define YY11Color   [UIColor colorWithHexString:@"#111111"]
#define YY22Color   [UIColor colorWithHexString:@"#222222"]
#define YY33Color   [UIColor colorWithHexString:@"#333333"]
#define YY66Color   [UIColor colorWithHexString:@"#665353"]
#define YY56Color   [UIColor colorWithHexString:@"#565656"]
#define YY99Color   [UIColor colorWithHexString:@"#999999"]
#define YYBGColor   [UIColor colorWithHexString:@"#F6F6F6"]
#define YYCCColor   [UIColor colorWithHexString:@"#CCCCCC"]
#define YYE1Color   [UIColor colorWithHexString:@"#E1E1E1"]
#define YYE5Color   [UIColor colorWithHexString:@"#E5E5E5"]

#define YYRGBColor(r,g,b) [UIColor colorWithRed:(r) / 256.0 green:(g) / 256.0 blue:(b) / 256.0 alpha:1]
#define YYHexColor(hex) [UIColor colorWithHexString:(hex)]
#define YYRandomColor YYRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define YYNSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define LPNSLog(format, ...)
#endif


//强弱引用
#define YYWeakSelf(type)  __weak typeof(type) weak##type = type;
#define YYStrongSelf(type) __strong typeof(type) type = weak##type;



#endif /* FontAndColorMacros_h */
