//
//  NSString+JKStringValidator.m
//  Pods
//
//  Created by Futao on 16/4/6.
//
//

#import "NSString+JKStringValidator.h"

@implementation NSString (JKStringValidator)
+ (BOOL)isNilOrEmpty:(NSString*)input
{
    return [input isKindOfClass:[NSNull class]] || !input || [input isEmpty];
}
- (BOOL)isEmpty
{
    NSString* text = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return (!text.length);
}
- (BOOL)isEmail
{
    NSString* regex = @"[a-zA-Z0-9.\\-_]{2,32}@[a-zA-Z0-9.\\-_]{2,32}\\.[A-Za-z]{2,4}";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    return [regExPredicate evaluateWithObject:self];
}

- (BOOL)isPhoneNumber
{
    NSString* regex = @"^[1][34578]{1}[0-9]{9}$";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:self];
}
- (BOOL)isChineseName
{
    NSString* regex = @"[\\u4E00-\\u9FA5]{2,5}(?:·[\\u4E00-\\u9FA5]{2,5})*";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:self];
}
- (BOOL)isIdentityCardNumber
{
    NSString* regex = @"\\d{17}[\\d|x]|\\d{15}";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:self];
}

- (BOOL)isInteger {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setAllowsFloats:NO];
    if ([formatter numberFromString:self]) {
        return YES;
    } else {
        return NO;
    }
}
- (BOOL)isUInteger {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setAllowsFloats:NO];
    NSNumber *num = [formatter numberFromString:self];
    if (num && [num integerValue]>=0) {
        return YES;
    } else {
        return NO;
    }
}
- (BOOL)isNumeric {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setAllowsFloats:YES];
    if ([formatter numberFromString:self]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isHttpURL
{
    NSString* regex = @"^((https|http|file|ftp|rtsp|mms)?:\\/\\/)[^\\s]+";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    return [regExPredicate evaluateWithObject:[self lowercaseString]];
}

- (BOOL)isMinLength:(NSUInteger)length
{
    return (self.length >= length);
}

- (BOOL)isMaxLength:(NSUInteger)length
{
    return (self.length <= length);
}

- (BOOL)isMinLength:(NSUInteger)min maxLength:(NSUInteger)max
{
    return ([self isMinLength:min] && [self isMaxLength:max]);
}
- (BOOL)isMatchRegex:(NSString*)regex
{
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:self];
}
- (NSError*)validateIPv4Address
{
    NSArray* split = [self componentsSeparatedByString:@"."];
    if (split.count != 4) {
        return [NSError errorWithDomain:@""
                                   code:0
                               userInfo:@{ NSLocalizedDescriptionKey :
                                               NSLocalizedString(@"Exactly 4 octets must be provided.", nil) }];
    }

    for (NSString* octet_string in split) {
        int octet = [octet_string intValue];
        if (octet < 0 || octet > 255) {
            return [NSError errorWithDomain:@""
                                       code:0
                                   userInfo:@{ NSLocalizedDescriptionKey :
                                                   NSLocalizedString(@"Octets must be in the range of 0 to 255.", nil) }];
        }
    }

    int fourth_octet = [[split objectAtIndex:3] intValue];
    if (fourth_octet == 0 || fourth_octet == 255) {
        return [NSError errorWithDomain:@""
                                   code:0
                               userInfo:@{
                                          NSLocalizedDescriptionKey :
                                               NSLocalizedString(@"Fourth octet cannot be 0 or 255.", nil) }];
    }

    return nil;
}

- (NSError*)validateIPv6Address
{
    NSString* address = [self copy];
    NSArray* first_split = [self componentsSeparatedByString:@":"];

    // First, expand the address to its full notation
    // (Replace :: with :0000: * missing hextets
    if ([address containsString:@"::"]) {
        if (first_split.count >= 8) {
            return [NSError errorWithDomain:@""
                                       code:0
                                   userInfo:@{
                                              NSLocalizedDescriptionKey :
                                                   NSLocalizedString(@"No more than 8 hextets can be provided.", nil) }];
        }
        else {
            unsigned long omitted_octets = 8 - first_split.count;
            NSString* replacement_octets = @":0000";
            for (int i = 0; i < omitted_octets; i++) {
                replacement_octets = [replacement_octets stringByAppendingString:@":0000"];
            }
            replacement_octets = [replacement_octets stringByAppendingString:@":"];

            address = [address stringByReplacingOccurrencesOfString:@"::" withString:replacement_octets];
        }
    }

    NSArray* split = [address componentsSeparatedByString:@":"];
    if (split.count > 8) {
        return [NSError errorWithDomain:@""
                                   code:0
                               userInfo:@{
                                          NSLocalizedDescriptionKey :
                                               NSLocalizedString(@"No more than 8 hextets can be provided.", nil) }];
    }
    else if (split.count != 8) {
        return [NSError errorWithDomain:@""
                                   code:0
                               userInfo:@{
                                          NSLocalizedDescriptionKey :
                                               NSLocalizedString(@"Address is too short. Use '::' to omit 0000.", nil) }];
    }

    for (NSString* hextet_string in split) {
        NSPredicate* validHex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[0-9A-Fa-f]{0,4}"];
        if ([validHex evaluateWithObject:hextet_string]) {
        }
        else {
            return [NSError errorWithDomain:@""
                                       code:0
                                   userInfo:@{
                                              NSLocalizedDescriptionKey :
                                                   NSLocalizedString(@"Invalid hexedecimal value.", nil) }];
        }
    }

    return nil;
}

- (NSError*)validateTTL
{
    long long ttl = [self longLongValue];
    if (ttl < 0 || ttl > 2147483647) {
        return [NSError errorWithDomain:@""
                                   code:0
                               userInfo:@{
                                          NSLocalizedDescriptionKey :
                                               NSLocalizedString(@"TTL must be between 0 and 2147483647.", nil) }];
    }

    return nil;
}
@end
