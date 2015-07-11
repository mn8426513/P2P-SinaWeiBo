//
//  SWTextView.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-12.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWTextView.h"

@interface SWTextView ()
@property (nonatomic,weak) UILabel *placeholderView;

@end
@implementation SWTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        //1.添加一个 Textlabel来显示placeholder
        UILabel *placeholderView = [[UILabel alloc] init];
        placeholderView.textColor = [UIColor lightGrayColor];
        placeholderView.numberOfLines = 0;
        placeholderView.hidden = YES;
        self.placeholderView = placeholderView;
        [self addSubview:placeholderView];
        
        //添加一个监听，监听蚊子的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self];
        
        
        [self setupPhotosView];
    }
 
    return  self;
}




-(void)setupPhotosView
{
    SWComposePhotosView *photosView =[[SWComposePhotosView alloc] init];
     self.photosView = photosView;
    [self addSubview:photosView];
    
}
-(void)layoutSubviews{
    CGFloat photosViewX = 0;
    CGFloat photosViewY = 80;
    CGFloat photosViewW = self.frame.size.width;
    CGFloat photosViewH = self.frame.size.height;
    self.photosView.frame = CGRectMake(photosViewX, photosViewY, photosViewW, photosViewH);
}


-(void)textChange
{
    self.placeholderView.hidden = (self.text.length != 0);
}


//重写set方法后直接传值就可以设置uilabel的大小
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    self.placeholderView.text = placeholder;
    if(placeholder){
        self.placeholderView.hidden = NO;
        CGFloat placeholderX = 6;
        CGFloat placeholderY = 7;
        CGFloat maxW = self.frame.size.width;
        CGFloat maxH = self.frame.size.height;
        CGSize placeholderSize = [placeholder sizeWithFont:self.placeholderView.font constrainedToSize:CGSizeMake(maxW, maxH)];
        self.placeholderView.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width,placeholderSize.height);
    }else{
        self.placeholderView.hidden = YES;
    }
}



//设置字体大小
-(void)setPlaceholderFont:(UIFont *)placeholderFont
{
    self.placeholderView.font = placeholderFont;
    self.placeholder = self.placeholder;
}

//设置颜色
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    self.placeholderView.textColor = placeholderColor;

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
