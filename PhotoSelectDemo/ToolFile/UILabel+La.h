//
//  UILabel+La.h
//  securitySystem
//
//  Created by Sifang on 14-1-25.
//  Copyright (c) 2014年 Youbitaike. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLPILabel;
@interface UILabel (La)

-(void)lableFrame:(CGRect)_frame FontName:(NSString *)_name FontSize:(CGFloat)_size title_Color:(UIColor *)_color BgColor:(UIColor *)_bgColor TextAlignment:(int)_alignment;
-(void)lableAdaptive:(UILabel *)_lable;
+ (CLPILabel *)lableFrame:(CGRect)_frame Content:(NSString *)str FontName:(NSString *)_name FontSize:(CGFloat)_size title_Color:(UIColor *)_color BgColor:(UIColor *)_bgColor LinesSpac:(long)linesSpacing CharacterSpacing:(CGFloat)characterSpacing TextAlignment:(int)textAlignment;
@end
