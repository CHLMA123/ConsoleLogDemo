//
//  ViewController.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "AnimaitonModel.h"
@interface ViewController ()

@end

@implementation ViewController
+ (void)load{
    NSLog(@"%s", __FUNCTION__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s", __FUNCTION__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DDLogWarn (@"### DDLogWarn");
    DDLogError(@"### DDLogError");
    DDLogInfo (@"... DDLogInfo");
    DDLogVerbose(@"... DDLogVerbose");
    AnimaitonModel *m1 = [AnimaitonModel new];
    m1.age = @"100";
    m1.name = @"xiaohei";
    AnimaitonModel2 *m2 = [AnimaitonModel2 new];
    m2.name1 = @"xiaoheissss";
    m2.age1 = @"1000";
    m1.modelTest = m2;
    
    NSArray <AnimaitonModel *>*arr1 = @[m1];
    DDLogInfo(@"arr1 = %@",arr1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
