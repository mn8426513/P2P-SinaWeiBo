//
//  SWTabbar.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-17.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWTabbar;

@protocol SWTabbarDelegate <NSObject>

@optional
- (void)tabbar:(SWTabbar *)tabbar from:(int)from to:(int) to;
-(void)tabbarDidClickAddButton:(SWTabbar *)tabbar ;
@end

@interface SWTabbar : UIView

@property (nonatomic,weak) id <SWTabbarDelegate> delegate;

- (void)addTabButton:(UITabBarItem *)barItem;


@end
