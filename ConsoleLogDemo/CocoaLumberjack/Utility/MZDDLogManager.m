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
/**
 Notification Once
 http://blog.sunnyxx.com/2015/03/09/notification-once/
 
 解释：
 
 + load方法在足够早的时间点被调用
 block 版本的通知注册会产生一个__NSObserver *对象用来给外部 remove 观察者
 block 对 observer 对象的捕获早于函数的返回，所以若不加__block，会捕获到 nil
 在 block 执行结束时移除 observer，无需其他清理工作
 这样，在模块内部就完成了在程序启动点代码的挂载
 
 值得注意的是，通知是在- application:didFinishLaunchingWithOptions:调用完成后才发送的。
 */
+ (void)load {
    NSLog(@"%s", __FUNCTION__);
    __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [[MZDDLogManager sharedInstance] setupCocoaLumberjack];//打印信息初始化
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
}

+ (instancetype)sharedInstance{
    NSLog(@"%s", __FUNCTION__);
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
