//
//  SWSettingItem.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WillDoTask)();

@interface SWSettingItem : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subTitle;
@property(nonatomic,copy) WillDoTask willDo;
@property(nonatomic,copy) NSString *badgeValue;

+(instancetype)item;
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+(instancetype)itemWithTitle:(NSString *)title;
@end
