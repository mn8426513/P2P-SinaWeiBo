//
//  SWBadgeButton.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-11-18.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWBadgeButton.h"
#import "UIImage+MN.h"
#define  badgeFont [UIFont systemFontOfSize:11]
@implementation SWBadgeButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
         self.userInteractionEnabled = NO;
         self.titleLabel.font = badgeFont;
   }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    if(badgeValue && [badgeValue intValue]!= 0){
        [self setTitle:badgeValue forState:UIControlStateNormal];
        self.hidden =  NO;
        
        CGRect tempFrame = self.frame;
        CGFloat badgeW = self.currentBackgroundImage. size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        
        if(badgeValue.length == 1){
            tempFrame.size = CGSizeMake(badgeW, badgeH);
          }else{
                CGSize size = [badgeValue sizeWithFont:self.titleLabel.font];
                tempFrame.size.width = size.width + 10;
                tempFrame.size.height = badgeH;
              }
          self.frame = tempFrame;
     }else{
          self.hidden =YES;
    }
}
@end
