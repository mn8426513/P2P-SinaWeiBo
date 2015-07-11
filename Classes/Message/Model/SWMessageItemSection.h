//
//  SWMessageItemSection.h
//  P2P-SinaWeibo
//
//  Created by Mac on 15-2-27.
//  Copyright (c) 2015年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMessageItemSection : NSObject

@property(nonatomic,strong) NSArray *items;

+ (instancetype)section;

@end
