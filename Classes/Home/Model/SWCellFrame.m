//
//  SWCellFrame.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-28.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWCellFrame.h"
#import  <UIKit/UIKit.h>
#import  "SWStatus.h"
#import "SWUser.h"
#import "SWPhotosView.h"


@implementation SWCellFrame

- (void)setStatus:(SWStatus *)status
{
    _status = status;
    
   /** CELL 的宽度  */
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 8;
    
    //1.firstView
    CGFloat firstViewW = cellW;
    CGFloat firstViewH = 0;
    CGFloat firstViewX = 0;
    CGFloat firstViewY = 0;
    //2.iconView
    CGFloat iconViewWH =35;
    CGFloat iconViewX =SWStatusCellBorder;
    CGFloat iconViewY =SWStatusCellBorder;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH,iconViewWH);
    
    //3.name
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + SWStatusCellBorder;
    CGFloat nameLabelY =  iconViewY;
    CGSize nameLabelSize = [status.user.name sizeWithFont:SWNameFont];
    _nameLabelF = (CGRect){CGPointMake(nameLabelX, nameLabelY),nameLabelSize};

    
    //4.vip
    if(status.user.mbtype >2){
        CGFloat vipVieww = 14;
        CGFloat vipViewH = nameLabelSize.height;
        CGFloat vipViewX = CGRectGetMaxX(_nameLabelF) + SWStatusCellBorder;
        CGFloat vipViewY = nameLabelY;
        _vipViewF = CGRectMake(vipViewX, vipViewY, vipVieww, vipViewH);

    }
    // 5.time
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF) + SWStatusCellBorder;
    CGSize timeLabelSize = [status.created_at sizeWithFont:SWTimeFont];
    _timeLabelF =(CGRect){{timeLabelX, timeLabelY}, timeLabelSize};
    // 6.source
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabelF) + SWStatusCellBorder;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [status.source sizeWithFont:SWSourceFont];
    _sourceLabelF = (CGRect){{sourceLabelX, sourceLabelY}, sourceLabelSize};

    // 7.  MY content
    CGFloat contentLabelX = iconViewX;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_timeLabelF), CGRectGetMaxY(_iconViewF)) + SWStatusCellBorder;
    CGFloat contentLabelMaxW = firstViewW - 2 * SWStatusCellBorder;
    CGSize contentLabelSize = [status.text sizeWithFont:SWMycontentFont constrainedToSize:CGSizeMake(contentLabelMaxW, MAXFLOAT)];
     _myTextLabelF = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize};
    
    // 8.photo
    if (status.pic_urls.count) {
        CGSize photoViewSize = [SWPhotosView photosViewSizeWithPhotosCount:(int)status.pic_urls.count];
        CGFloat photoViewX = contentLabelX;
        CGFloat photoViewY = CGRectGetMaxY(_myTextLabelF) + SWStatusCellBorder;
        _photoViewF = (CGRect){{photoViewX,photoViewY},photoViewSize};
    }
    
    
    // 9.    retweeted_status
    if (status.retweeted_status) {
        CGFloat retweetViewW = contentLabelMaxW;
        CGFloat retweetViewX = contentLabelX;
        CGFloat retweetViewY = CGRectGetMaxY(_myTextLabelF) + SWStatusCellBorder;
        CGFloat retweetViewH = 0;
        
        // 10.   retweetNameLabelX
        CGFloat retweetNameLabelX = SWStatusCellBorder;
        CGFloat retweetNameLabelY = SWStatusCellBorder;
        NSString *name = [NSString stringWithFormat:@"@%@",status.retweeted_status.user.name ];
        CGSize retweetNameLabelSize = [name sizeWithFont:SWRetweetNameLabeFont];
         _retweetNameF = (CGRect){{retweetNameLabelX, retweetNameLabelY}, retweetNameLabelSize};
        
        // 11.   retweetContentLabel
        CGFloat retweetContentLabelX = retweetNameLabelX;
        CGFloat retweetContentLabelY = CGRectGetMaxY(_retweetNameF) + SWStatusCellBorder;
        CGFloat retweetContentLabelMaxW = retweetViewW - 2 * SWStatusCellBorder;
        CGSize retweetContentLabelSize = [status.retweeted_status.text sizeWithFont:SWRetweetContentFont constrainedToSize:CGSizeMake(retweetContentLabelMaxW, MAXFLOAT)];
        
         _retweetTextLabelF = (CGRect){{retweetContentLabelX, retweetContentLabelY}, retweetContentLabelSize};
        
        // 12.status.retweeted_status.pic_urls.count
        if(status.retweeted_status.pic_urls.count) {
//            CGFloat retweetPhotoViewWH = 70;
            CGSize retweetViewSize = [SWPhotosView photosViewSizeWithPhotosCount:(int)status.retweeted_status.pic_urls.count];
            
            CGFloat retweetPhotoViewX = retweetContentLabelX;
            CGFloat retweetPhotoViewY = CGRectGetMaxY(_retweetTextLabelF) + SWStatusCellBorder;
            _retweetImageViewF = CGRectMake(retweetPhotoViewX, retweetPhotoViewY, retweetViewSize.width, retweetViewSize.height);
            
             retweetViewH = CGRectGetMaxY(_retweetImageViewF);
          } else { // 没有配图
            retweetViewH = CGRectGetMaxY(_retweetTextLabelF);
        }
        retweetViewH += SWStatusCellBorder;
        _retweetViewF = CGRectMake(retweetViewX,retweetViewY , retweetViewW, retweetViewH);
        firstViewH = CGRectGetMaxY(_retweetViewF);
    }else{
        if(status.pic_urls.count){
        firstViewH = CGRectGetMaxY(_photoViewF);
        }else{
        firstViewH = CGRectGetMaxY(_myTextLabelF);
       }
     }
     firstViewH += SWStatusCellBorder;
    _firstViewF = CGRectMake(firstViewX, firstViewY, firstViewW, firstViewH);
    
    
    //  TOOLBAR
    CGFloat secondViewX = firstViewX;
    CGFloat secondViewY = CGRectGetMaxY(_firstViewF);
    CGFloat secondViewW = firstViewW;
    CGFloat secondViewH = 35;
    _secondViewF = CGRectMake(secondViewX, secondViewY, secondViewW, secondViewH);
    _cellHeight  =  CGRectGetMaxY(_secondViewF) +10;
}
@end
