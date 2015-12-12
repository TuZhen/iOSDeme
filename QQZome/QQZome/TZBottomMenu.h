//
//  TZBottomMenu.h
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TZBottomMenu;
@protocol TZBottomMenuDelegate <NSObject>



/**
 *  TZBottomMenuDelegate的代理方法
 *
 *  @param bottomMenu TZBottomMenu对象
 *  @param itemType   item的类型
 */
- (void)bottomMenuItemDidClick:(TZBottomMenu *)bottomMenu andItemType:(TZBottomMenuItemType)itemType;

@end

@interface TZBottomMenu : UIView

/**
 *  判断屏幕是否为横屏
 *
 *
 */
- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape;

@property (nonatomic, weak) id<TZBottomMenuDelegate> delegate;///<代理属性
@end
