//
//  JKHTTPSessionManagerRequestSerializer.m
//  YoCar
//
//  Created by Futao on 15/9/29.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import "JKHTTPSessionManagerRequestSerializer.h"

NS_ASSUME_NONNULL_BEGIN
@interface JKHTTPSessionManagerRequestSerializer() <NSSecureCoding, NSCopying>

@end
@implementation JKHTTPSessionManagerRequestSerializer

- (nullable NSDictionary *)encodeParametersByDecodedParameters:(nullable NSDictionary *)parameters
                                                error:( NSError * _Nullable __autoreleasing *)error;
{
    NSDictionary *parametersNew = parameters;
    return parametersNew;
}

#pragma mark - NSSecureCoding
+ (BOOL)supportsSecureCoding {
    return YES;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.encryptEnabled = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(encryptEnabled))] boolValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeBool:self.encryptEnabled forKey:NSStringFromSelector(@selector(encryptEnabled))];
}

#pragma mark - NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
    JKHTTPSessionManagerRequestSerializer *requestSerializer = [[self class] allocWithZone:zone];
    requestSerializer.encryptEnabled = self.encryptEnabled;
    return requestSerializer;
}

@end
NS_ASSUME_NONNULL_END
