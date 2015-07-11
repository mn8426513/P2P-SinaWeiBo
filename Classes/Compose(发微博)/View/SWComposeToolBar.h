//
//  SWComposeToolBar.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-13.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWComposeToolBar;

typedef enum {
   SWComposeToolBarPictureButton,
   SWComposeToolBarMentionButton,
   SWComposeToolBarTrendbutton,
   SWComposeToolBarEmotionButton,
   SWComposeToolBarCameraButton
} SWComposeToolBarButton;

@protocol SWComposeToolBarDelegate <NSObject>
@optional
-(void)composeToolBarDidClickButton:(SWComposeToolBar *)toolBar button:(UIButton *)button;
@end

@interface SWComposeToolBar : UIView
@property (nonatomic,weak)  id<SWComposeToolBarDelegate> delegate;
@end
