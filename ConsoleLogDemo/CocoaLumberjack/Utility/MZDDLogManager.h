//
//  MZDDLogManager.h
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MZDDLogManager : NSObject

+ (instancetype)sharedInstance;

- (void)setupCocoaLumberjack;

@end

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
