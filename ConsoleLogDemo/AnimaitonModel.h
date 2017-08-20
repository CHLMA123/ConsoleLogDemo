//
//  AnimaitonModel.h
//  ConsoleLogDemo
//
//  Created by CHLMA2015 on 2017/8/20.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AnimaitonModel2;

@interface AnimaitonModel : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *age;
@property(nonatomic, strong)AnimaitonModel2 *modelTest;
@end

@interface AnimaitonModel2 : NSObject
@property(nonatomic, strong)NSString *name1;
@property(nonatomic, strong)NSString *age1;

@end


