//
//  UIButton+Btn.m
//  WeddingInvitation
//
//  Created by sifang on 14-10-29.
//  Copyright (c) 2014年 easywed. All rights reserved.
//

#import "UIButton+Btn.h"
#import <objc/runtime.h>

static void* UIButtonKey = @"UIButtonKey";
@implementation UIButton (Btn)
- (CGSize)setAllStateBg:(NSString *)icon
{
    UIImage *normal = [UIImage stretchImageWithName:icon];
    UIImage *highlighted = [UIImage stretchImageWithName:[icon filenameAppend:@"_highlighted"]];
    [self setImage:normal forState:UIControlStateNormal];
    [self setImage:highlighted forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    return normal.size;
}
-(void)nomalButton:(CGRect)_frame Bg_Normal:(NSString *)icon_Normal Bg_High:(NSString *)icon_High Title:(NSString *)_title Color_Nromel:(UIColor *)_color_Nromel Color_Hight:(UIColor *)_color_Hight{
    self.frame = _frame;
    UIImage *normal = [UIImage imageNamed:icon_Normal];
    [self setBackgroundImage:normal forState:UIControlStateNormal];
    UIImage *hight = [UIImage imageNamed:icon_High];
    [self setBackgroundImage:hight forState:UIControlStateHighlighted];
    [self  setTitle:_title forState:UIControlStateNormal];
    [self  setTitleColor:_color_Nromel forState:UIControlStateNormal];
    [self  setTitleColor:_color_Hight forState:UIControlStateHighlighted];
}

- (void)nomalButton:(CGRect)_frame Bg:(NSString *)icon_Normal Title:(NSString *)_title Color:(UIColor *)_color{
    self.frame = _frame;
    UIImage *normal = [UIImage imageNamed:icon_Normal];
    [self setBackgroundImage:normal forState:UIControlStateNormal];
    [self  setTitle:_title forState:UIControlStateNormal];
    [self  setTitleColor:_color forState:UIControlStateNormal];
}

-(void)nomalButton:(CGRect)_frame Title:(NSString *)_title Color_Nromel:(UIColor *)_color_Nromel Color_Select:(UIColor *)_color_Select TextFont:(int)_font TextAlignment:(int)_alignment {
    self.frame = _frame;
    [self  setTitle:_title forState:UIControlStateNormal];
    [self  setTitleColor:_color_Nromel forState:UIControlStateNormal];
    [self  setTitleColor:_color_Select forState:UIControlStateSelected];
    self.titleLabel.textAlignment = _alignment;
    self.titleLabel.font = MAFont(_font);

}
+(UIButton *)createButtonWithFrame:(CGRect)frame
                           andType:(UIButtonType)type
                          andTitle:(NSString *)title
                     andTitleColor:(UIColor *)titleColor
                          andImage:(UIImage *)image
                 andHighlitedImage:(UIImage *)Highlitedimage
                andBackgroundImage:(UIImage *)backgroundImage
       andHighlitedBackgroundImage:(UIImage *)highlitedBackGroundImage
                  andCallBackBlock:(UIButtonClickCallBackBlock)buttonClickCallBackBlock

{
    UIButton * btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:Highlitedimage forState:UIControlStateHighlighted];
    [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [btn setBackgroundImage:highlitedBackGroundImage forState:UIControlStateHighlighted];
    
    [btn addTarget:nil action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.buttonClickCallBackBlock = buttonClickCallBackBlock;
    
    return btn;
}
-(void)setButtonClickCallBackBlock:(UIButtonClickCallBackBlock)buttonClickCallBackBlock
{
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIButtonKey, buttonClickCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}
- (UIButtonClickCallBackBlock)buttonClickCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIButtonKey);
}
-(void)clickAction:(UIButton*)btn
{
    if (btn.buttonClickCallBackBlock)
    {
        btn.buttonClickCallBackBlock(btn.tag);
    }
}

@end
