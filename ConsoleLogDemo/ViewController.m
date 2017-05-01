//
//  ViewController.m
//  ConsoleLogDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DDLogWarn (@"### DDLogWarn");
    DDLogError(@"### DDLogError");
    DDLogInfo (@"... DDLogInfo");
    DDLogVerbose(@"... DDLogVerbose");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
