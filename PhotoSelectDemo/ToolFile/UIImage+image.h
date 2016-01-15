//
//  UIImage+image.h
//  securitySystem
//
//  Created by lsf on 14-1-11.
//  Copyright (c) 2014年 securityYBTL. All rights reserved.
// 图片适配

#import <UIKit/UIKit.h>

@interface UIImage (image)
+(UIImage *)fullScreenImageWithName:(NSString *)name;
// 返回一张已经经过拉伸处理的图片
+ (UIImage *)stretchImageWithName:(NSString *)name;
//图片压缩
+ (UIImage *)scaleToSize:(UIImage *)image;
//获得某个范围内的屏幕图像
+(UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r;


/**
 *  返回一张能自由拉伸的图片
 *
 *  @param name 图片名
 */
+ (instancetype)resizableImage:(NSString *)name;

/**
 *  返回一张能自由拉伸的图片
 *
 *  @param name      图片名
 *  @param leftRatio 左边有多少比例不需要拉伸(0~1)
 *  @param topRatio  顶部有多少比例不需要拉伸(0~1)
 */
+ (instancetype)resizableImage:(NSString *)name leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio;

@end
