//
//  UIBarButtonItem+MN.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-19.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MN)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end
