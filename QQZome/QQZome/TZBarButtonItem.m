//
//  TZBarButtonItem.m
//  QQZome
//
//  Created by 涂真 on 15/12/10.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "TZBarButtonItem.h"

@implementation TZBarButtonItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (self.height == self.width) {
        return CGRectMake(0, 0, self.width, self.height);
    }
    return CGRectMake(0, 0, self.width*0.5, self.height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    if (self.height == self.width) {
        return CGRectZero;
    }
    return CGRectMake(self.width*0.5, 0, self.width*0.5, self.height);

    
}

@end
