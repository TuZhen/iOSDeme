//
//  TZBottomMenu.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZBottomMenu.h"
#import "TZBottomMenuItem.h"

@implementation TZBottomMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addItemWithIconName:@"tabbar_mood" andType:TZBottomMenuItemTypeMood];
        [self addItemWithIconName:@"tabbar_photo" andType:TZBottomMenuItemTypePhoto];
        [self addItemWithIconName:@"tabbar_blog" andType:TZBottomMenuItemTypeBlog];
    }
    return self;
}


- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape{
    
    self.width = self.superview.width;
    self.height = isLandscape?TZDockViewPortraitWidth:TZDockViewLandscapeWidth;
    self.y = self.superview.height - self.height;
    for (int i = 0; i < self.subviews.count; ++i) {
        UIButton *item = self.subviews[i];
        item.width = TZDockViewPortraitWidth;
        item.height = item.width;
        if (isLandscape) {
            item.x = item.width*i;
            item.y = 0;
        }else{
        
            item.x = 0;
            item.y = item.height*i;
        }
    }
    
}

#pragma mark - 添加按钮
- (void)addItemWithIconName:(NSString *)iconName andType:(TZBottomMenuItemType)type{
    TZBottomMenuItem *item = [[TZBottomMenuItem alloc] init];
    [item setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    item.itemType = type;
    [self addSubview:item];
    [item addTarget:self action:@selector(itemDidClick:) forControlEvents:UIControlEventTouchUpInside];

    
}

- (void)itemDidClick:(TZBottomMenuItem *)item{

    if ([self.delegate respondsToSelector:@selector(bottomMenuItemDidClick:andItemType:)]) {
        [self.delegate bottomMenuItemDidClick:self andItemType:item.itemType];
    }
   
}

@end
