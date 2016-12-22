//
//  NSString+JKStringValidator.h
//  Pods
//
//  Created by Futao on 16/4/6.
//
//

#import <Foundation/Foundation.h>

@interface NSString (JKStringValidator)
+ (BOOL)isNilOrEmpty:(NSString*)input;
- (BOOL)isEmpty;
- (BOOL)isEmail;
- (BOOL)isPhoneNumber;
- (BOOL)isChineseName;
- (BOOL)isIdentityCardNumber;
- (BOOL)isInteger;
- (BOOL)isUInteger;
- (BOOL)isNumeric;
- (BOOL)isHttpURL;
- (BOOL)isMinLength:(NSUInteger)length;
- (BOOL)isMaxLength:(NSUInteger)length;
- (BOOL)isMinLength:(NSUInteger)min maxLength:(NSUInteger)max;
- (BOOL)isMatchRegex:(NSString*)regex;

- (NSError*)validateIPv4Address;
- (NSError*)validateIPv6Address;
- (NSError*)validateTTL;
@end
