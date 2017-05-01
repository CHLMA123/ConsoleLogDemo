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
