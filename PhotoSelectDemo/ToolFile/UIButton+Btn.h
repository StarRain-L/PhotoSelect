//
//  UIButton+Btn.h
//  WeddingInvitation
//
//  Created by sifang on 14-10-29.
//  Copyright (c) 2014年 easywed. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UIButtonClickCallBackBlock)(NSInteger tag);
@interface UIButton (Btn)
@property (nonatomic, copy) UIButtonClickCallBackBlock buttonClickCallBackBlock;
// 设置按钮所有状态下的背景
- (CGSize)setAllStateBg:(NSString *)icon;
-(void)nomalButton:(CGRect)_frame Bg_Normal:(NSString *)icon_Normal Bg_High:(NSString *)icon_High Title:(NSString *)_title Color_Nromel:(UIColor *)_color_Nromel Color_Hight:(UIColor *)_color_Hight;
- (void)nomalButton:(CGRect)_frame Bg:(NSString *)icon_Normal Title:(NSString *)_title Color:(UIColor *)_color;

-(void)nomalButton:(CGRect)_frame Title:(NSString *)_title Color_Nromel:(UIColor *)_color_Nromel Color_Select:(UIColor *)_color_Select TextFont:(int)_font TextAlignment:(int)_alignment ;

+(UIButton *)createButtonWithFrame:(CGRect)frame
                           andType:(UIButtonType)type
                          andTitle:(NSString *)title
                     andTitleColor:(UIColor *)titleColor
                          andImage:(UIImage *)image
                 andHighlitedImage:(UIImage *)Highlitedimage
                andBackgroundImage:(UIImage *)backgroundImage
       andHighlitedBackgroundImage:(UIImage *)highlitedBackGroundImage
                  andCallBackBlock:(UIButtonClickCallBackBlock)buttonClickCallBackBlock;
@end