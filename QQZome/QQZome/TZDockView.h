//
//  TZDockView.h
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZTabBarView.h"
#import "TZBottomMenu.h"
#import "TZPersonalCenterButton.h"

@interface TZDockView : UIView

@property(nonatomic,weak) TZTabBarView *tabBarView;
@property(nonatomic,weak) TZBottomMenu *bottomMenu;
@property(nonatomic,weak) TZPersonalCenterButton *personalCenter;

/**
 *  判断屏幕是否为横屏
 *
 *  
 */
- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape;

@end
