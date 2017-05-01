//
//  AppDelegate.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "AppDelegate.h"
#import "MZDDLogManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /**
     * DDLog是强制性的，其余的都是可选的，这取决于你打算如何使用这个框架。例如，如果你不打算纪录到一个文件，你可以跳过DDFileLogger，或者你想跳过ASL以便更快的文件记录，你可以跳过DDASLLoger。
         1.DDLog        （整个框架的基础，基础类，必须引入的。）
         2.DDASLLogger  （支持将调试语句写入到苹果的日志中。一般正对Mac开发。可选。）
         3.DDTTYLoyger  （支持将调试语句写入Xcode控制台。可选。）
         4.DDFIleLoger  （支持将调试语句写入到文件系统。可选。）
     * DDLog的输出级别默认提供以下若干种：
         DDLogError ：定义输出错误文本
         DDLogWarn  ：定义输出警告文本
         DDLogInfo  ：定义输出信息文本
         DDLogDebug ：定义输出调试文本
         DDLogVerbose：定义输出详细文本
     * 提供的日志级别为：
         LOG_LEVEL_ERROR：只显示错误日志。
         LOG_LEVEL_WARN ：包括：LOG_LEVEL_ERROR
         LOG_LEVEL_INFO ：包括：LOG_LEVEL_WARN
         LOG_LEVEL_DEBUG：包括：LOG_LEVEL_INFO
         LOG_LEVEL_VERBOSE：包括：LOG_LEVEL_DEBUG
         LOG_LEVEL_OFF  ：关闭日志
     */
    [[MZDDLogManager sharedInstance] setupCocoaLumberjack];//打印信息初始化
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ConsoleLogDemo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
