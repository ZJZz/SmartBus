//
//  NSString+URLEncoder.m
//  SmartBus3
//
//  Created by Tony Zhao on 13-8-12.
//  Copyright (c) 2013年 Tony Zhao. All rights reserved.
//

#import "NSString+URLEncoder.h"

@implementation NSString (URLEncoder)

- (NSString *)URLEncodedString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8));
    return encodedString;
}

@end
