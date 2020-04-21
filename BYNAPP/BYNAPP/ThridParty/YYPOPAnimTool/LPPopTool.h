//
//  MJPopTool.h
//  MJPopToolDemo
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LPPopTool : NSObject

+ (instancetype)sharedInstance;

/**
 *
 *  弹出视图
 *
 *  @param view     被弹出的视图
 *  @param animated 是否需要动画
 */
- (void)popView:(UIView *)view animated:(BOOL)animated;


/**
 *
 *  关闭视图
 *
 *  @param animated 是否需要动画
 */
- (void)closeAnimated:(BOOL)animated;



@end
