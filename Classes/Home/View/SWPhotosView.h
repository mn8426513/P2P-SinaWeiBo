//
//  SWPhotosView.h
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-10.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SWPhotosView : UIImageView
@property (nonatomic,strong) NSArray *photos;


/**
 *  根据图片的个数返回相册的最终尺寸
 */

+ (CGSize)photosViewSizeWithPhotosCount:(int)count;


@end
