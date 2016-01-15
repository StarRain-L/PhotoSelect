//
//  UIBarButtonItem+create.m
//  weibo
//
//  Created by apple on 13-8-29.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UIBarButtonItem+Create.h"

@implementation UIBarButtonItem (Create)
+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置所有状态下的背景图片
    [btn setAllStateBg:icon];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    CGSize btnSize = CGSizeMake(30, 40);
    btn.bounds = (CGRect){CGPointZero, btnSize};
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return backItem;
}

+ (UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg title:(NSString *)title size:(CGSize)size target:(id)target action:(SEL)action
{
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 按钮文字
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    // 按钮背景
    [btn setAllStateBg:bg];
    // 按钮边框
    btn.bounds= (CGRect){CGPointZero, size};
    // 监听器
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
