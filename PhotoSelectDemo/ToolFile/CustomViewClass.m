//
//  CustomViewClass.m
//  MerchantApp
//
//  Created by YYL on 15/10/27.
//  Copyright © 2015年 easywed. All rights reserved.
//

#import "CustomViewClass.h"

@implementation CustomViewClass


+ (UIViewController*)getMyVC:(UIView*)myView{
    UIView *view = [myView superview];
    for (UIView* next = view; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



@end
