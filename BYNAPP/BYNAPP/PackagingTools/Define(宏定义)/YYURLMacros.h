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
//#define Common_URL @" http://open.biyingniao.com/"

///**测试服务器*/
#define Common_URL @"http://test.wef2.top/"

#pragma mark - ——————— 详细接口地址 ————————

//1.获取首页商品数据
#define URL_APIGoodsHome @"api/goods/home"
//2.首页头部商品类目
#define URL_APIGoodsCategories @"api/goods/categories"
//3.根据商品类目搜索
#define URL_APIGoodsItems @"api/goods/items"

//3.品牌券类目列表
#define URL_APIMpvCategories @"api/mpv2/categories"


//3.用户手机号 注册、登录
#define URL_AutoLogin @"api/auth/login"
//4.手机号绑定微信
#define URL_AutoBindWX @"api/auth/bind_wx"
//5.微信号 注册、登录
#define URL_AutoWXLogin @"api/auth/wx_login"
//6.手机号和微信绑定
#define URL_AutoBindPhone @"api/auth/bind_phone"
//7.获取登录用户个人中心信息
#define URL_UserInfo @"api/user/info"
//8.获取用户首页信息
#define URL_HomeMain @"api/home/main_v3"

//10.获取APP我的消息
#define URL_UserNotice @"api/user/notices"
//11.获取APP分享界面发圈数据
#define URL_Moments @"api/moments"
//12.获取用户商品列表API
#define URL_Itemsitemlist @"api/items/itemlist"

//9.超级入口
#define URL_ApiBrands @"api/brands"

//12.获取用户商品列表API
#define URL_ItemsNewItemList @"api/items/new_itemlist"

//9.获取商品类目API
#define URL_ItemsTqglist @"api/items/tqglist"
//13.获取用户商品详情API
#define URL_Itemsdetail @"api/items/detail"
//14.商品海报生成API
#define URL_Itempromotion @"api/items/promotion"
//15.修改用户信息API
#define URL_Userupdate @"api/user/update"
//16.我的收入API
#define URL_Usermyreport @"api/user/my_report"
//17.我的收入API
#define URL_UserAccountflows @"api/user/account_flows"
//18.我的订单API
#define URL_Userorders @"api/user/orders"
//19.我的团队API
#define URL_Userteams @"api/user/teams"
//20.邀请海报API
#define URL_Userinviteposter @"api/user/invite_poster"
//21.获取用户首页实时热卖
#define URL_HomeHot @"api/home/hot"
//22.获取用户商品搜索
#define URL_HomeSearch @"api/search"
//22.热门搜索商品搜索
#define URL_HomeHotWordsSearch @"api/hot_words"
//22.显示抢购时间表
#define URL_ItemsTimelist @"api/items/timelist"
//23.淘口令反解析接口
#define URL_Querytkl @"api/query_tkl"
//24.猜你喜欢
#define URL_HomeGuesslike @"api/home/guesslike"
//25.美团界面数据
#define URL_HbcouponList @"api/hbcoupon/list"
//25.生活券列表
#define URL_LiftCoupon @"api/life_coupon"
//26.美团界面数据
#define URL_HbcouponSend @"api/hbcoupon/send"
//27.专辑列表
#define URL_HomeAlbums @"api/albums"
//28.专辑列表详情
#define URL_APIAlbumsInfo @"api/album_info"
//26. 美团卡券
#define URL_UserKaquan @"api/user/kaquan"
//28.提现接口
#define URL_UserTixian @"api/user/tixian"
//29.提现详情接口
#define URL_UserTXDetails @"api/user/tx_details"
//30.评论转链接接口
#define URL_TransComment @"api/trans_comment"
//31.活动页面评论转链接接口
#define URL_ActivityTkl @"api/activity_tkl"
//31.活动页面评论转链接接口
#define URL_HomePopup @"api/home/popup"

//26 我的收藏
#define URL_UserCollects @"api/user/collects"
//25.收藏
#define URL_UserCollect @"api/user/collect"
//25.取消收藏
#define URL_UserCancelCollect @"api/user/cancel_collect"

//30.我的足迹
#define URL_UserTrace @"api/user/trace"

//31.清空我的足迹
#define URL_UserFlushTrace @"api/user/flush_trace"

//41.活动签到首页数据
#define URL_PointsTasksInfo @"api/points/tasks/info"

//42.活动签到首页数据
#define URL_PointsTasksDo @"api/points/tasks/do"

//43.活动签到首页数据
#define URL_PointsMoneyExchange @"api/points/money_exchange"

//44.活动签到首页数据
#define URL_PointsExchangeLogs @"api/points/exchange_logs"

//45 APP 升级
#define URL_APICheckVersion @"api/check_version"



#endif /* URLMacros_h */

