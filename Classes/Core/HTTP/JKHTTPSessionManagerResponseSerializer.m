//
//  JKHTTPSessionManagerResponseSerializer.m
//  YoCar
//
//  Created by Futao on 15/9/29.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import "JKHTTPSessionManagerResponseSerializer.h"

NS_ASSUME_NONNULL_BEGIN
@interface JKHTTPSessionManagerResponseSerializer ()<NSSecureCoding, NSCopying>

@end
@implementation JKHTTPSessionManagerResponseSerializer

- (nullable NSDictionary *)decodeParametersByEncodedParameters:(nullable NSDictionary *)parameters
                                                error:(NSError * _Nullable __autoreleasing *)error;
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
    self.decryptEnabled = [[aDecoder decodeObjectOfClass:[NSNumber class] forKey:NSStringFromSelector(@selector(decryptEnabled))] boolValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeBool:self.decryptEnabled forKey:NSStringFromSelector(@selector(decryptEnabled))];
}

#pragma mark - NSCopying

- (id)copyWithZone:(nullable NSZone *)zone {
    JKHTTPSessionManagerResponseSerializer *requestSerializer = [[self class] allocWithZone:zone];
    requestSerializer.decryptEnabled = self.decryptEnabled;
    return requestSerializer;
}

@end
NS_ASSUME_NONNULL_END
