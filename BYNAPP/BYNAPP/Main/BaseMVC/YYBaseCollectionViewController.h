//
//  YYCollectionViewController.h
//  BYNAPP
//
//  Created by apple on 2020/3/31.
//  Copyright © 2020 xidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeMainModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YYBaseCollectionViewController : UICollectionViewController


@property(nonatomic,strong)NSMutableArray<HomeMainModel*> * MainListArray;

/**
 *  是否显示返回按钮,默认情况是YES
 */
@property (nonatomic, assign) BOOL isShowLiftBack;

/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYShowAlertViewTitle:(NSString *)title;

/**
*  点击右边的确认事件
*/
-(void)YYShowAlertTitleClick;
/**
 *  根据内容提示
 */
-(void)YYShowMessage:(NSString *)message;

/**
*  导航栏右边字体设置
*/
-(void)YYSetRightNavTitle:(NSString *)title target:(id)target action:(SEL)action;

/**
*  展示一个文字，用点击事件判断,类似JS  Alert;
*/
-(void)YYBaseLeftBackRightClick;

/**
*  检查APP是否需要更新
*/
-(void)YYGetCheckAPPUdataMessage;

/**
*  检查当前界面是否有弹框
*/
-(void)YYGetPOPWindowAdverView;


/**
*  当前弹框图片点击事件
*/
-(void)POPWindowImgClick;
/**
 下拉刷新多少条
 */
@property(nonatomic,assign)NSInteger RefreshCount;
/**
 下拉刷新一共多少页
 */
@property(nonatomic,assign)NSInteger TotalPageCount;






@end

NS_ASSUME_NONNULL_END
