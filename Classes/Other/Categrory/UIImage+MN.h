//
//  UIImage+MN.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MN)
+ (UIImage *)imageWithName:(NSString *)name;
+(UIImage *)resizeImageWithName:(NSString *)name;
+(UIImage *)resizeImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat) top;
@end
