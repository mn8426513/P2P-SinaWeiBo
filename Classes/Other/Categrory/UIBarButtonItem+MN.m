//
//  UIBarButtonItem+MN.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-19.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "UIBarButtonItem+MN.h"
#import "UIImage+MN.h"

@implementation UIBarButtonItem (MN)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage: [UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage: [UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = (CGRect){ CGPointZero,button.currentBackgroundImage.size};
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
