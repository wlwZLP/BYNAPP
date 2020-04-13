//
//  URLMacros.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h

/**生产服务器*/
//#define Common_URL @"http://open.biyingniao.com/"

///**测试服务器*/
#define Common_URL @"http://test.wef2.top/"

#pragma mark - ——————— 详细接口地址 ————————
//1.获取首页广告
#define URL_APIGoodsHome @"api/goods/home"
//1.获取首页商品
#define URL_APIGoodsTaobaoHot @"api/goods/taobao/hot"
//2.首页分类 商品类目
#define URL_APIGoodsCategories @"api/goods/categories"
//3.根据商品类目搜索
#define URL_APIGoodsItems @"api/goods/items"
//4.检测用户是否存在
#define URL_APIUserExist @"api/user/exist"
//5.用户手机号 注册、登录
#define URL_APIUserLogin @"api/user/login"
//6.获取验证码
#define URL_APIGetValidateCode @"api/user/get_validate_code"
//7.根据商品类目搜索
#define URL_APIGoodsItems @"api/goods/items"
//8.品牌券类目列表
#define URL_APIMpvCategories @"api/mpv2/categories"

//9.个人中心数据
#define URL_APIMPVUserInfo @"api/mpv2/user/info"




#endif /* URLMacros_h */

