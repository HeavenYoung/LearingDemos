//
//  ViewController.m
//  02-串行&并发队列
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

/**
 阶段性小结
 
 - 开不开线程，由执行任务的函数决定
 * 同步不开
 * 异步开
 
 - (异步)开几条线程，由队列决定
 * 串行队列，最多开一条
 * 并发队列，由底层线程池决定
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 1. 串行队列 同步执行
//    [self serial_sync];
    
    // 2. 串行队列 异步执行
//    [self serial_async];
    
    // 3. 并发队列 同步执行
//    [self concurrent_sync];
    
    // 4. 并发队列 异步执行
    [self concurrent_async];
}

- (void)serial_sync {

    // 1. 串行队列
    dispatch_queue_t queue = dispatch_queue_create("serial_sync", DISPATCH_QUEUE_SERIAL);
    
    // 2. 添加任务，同步执行
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@------%d", [NSThread currentThread], i);
        });
        NSLog(@"---- %d ----", i);
    }
    NSLog(@"come here");
}

- (void)serial_async {

    // 1. 串行队列
    dispatch_queue_t queue = dispatch_queue_create("serial_sync", DISPATCH_QUEUE_SERIAL);
    
    // 2. 添加任务，异步执行
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@------%d", [NSThread currentThread], i);
        });
        NSLog(@"---- %d ----", i);
    }
    NSLog(@"come here");
}

- (void)concurrent_sync {

    // 1. 并发队列
    dispatch_queue_t queue = dispatch_queue_create("serial_sync", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 添加任务，同步执行
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@------%d", [NSThread currentThread], i);
        });
        NSLog(@"---- %d ----", i);
    }
    NSLog(@"come here");
}

- (void)concurrent_async {

    // 1. 并发队列
    dispatch_queue_t queue = dispatch_queue_create("serial_sync", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 添加任务，异步执行
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@------%d", [NSThread currentThread], i);
        });
        NSLog(@"---- %d ----", i);
    }
    NSLog(@"come here");
}

@end
