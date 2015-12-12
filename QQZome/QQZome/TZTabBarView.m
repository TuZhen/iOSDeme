//
//  TZTabBarView.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZTabBarView.h"
#import "TZBarButtonItem.h"
@interface TZTabBarView()
@property (nonatomic, assign) NSInteger fromIndex;
@property (nonatomic, strong)  TZBarButtonItem*selectedItem;
@end;

@implementation TZTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addBarButtonItemWithIcon:@"tab_bar_feed_icon" title:@"全部动态"];
        [self addBarButtonItemWithIcon:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self addBarButtonItemWithIcon:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self addBarButtonItemWithIcon:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self addBarButtonItemWithIcon:@"tab_bar_friend_icon" title:@"好友"];
        [self addBarButtonItemWithIcon:@"tab_bar_e_more_icon" title:@"更多"];
        
    }
    return self;
}


- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape{
    self.width = self.superview.width;
    self.height = self.subviews.count*TZDockViewPortraitWidth;
    self.x = 0;
    self.y =isLandscape?(self.superview.height - TZDockViewPortraitWidth-self.height):(self.superview.height - TZDockViewLandscapeWidth -self.height);
    for (int i = 0; i < self.subviews.count; ++i) {
        TZBarButtonItem *item = self.subviews[i];
        item.width = self.superview.width;
        item.height = TZDockViewPortraitWidth;
        item.x = 0;
        item.y = item.height*i;
    }
    
    
}

- (void)addBarButtonItemWithIcon:(NSString *)icon title:(NSString *)title{
    
    TZBarButtonItem *item = [[TZBarButtonItem alloc] init];
    item.tag = self.subviews.count;
    [self addSubview:item];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -点击Item时调用
- (void)itemDidClick:(TZBarButtonItem *)item{
   
    self.selectedItem.selected = NO;
    item.selected = YES;

    if ([self.delegate respondsToSelector:@selector(tabBarView:ItemDidClickFromIndex:toIndex:)]) {
        [self.delegate tabBarView:self ItemDidClickFromIndex:self.fromIndex toIndex:item.tag];
    }
    
    self.fromIndex = item.tag;
    self.selectedItem = item;
}

- (void) cancelSelecetAll{

    self.selectedItem.selected = NO;
}

@end
