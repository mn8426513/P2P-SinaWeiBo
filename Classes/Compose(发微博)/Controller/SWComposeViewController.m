//
//  SWComposeViewController.m
//  P2P-SinaWeibo
//
//  Created by Mac on 14-12-12.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "SWComposeViewController.h"
#import "SWTextView.h"
#import "SWAccount.h"
#import "SWAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "SWComposeToolBar.h"
#import "SWHttpTool.h"
#import "SWSendStatusParameter.h"
#import "SWSendStatusTool.h"

#define SWToolBarAnimationDuration 0.2

@interface SWComposeViewController () <UITextViewDelegate,SWComposeToolBarDelegate,
               UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,weak) SWTextView *textView;
@property(nonatomic,weak) SWComposeToolBar *toolBar;
@end

@implementation SWComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view.
   
    [self setDecorare];
    [self setTextView];
    [self setComposeToolBar];
  
    
}

//  设置toolbar

-(void)setComposeToolBar
{
    SWComposeToolBar *toolBar = [[SWComposeToolBar alloc] init];
    CGFloat toolBarH = 44;
    CGFloat toolBarW = self.view.frame.size.width;
    CGFloat toolBarX = 0 ;
    CGFloat toolBarY = self.view.frame.size.height - toolBarH;
    toolBar.frame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    toolBar.delegate = self;
    self.toolBar = toolBar;
    [self.view insertSubview:toolBar atIndex:2];

}

-(void)composeToolBarDidClickButton:(SWComposeToolBar *)toolBar button:(UIButton *)button
{
    switch (button.tag) {
        case   SWComposeToolBarPictureButton :
            [self openPictureLibrary];
        
            break;
        case  SWComposeToolBarMentionButton :
            
            break;
        case SWComposeToolBarTrendbutton:
            
            break;
        case SWComposeToolBarEmotionButton:
            
            
            break;
        case SWComposeToolBarCameraButton:
            [self openCamera];
            
            
            break;
     default:
            break;
    }
   
}


/**
    打开相册
 */
-(void)openPictureLibrary
{
    UIImagePickerController *pic = [[UIImagePickerController alloc] init];
    pic.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pic.delegate = self;
    [self presentViewController:pic animated:YES completion:nil];
    
}

/** 
   打来照相机
 */
-(void)openCamera
{
    UIImagePickerController *pic = [[UIImagePickerController alloc] init];
    pic.sourceType = UIImagePickerControllerSourceTypeCamera;
    pic.delegate  = self;
    [self presentViewController:pic animated:YES completion:nil];
    
}

#pragma mark UIImagePickerController的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
      [picker dismissViewControllerAnimated:YES completion:nil];
       //  有多少张图片就执行多少次这句代码
      UIImage *image =  info[UIImagePickerControllerOriginalImage];
      [self.textView.photosView addImage:image];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//设置发微博界面的样子
-(void)setDecorare
{
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}



//添加textview
- (void)setTextView
{
   SWTextView *textView = [[SWTextView alloc] init];
    textView.font = [UIFont systemFontOfSize:15];
    textView.placeholder = @"写微博...";
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    //设置提示文字的字体大小
    textView.placeholderFont =[UIFont systemFontOfSize:15];
    textView.frame = self.view.bounds;
    self.textView = textView;
    [self.view addSubview:textView];
//   [self.textView  becomeFirstResponder];
    
// 监听textView的文字改变
   [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:textView]
    ;
    //监听键盘的出现
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    //监听键盘的消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
}



//监听键盘将要消失的时候
-(void)keyboardWillDisAppear:(NSNotification *)notification
{
    //获得来自键盘的通知
    NSDictionary *userInfo = [notification userInfo];
    //获得键盘完全弹出后的frame
//    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //获得剪片弹出所需要的时间
    CGFloat time = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //让toolbar的评平移动画的时间和高度于键盘一致
    [UIView animateWithDuration:time delay:0.4 options:UIViewAnimationOptionCurveLinear animations:^{
        self.toolBar.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}



//监听键盘将要出现的时候
-(void)keyboardWillAppear:(NSNotification *)notification
{
    //获得来自键盘的通知
    NSDictionary *userInfo = [notification userInfo];
    //获得键盘完全弹出后的frame
    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //获得剪片弹出所需要的时间
    CGFloat time = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]+SWToolBarAnimationDuration;
    //让toolbar的评平移动画的时间和高度于键盘一致
    [UIView animateWithDuration:time animations:^{
        self.toolBar.transform = CGAffineTransformMakeTranslation(0, -keyboardFrame.size.height);
    }];

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

  //当view显示完毕之后才创建键盘，不然会有延迟
-(void)viewDidAppear:(BOOL)animated
{
   [self.textView  becomeFirstResponder];
}

//通过通知中心监听textView中的文字的改变来改变右边按钮是否可以点击
- (void)textChange
{
    self.navigationItem.rightBarButtonItem.enabled = (self.textView.text.length != 0);

}

//控制器被销毁的时候要去除监听对象
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//取消编辑微博并退出
-(void)cancel
{
    [self  dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 发送微博
-(void)send
{
    if(self.textView.photosView.subviews.count){
        [self sendWithImage];
    }else {
        [self sendWithoutImage];
    }
        [self dismissViewControllerAnimated:YES completion:nil];

}



//发送没有图片的微博
-(void)sendWithoutImage
{
    // 2.封装请求参数
    SWSendStatusParameter *parameter=  [[SWSendStatusParameter alloc] init];
    parameter.status = self.textView.text;

    [SWSendStatusTool sendStatusWithParameter:parameter success:^(id json) {
          [MBProgressHUD showSuccess:@"发表成功"];
    } failure:^(NSError * error) {
        [MBProgressHUD showError:@"发表失败"];
    }];
}

//发送有图片的微博
-(void)sendWithImage
{

    // 1.封装请求参数
    SWSendStatusParameter *parameter = [[SWSendStatusParameter alloc] init];
    parameter.status = self.textView.text;
    
    NSMutableArray *formDataArray = [NSMutableArray array];
    NSArray *array = [self.textView.photosView totalImage];
    
    for (UIImage *image in array) {
        SWHttpToolParameter *toolParameter = [[SWHttpToolParameter alloc] init];
        toolParameter.data = UIImageJPEGRepresentation(image, 0.5);
        toolParameter.name = @"pic";
        toolParameter.fileName = @"";
        toolParameter.mimeType = @"image/jpeg";
        [formDataArray addObject:toolParameter];
    }
   [SWSendStatusTool sendPictureStatusWithParameter:parameter formData:formDataArray success:^(id json) {
       [MBProgressHUD showSuccess:@"发送成功"];
   } failure:^(NSError * error) {
       [MBProgressHUD showError:@"发送失败"];
   }];
    
}


@end
