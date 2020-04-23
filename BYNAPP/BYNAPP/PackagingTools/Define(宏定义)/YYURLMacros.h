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
#define Common_URL @"http://open.biyingniao.com/"

///**测试服务器*/
//#define Common_URL @"http://test.wef2.top/"

#pragma mark - ——————— 详细接口地址 ————————
//1.获取首页广告
#define URL_APIGoodsHome @"api/goods/home"
//1.获取首页商品
#define URL_APIGoodsTaobaoHot @"api/goods/taobao/hot"
//2.首页分类 商品类目
#define URL_APIGoodsCategories @"api/goods/categories"
//3. 获取商品列表
#define URL_APIGoodsItems @"api/goods/items"
//4.检测用户是否存在
#define URL_APIUserExist @"api/user/exist"
//5.用户手机号登录
#define URL_APIUserLogin @"api/user/login"
//5.用户手机号注册
#define URL_APIUserRegister @"api/user/register"
//6.获取邀请人信息
#define URL_APIUserRecommendor @"api/user/get_recommendor"
//6.获取验证码
#define URL_APIGetValidateCode @"api/user/get_validate_code"
//7.根据商品类目搜索
#define URL_APIGoodsItems @"api/goods/items"
//8.商品详情
#define URL_APIGoodsDetail @"api/goods/detail"
//9.个人中心数据
#define URL_APIMPVUserInfo @"api/mpv2/user/info"
//10.猜你喜欢数据
#define URL_APIGoodsGuessLike @"api/goods/guess_like"
//11.相似商品
#define URL_APIGoodsSimlarItems @"api/goods/similar_items"
//12.品牌券分类
#define URL_APIMPVHome @"api/mpv2/home"
//13.品牌券热门推荐
#define URL_APIMPVRecommends @"api/mpv2/recommends"
//14.品牌券类目商品
#define URL_APIMPVCategoryProducts @"api/mpv2/category-products"
//15.根据品牌商品列表
#define URL_APIMPVBrandProducts @"api/mpv2/brand-products"
//16.根据品牌商品详情
#define URL_APIMPVProductDetail @"api/mpv2/product-detail"
//17.收藏商品
#define URL_APIUserCollect @"api/user/collect"
//18.收藏商品列表
#define URL_APIUserCollects @"api/user/collects"
//19.足迹
#define URL_APIUserBrowsers @"api/user/browsers"
//20.订单列表
#define URL_APIUserMPVOrders @"api/user/orders"
//21.卡券列表
#define URL_APIMPVOerders @"api/mpv2/orders"
//21-2.卡券列表订单详情
#define URL_APIMPVOerdersDetail @"api/mpv2/order-detail"
//21-3.卡券列表订单详情
#define URL_APIMPVOerdersCancel @"api/mpv2/order-cancel"
//22.新手教程
#define URL_APIUserArticleCategories @"api/user/article_categories"
//23.新手教程m内容和文章
#define URL_APIUserArticles @"api/user/articles"
//24.会员中心数据
#define URL_APIMPVCommon @"api/mpv2/common"
//25.我的团队
#define URL_APIMPVUserTeam @"api/mpv2/user/team"
//26.我的数据报表
#define URL_APIMPVUserReport @"api/mpv2/user/report"
//27.商品搜索接口
#define URL_APIGoodsSearch @"api/goods/search"
//28.品牌搜索接口
#define URL_APIMPVSearch @"api/mpv2/search"
//29.卡券和直冲下单接口
#define URL_APIMPVProductOrder @"api/mpv2/product-order"
//30.邀请海报
#define URL_APIUserInvitePoster @"api/user/invite_poster"
//31.限时抢购时间表
#define URL_APIGoodsFlashSaleTimes @"api/goods/flash_sale_times"
//31.限时抢购列表
#define URL_APIGoodsFlashSaleItems @"api/goods/flash_sale_items"
//32.品牌墙搜索
#define URL_APIMPVSearch @"api/mpv2/search"
//33.邀请海报
#define URL_APIUserInvitePoster @"api/user/invite_poster"
//34.APP版本升级通知
#define URL_APIGoodsCheckVersion @"api/goods/check_version"
//35.弹窗
#define URL_APIgoodsPopWindow @"api/goods/pop_window"
//36.悬浮挂件
#define URL_APIGoodsSuspend @"api/goods/suspend"
//37.客服信息
#define URL_APIMPVKefu @"api/mpv2/app_kefu"
//38.提现记录
#define URL_APIMPVUserTxrecs @"api/mpv2/user/tx_recs"
//39.会员购买
#define URL_APIMPVMemberBuy @"api/mpv2/member-buy"
//40.会员页面
#define URL_APIMPVMemberpage @"api/mpv2/member-page"




#endif /* URLMacros_h */

