//
//  NSString+file.m
//  securitySystem
//
//  Created by lsf on 14-1-11.
//  Copyright (c) 2014年 securityYBTL. All rights reserved.
//

#import "NSString+file.h"
#import <CoreLocation/CoreLocation.h>

@implementation NSString (file)

- (NSString *)filenameAppend:(NSString *)append
{
    // 1.获取没有拓展名的文件名
    NSString *filename = [self stringByDeletingPathExtension];
    
    // 2.拼接append
    filename = [filename stringByAppendingString:append];
    
    // 3.拼接拓展名
    NSString *extension = [self pathExtension];
    
    // 4.生成新的文件名
    return [filename stringByAppendingPathExtension:extension];
}

- (BOOL)containsString:(NSString *)aString
{
	NSRange range = [[self lowercaseString] rangeOfString:[aString lowercaseString]];
	return range.location != NSNotFound;
}

+ (NSString*)telephoneWithReformat :(NSString *)_str
{
   
    if ([_str containsString:@" "])
    {
        _str = [_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    if ([_str containsString:@"-"])
    {
        _str = [_str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    if ([_str containsString:@" "])
    {
        _str = [_str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    if ([_str containsString:@"("])
    {
        _str = [_str stringByReplacingOccurrencesOfString:@"(" withString:@""];
    }
    
    if ([_str containsString:@")"])
    {
        _str = [_str stringByReplacingOccurrencesOfString:@")" withString:@""];
    }
    
    return _str;
}
- (BOOL)isPhoneNumber{
    //    return [self matchRegex:@"^1[0-9]{10}$"];
    return [self matchRegex:@"^1(3|4|5|7|8)\\d{9}$"];
    //    return [self matchRegex:@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"];
}
- (BOOL) matchRegex: (NSString*)regex {
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [regexTest evaluateWithObject:self];
}
/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir
{
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
}

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir
{
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]];
}

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir
{
    return [self appendDir:NSTemporaryDirectory()];
}

- (NSString *)appendDir:(NSString *)dir // docpath
{
    return [dir stringByAppendingPathComponent:self];
}
/**
 *  数字每三个分隔,并且添加人民币符号
 */
+(NSString *)ChangeNumberFormat:(NSNumber *)num{
    
    if (!num) {
        return @"0";
    }
    NSString *changeNum = [NSString stringWithFormat:@"%@",num];
    NSMutableString *string = [NSMutableString stringWithString:changeNum];
    NSMutableString *newstring = [NSMutableString string];
    if ([changeNum rangeOfString:@"-"].location == NSNotFound){
        if ([changeNum rangeOfString:@"."].location == NSNotFound) {
            int count = 0;
            long long int a = changeNum.longLongValue;
            while (a != 0)
            {
                count++;
                a /= 10;
            }
            while (count > 3) {
                count -= 3;
                NSRange rang = NSMakeRange(string.length - 3, 3);
                NSString *str = [string substringWithRange:rang];
                [newstring insertString:str atIndex:0];
                [newstring insertString:@"," atIndex:0];
                [string deleteCharactersInRange:rang];
            }
            
        }
        [string insertString:@"￥" atIndex:0];
    }
     [newstring insertString:string atIndex:0];
    return newstring;
}
- (BOOL)checkPhoneNum{
    //手机号以13， 15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0,6,7,8])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

@end
