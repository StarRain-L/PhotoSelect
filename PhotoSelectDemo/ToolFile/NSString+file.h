//
//  NSString+file.h
//  securitySystem
//
//  Created by lsf on 14-1-11.
//  Copyright (c) 2014年 securityYBTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (file)
- (NSString *)filenameAppend:(NSString *)append;
- (BOOL)containsString:(NSString *)aString;
+ (NSString*)telephoneWithReformat :(NSString *)_str;
- (BOOL) matchRegex: (NSString*)regex;
- (BOOL) isPhoneNumber;
/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;
/**
 *  数字每三个分隔,并且添加人民币符号
 */
+(NSString *)ChangeNumberFormat:(NSNumber *)num;
/**
 *  判断手机号输入的是否正确
 */
- (BOOL)checkPhoneNum;
@end
