//
//  UIImage+MN.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-16.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "UIImage+MN.h"
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@implementation UIImage (MN)

+ (UIImage *)imageWithName:(NSString *)name
{
    if(iOS7){
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if(image){
            return image;
        }
        return [UIImage imageNamed:name];
    }else{
        return [UIImage imageNamed:name];
    }
}

+(UIImage *)resizeImageWithName:(NSString *)name
{
      UIImage *image = [UIImage imageWithName:name];
      return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height *0.5];
}
+(UIImage *)resizeImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat) top
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height *top];

}
@end
