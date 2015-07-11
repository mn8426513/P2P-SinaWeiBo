//
//  SWTextView.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-12.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWComposePhotosView.h"

@interface SWTextView : UITextView
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,strong) UIFont *placeholderFont;
@property (nonatomic,strong) UIColor *placeholderColor;
@property (nonatomic,strong) SWComposePhotosView *photosView;

@end
