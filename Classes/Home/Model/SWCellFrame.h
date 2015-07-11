//
//  SWCellFrame.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-28.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>
#import "SWCommon.h"

@class SWStatus;
@interface SWCellFrame : NSObject
@property (nonatomic,strong) SWStatus *status;


@property (nonatomic,assign,readonly) CGRect firstViewF;
@property (nonatomic,assign,readonly) CGRect iconViewF;
@property (nonatomic,assign,readonly) CGRect nameLabelF;
@property (nonatomic,assign,readonly) CGRect vipViewF;
@property (nonatomic,assign,readonly) CGRect timeLabelF;
@property (nonatomic,assign,readonly) CGRect sourceLabelF;
@property (nonatomic,assign,readonly) CGRect myTextLabelF;
@property (nonatomic,assign,readonly) CGRect photoViewF;
@property (nonatomic,assign,readonly) CGRect retweetViewF;
@property (nonatomic,assign,readonly) CGRect retweetNameF;
@property (nonatomic,assign,readonly) CGRect retweetTextLabelF;
@property (nonatomic,assign,readonly) CGRect retweetImageViewF;
@property (nonatomic,assign,readonly) CGRect secondViewF;
@property (nonatomic,assign,readonly) CGRect repostsF;
@property (nonatomic,assign,readonly) CGRect commentsF;
@property (nonatomic,assign,readonly) CGRect attitudesF;

@property (nonatomic,assign,readonly) CGFloat cellHeight;
@end
