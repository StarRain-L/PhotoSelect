//
//  UIImage+image.m
//  securitySystem
//
//  Created by lsf on 14-1-11.
//  Copyright (c) 2014年 securityYBTL. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
#pragma mark 根据屏幕尺寸返回全屏图片
+(UIImage *)fullScreenImageWithName:(NSString *)name{
    if (iPhone5) {
        name = [name filenameAppend:@"-568h"];
    }else if (iPhone6){
        name = [name filenameAppend:@"-667"];
    }else if (iPhone6p){
        name = [name filenameAppend:@"-736"];
    }
    
//    NSLog(@"--------%@",name);
     return [UIImage imageNamed:name];
}

+ (UIImage *)stretchImageWithName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
//图片缩放
+ (UIImage *)scaleToSize:(UIImage *)image {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    int iWidth = image.size.width;
    int iHeight = image.size.height;
    if (iWidth!=600) {
        iWidth = 600;
        iHeight = image.size.height*iWidth/image.size.width;
    }
    CGSize newsize= CGSizeMake(iWidth, iHeight);
    UIGraphicsBeginImageContext(newsize);
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0,newsize.width,newsize.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}
//获得某个范围内的屏幕图像
+(UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}
+ (UIImage *)resizableImage:(NSString *)name
{
    return [self resizableImage:name leftRatio:0.5 topRatio:0.5];
}

+ (UIImage *)resizableImage:(NSString *)name leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
    UIImage *image = [self imageNamed:name];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

@end
