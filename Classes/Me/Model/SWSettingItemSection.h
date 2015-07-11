//
//  SWSettingItemSection.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-23.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWSettingItemSection : NSObject

@property(nonatomic,strong) NSArray *items;
@property(nonatomic,copy) NSString *header;
@property(nonatomic,copy) NSString *footer;

+(instancetype)section;

@end
