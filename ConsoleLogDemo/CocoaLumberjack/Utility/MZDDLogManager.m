//
//  MZDDLogManager.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "MZDDLogManager.h"
#import "Header.h"

#import "DDFileLogger.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "MZLogFileManager.h"
#import "MZFileLogFormatter.h"
#import "MZConsoleLogFormatter.h"

@implementation MZDDLogManager

+ (instancetype)sharedInstance{

    static MZDDLogManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MZDDLogManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]){
        DDLogFileManagerDefault *documentFileManager = [[MZLogFileManager alloc] init];
        MZFileLogFormatter *logFormatter = [[MZFileLogFormatter alloc] init];
        MZConsoleLogFormatter *consoleFormatter = [[MZConsoleLogFormatter alloc] init];
        
        DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:documentFileManager];
        fileLogger.maximumFileSize = 10 * 1024 * 1024;
        fileLogger.rollingFrequency = 24 * 60 * 60;
        [[fileLogger logFileManager] setMaximumNumberOfLogFiles:7];
        [fileLogger setLogFormatter:logFormatter];
        
        [DDLog addLogger:fileLogger];
        [DDLog addLogger:[DDASLLogger sharedInstance]];
        
        //设置Xcode颜色
        setenv("XcodeColors", "YES", 0);
        [[DDTTYLogger sharedInstance] setLogFormatter:consoleFormatter];
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    }
    return self;
}

- (void)setupCocoaLumberjack{
    
    NSDictionary *bundleInfoDict = [NSBundle mainBundle].infoDictionary;
    
    NSString *appIdentifier = bundleInfoDict[@"CFBundleIdentifier"];
    NSString *appName = bundleInfoDict[@"CFBundleName"];
    NSString *appVersion = bundleInfoDict[@"CFBundleShortVersionString"];
    NSString *appBuild = bundleInfoDict[@"CFBundleVersion"];
    
    NSDictionary *thisBundleInfoDict = @{@"CFBundleIdentifier" : [self safeString:appIdentifier],
                                         @"CFBundleName"       : [self safeString:appName],
                                         @"CFBundleShortVersionString"  : [self safeString:appVersion],
                                         @"CFBundleVersion"    : [self safeString:appBuild],
                                         };
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    NSString *name = [UIDevice currentDevice].name;
    NSString *model = [UIDevice currentDevice].model;
    
    NSDictionary *thisDeviceInfoDict = @{@"systemVersion"   : [self safeString:systemVersion],
                                         @"name"            : [self safeString:name],
                                         @"model"           : [self safeString:model],
                                         };
    
    DDLogInfo(@"\n\n\nthisBundleInfoDict = %@\nthisDeviceInfoDict = %@", thisBundleInfoDict, thisDeviceInfoDict);
}

- (NSString *)safeString:(NSString *)str{
    if (str && str.length > 0){
        return str;
    }else{
        return @"";
    }
}

@end
