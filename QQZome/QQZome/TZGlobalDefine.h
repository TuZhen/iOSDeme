//
//  TZGlobalDefine.h
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#ifndef TZGlobalDefine_h
#define TZGlobalDefine_h

typedef enum {
    TZBottomMenuItemTypeMood,
    TZBottomMenuItemTypePhoto,
    TZBottomMenuItemTypeBlog
    
} TZBottomMenuItemType;

#define TZDockViewPortraitWidth 70///<DockView竖屏时的宽度
#define TZDockViewLandscapeWidth TZDockViewPortraitWidth*3///<DockView横屏时的宽度


#define TZPersonalCenterButtonY 50   ///< 头像的Y坐标
#define TZPersonalCenterButtonProtriatWidthOrHeight 70///< 竖屏头像的宽或高
#define TZPersonalCenterButtonLandscapeWith 100   ///< 横屏头像按钮的宽度
#define TZPersonalCenterButtonLandscapeLabelHeight 50 ///< 横屏头像LabeL高度

#define TZContentViewWidth  (768 - TZDockViewPortraitWidth)  ///< 内容视图的宽带
//#define TZTabBarViewPortraitWidth 70///<DockView竖屏时的宽度
//#define TZTabBarViewLandscapeWidth TZDockViewPortraitWidth*3///<DockView横屏时的宽度

#endif /* TZGlobalDefine_h */
