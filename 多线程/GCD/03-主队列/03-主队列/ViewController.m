//
//  ViewController.m
//  03-主队列
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

    NSLog(@" start ");
    
    // 1. 主队列－同步执行
    [self mainQueue_sync];
    
    // 2. 主队列－异步执行
    //[self mainQueue_async];
    
    // 3. 主队列－同步执行 死锁解决方案
    //[self mainQueue_Sync];
    
    NSLog(@"再次睡眠");
    
    [NSThread sleepForTimeInterval:2.0];
    
    NSLog(@" over ");
}

// 主队列同步
- (void)mainQueue_sync {

    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"同步执行");
    
    // 主线程&主队列相互等待，造成死锁
    dispatch_sync(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    // 线程睡眠
    NSLog(@"睡眠");
    
    [NSThread sleepForTimeInterval:2.0];
    
    NSLog(@"come here");
}

// 主队列异步
- (void)mainQueue_async {

    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"异步执行");
    
    // 异步任务 － 主线程休眠也是在工作
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    // 线程睡眠
    NSLog(@"睡眠");
    
    [NSThread sleepForTimeInterval:2.0];
    
    NSLog(@"come here");
}

// 主队列同步 -- 死锁解决方案
- (void)mainQueue_Sync {

    dispatch_queue_t queue = dispatch_get_main_queue();
    
    void (^task)() = ^ {
        dispatch_sync(queue, ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
        NSLog(@" come here ");
    };
    
    // 全局队列本质是一个并发队列，此处用并发队列＋异步执行之后会开新的线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        task();
    });
}

@end
