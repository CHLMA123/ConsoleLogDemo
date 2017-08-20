//
//  NSObject+Log.h
//  ConsoleLogDemo
//
//  Created by CHLMA2015 on 2017/8/20.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Log)

@end
@interface NSArray (Log)

@end

@interface NSDictionary (Log)

@end

/*
 打印NSDictionary、NSArray时所调用的3个方法:
 
 - (NSString *)description ;
 - (NSString *)descriptionWithLocale:(nullable id)locale;
 - (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level;
 
 作用与区别
 
 （1）、三个方法的作用：将NSDictionary、NSArray对象转化为字符串。
 （2）、区别
 
     - (NSString *)description ;
     在控制台使用po 命令时，输出的文字就是这个方法返回的
     
     - (NSString *)descriptionWithLocale:(nullable id)locale;
     用NSLog打印的文字是这个方法返回的
 
     - (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level; 这个方法和第二个方法相比，多了个 level 参数，代表所打印的文字向右平移 level 个字符（我用的"\t"）。
 */
