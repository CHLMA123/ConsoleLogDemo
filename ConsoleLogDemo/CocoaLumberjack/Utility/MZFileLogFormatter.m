//
//  MZFileLogFormatter.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "MZFileLogFormatter.h"

@implementation MZFileLogFormatter

#pragma mark - DDLogFormatter
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage{
    
    NSString *logLevel = nil;
    switch (logMessage.flag) {
        case DDLogFlagError:    logLevel = @"ERROR";      break;
        case DDLogFlagWarning:  logLevel = @"WARNING";    break;
        case DDLogFlagInfo:     logLevel = @"INFO";       break;
        case DDLogFlagDebug:    logLevel = @"DEBUG";      break;
        case DDLogFlagVerbose:  logLevel = @"VERBOSE";    break;
            
        default:
            logLevel = @"UNKOWN";
            break;
    }
    
    NSString *temp = [NSString stringWithFormat:@"[%@] [%@] %@[line:%ld]\n%@", [self stringFromDate:logMessage.timestamp], logLevel, logMessage.function, logMessage.line, logMessage.message];
    return temp;
}

- (NSString *)stringFromDate:(NSDate *)date{
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss SSS"];
    });
    return [formatter stringFromDate:date];
}

@end
