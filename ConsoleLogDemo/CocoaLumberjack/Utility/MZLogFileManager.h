//
//  MZLogFileManager.h
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "DDFileLogger.h"

@interface MZLogFileManager : DDLogFileManagerDefault

- (NSString *)newLogFileName;

- (BOOL)isLogFile:(NSString *)fileName;

@end
