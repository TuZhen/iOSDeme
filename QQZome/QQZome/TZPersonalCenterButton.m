//
//  TZPersonalCenterView.m
//  QQZome
//
//  Created by 涂真 on 15/12/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZPersonalCenterButton.h"

@implementation TZPersonalCenterButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (void)orientationOfScreenIsLandscape:(BOOL)isLandscape{
    self.y = TZPersonalCenterButtonY;
    if (isLandscape) {
        self.width = TZPersonalCenterButtonLandscapeWith;
        self.height = TZPersonalCenterButtonLandscapeWith+TZPersonalCenterButtonLandscapeLabelHeight;
        self.x = (self.superview.width - self.width)*0.5;
        
    }else{
    
        self.width = TZPersonalCenterButtonProtriatWidthOrHeight;
        self.height = TZPersonalCenterButtonProtriatWidthOrHeight;
        self.x = 0;
    }

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (self.height == self.width) {
        return CGRectMake(0, 0, self.width, self.height);
    }
    return CGRectMake(0, 0, TZPersonalCenterButtonLandscapeWith, TZPersonalCenterButtonLandscapeWith);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (self.height == self.width) {
        return CGRectZero;
    }
    return CGRectMake(0, TZPersonalCenterButtonLandscapeWith, TZPersonalCenterButtonLandscapeWith, TZPersonalCenterButtonLandscapeLabelHeight);
}

@end
