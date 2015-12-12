//
//  TZTabBarView.h
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TZTabBarView;
@protocol TZTabBarViewDelegate <NSObject>

@optional
- (void)tabBarView:(TZTabBarView *)tabBarView ItemDidClickFromIndex:(NSInteger)froIndex toIndex:(NSInteger)toIndex;

@end
@interface TZTabBarView : UIView
/**
 *  判断屏幕是否为横屏
 *
 *
 */
- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape;

/**
 *  取消选中
 */
- (void) cancelSelecetAll;

@property (nonatomic, weak) id<TZTabBarViewDelegate> delegate;

@end
