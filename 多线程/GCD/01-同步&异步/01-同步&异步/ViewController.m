//
//  ViewController.m
//  01-同步&异步
//
//  Created by Heaven on 16/1/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1. 同步执行任务
    //[self gcdSync];
    
    // 2. 异步执行任务
    //[self gcdAsync];
    
    // 3. 线程间通讯
    [self gcd];
}

// 同步执行任务
- (void)gcdSync {
    
    // 1. 全局队列 － 苹果为了方便程序员使用提供 本质是一个并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2. 任务 block - 快速创建block inlineBlock
    //    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
    //        <#statements#>
    //    };
    
    void (^task)() = ^ {
        NSLog(@"%@", [NSThread currentThread]);
    };
    
    // 3. 同步执行指定函数
    dispatch_sync(queue, task);
    
    NSLog(@" over ");
}

// 异步执行任务 - 精简写法
- (void)gcdAsync {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@" over ");
}

// 线程间通讯 同步异步
- (void)gcd {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"正在加载------%@", [NSThread currentThread]);
        
        // 主线程 同步执行 更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI------%@", [NSThread currentThread]);
        });
        
        NSLog(@"come here");
    });
    
    NSLog(@" over ");
}

@end