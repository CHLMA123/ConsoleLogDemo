//
//  MZLogFileManager.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "MZLogFileManager.h"

@implementation MZLogFileManager

- (NSString *)newLogFileName{
    
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    NSString *appVersion = info[@"CFBundleShortVersionString"];
    NSString *appBuild = info[@"CFBundleVersion"];
    
    NSString *fileName = [NSString stringWithFormat:@"%@ V%@(%@).txt", [self stringFromDate:[NSDate date]], appVersion, appBuild];
    return fileName;
}

- (BOOL)isLogFile:(NSString *)fileName{
    return YES;
}

#pragma mark - Private Methods
- (NSString *)stringFromDate:(NSDate *)date{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
    });
    return [formatter stringFromDate:date];
}

@end
