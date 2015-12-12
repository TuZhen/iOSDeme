//
//  UIColor+RandomColor.m
//  iOS9地图
//
//  Created by 李志伟 on 15/8/22.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)


+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
