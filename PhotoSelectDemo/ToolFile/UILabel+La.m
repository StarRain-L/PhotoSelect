//
//  UILabel+La.m
//  securitySystem
//
//  Created by Sifang on 14-1-25.
//  Copyright (c) 2014年 Youbitaike. All rights reserved.
//  

#import "UILabel+La.h"
#import "CLPILabel.h"
@implementation UILabel (La)

-(void)lableFrame:(CGRect)_frame FontName:(NSString *)_name FontSize:(CGFloat)_size title_Color:(UIColor *)_color BgColor:(UIColor *)_bgColor TextAlignment:(int)_alignment{
    [self setFrame:_frame];
    [self setTextColor:_color];
    self.backgroundColor = _bgColor;
    [self setFont:[UIFont fontWithName:_name size:_size*EWScaleFont]];
//    self.font = [UIFont fontWithName:_name size:_size];
    self.textAlignment = _alignment;  //设置文字位置
    //设置为YES时文本会自动缩小以适应文本窗口大小.默认是保持原来大小,而让长文本滚动设置No就相反
    self.adjustsFontSizeToFitWidth = NO;
    self.lineBreakMode = NSLineBreakByTruncatingTail;                   //显示不完全,出现....
}

-(void)lableAdaptive:(UILabel *)_lable{
        CGRect frame = _lable.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size =[_lable sizeThatFits:constraintSize];
        self.frame = CGRectMake(_lable.x, _lable.y, size.width, _lable.height);
}
#pragma mark - 自定义Label
+ (CLPILabel *)lableFrame:(CGRect)_frame Content:(NSString *)str FontName:(NSString *)_name FontSize:(CGFloat)_size title_Color:(UIColor *)_color BgColor:(UIColor *)_bgColor LinesSpac:(long)linesSpacing CharacterSpacing:(CGFloat)characterSpacing TextAlignment:(int)textAlignment
{
    CLPILabel *customLabel = [[CLPILabel alloc] initWithFrame:_frame];
    customLabel.numberOfLines = 0;
    //设置字体颜色
    customLabel.textColor = _color;
    //设置label的背景颜色
    customLabel.backgroundColor = _bgColor;
    //设置label的行间距 默认4.0
    [customLabel setLinesSpacing:linesSpacing];
    //设置label的字间距 默认 1.5
    [customLabel setCharacterSpacing:characterSpacing];
    //设置label的段间距 默认 10.0
    [customLabel setParagraphSpacing:0];
    //使用自定义字体
    customLabel.font = EWFont(_size);
    //设置label显示内容
    customLabel.text = str;
    //设置文字位置
    customLabel.textAlignment = textAlignment;
    //根据字符串长度和Label显示的宽度计算出contentLab的高
    int labelHeight = [customLabel getAttributedStringHeightWidthValue:_frame.size.width];
    customLabel.height = labelHeight;
    return customLabel;
    
}
@end
