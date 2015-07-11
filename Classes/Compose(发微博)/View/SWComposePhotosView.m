//
//  SWComposePhotosView.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-13.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWComposePhotosView.h"

@implementation SWComposePhotosView


- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
    
    }
    return self;
}






-(void)addImage:(UIImage *)image
{
    UIImageView *imageView  =  [[UIImageView alloc] init];
    imageView.image =image;
    [self addSubview:imageView];

}

-(void)layoutSubviews
{
    int count = (int)self.subviews.count;
    CGFloat imageViewW = 95;
    CGFloat imageViewH = 95;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = self.subviews[i];
        int maxCol = 3  ;
        CGFloat margin = (self.frame.size.width - imageViewW * maxCol)/(maxCol+1);
        int col = i % maxCol ;
        int row = i / maxCol ;
        CGFloat imageViewX = margin + (margin + imageViewW) * col;
        CGFloat imageViewY = margin + (margin + imageViewH) * row;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    }
}


- (NSArray *)totalImage
{
    NSMutableArray *array = [NSMutableArray array];
    for ( UIImageView *imageView in self.subviews) {
        
        [array addObject:imageView.image];
    }
    return  array;
}
@end
