//
//  JKHttpObject.m
//  YoCar
//
//  Created by Futao on 15/9/30.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import "JKHTTPObject.h"
NS_ASSUME_NONNULL_BEGIN

@implementation JKHTTPObject

- (instancetype)initWithError:(NSError *)error {
    self = [super init];
    if (self) {
        self.code = error.code;
        self.message = error.localizedDescription;
    }
    return self;
}
- (instancetype)initWithResponseData:(nullable id)responseData {
    self = [super init];
    if (self) {
        if ([responseData isKindOfClass:[NSDictionary class]]) {
            self.code = [[(NSDictionary*)responseData objectForKey:@"code"] integerValue];
            self.message = [(NSDictionary*)responseData objectForKey:@"message"];
        }
        self.originalData = responseData;
    }
    return self;
}
- (BOOL)isValid {
    if (self.code == 200) {
        return YES;
    }
    return NO;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self.originalData description]];
}
@end
NS_ASSUME_NONNULL_END
