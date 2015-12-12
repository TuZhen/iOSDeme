//
//  TZDockView.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZDockView.h"
#import "TZTabBarView.h"
#import "TZPersonalCenterButton.h"


@interface TZDockView ()


@end
@implementation TZDockView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBottomMenu];
        [self addTabBarView];
        [self addPersonalCenterButton];
    }
    return self;
}

- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape{
    
    self.width = isLandscape?TZDockViewLandscapeWidth:TZDockViewPortraitWidth;
    [self.bottomMenu orientationOfScreenIsLandscape:isLandscape];
    [self.tabBarView orientationOfScreenIsLandscape:isLandscape];
    [self.personalCenter orientationOfScreenIsLandscape:isLandscape];
}
#pragma mark - 添加子视图
//添加BottomMenu
- (void)addBottomMenu{
    TZBottomMenu *bottomMenu = [[TZBottomMenu alloc]init];
    [self addSubview:bottomMenu];
    self.bottomMenu = bottomMenu;
    bottomMenu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    bottomMenu.backgroundColor = [UIColor redColor];
    
}
//添加TabBarView
- (void)addTabBarView{
    TZTabBarView *tabBarView = [[TZTabBarView alloc]init];
    [self addSubview:tabBarView];
    self.tabBarView = tabBarView;
    tabBarView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    tabBarView.backgroundColor = [UIColor blueColor];
}
//添加个人中心
- (void)addPersonalCenterButton{
    
    TZPersonalCenterButton *personalCenter = [[TZPersonalCenterButton alloc] init];
    [self addSubview:personalCenter];
    [personalCenter setImage:[UIImage imageNamed:@"labixiaoxin"] forState:UIControlStateNormal];
    [personalCenter setTitle:@"蜡笔小新" forState:UIControlStateNormal];
    self.personalCenter = personalCenter;
    
}

@end
