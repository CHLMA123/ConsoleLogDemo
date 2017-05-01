//
//  Header.h
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <UIKit/UIKit.h>
#import "CocoaLumberjack.h"

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//透明背景色
#define CLEARCOLOR [UIColor clearColor]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
static const DDLogLevel ddLogLevel = DDLogLevelOff;
#endif

//#define MZDDLogInfoColor    RGBCOLOR(100.f, 100.f, 100.f)
//#define MZDDLogVerboseColor RGBCOLOR(60.f, 200.f, 20.f)
//#define MZDDLogWarnColor    RGBCOLOR(255.f, 120.f, 0.f)
//#define MZDDLogErrorColor   RGBCOLOR(255.f, 55.f, 50.f)


#endif /* Header_h */
