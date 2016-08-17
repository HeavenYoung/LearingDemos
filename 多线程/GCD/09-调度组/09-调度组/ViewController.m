//
//  ViewController.m
//  09-调度组
//
//  Created by Heaven on 16/1/6.
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
    //[self group1];
    
    [self group2];
}

// 调度组-在一组异步代码执行完毕后，统一获得通知
- (void)group1 {
    // 调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 添加异步
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download A %@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:0.5];
        NSLog(@"download B %@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"download C %@", [NSThread currentThread]);
    });

    // 调度组通知 ,应该在主线程完成
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"download complete -- %@", [NSThread currentThread]);
    });
    
    NSLog(@" come here ");
}

- (void)group2 {

    // 调度组
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    // 进入组,后续的block由group来监听
    dispatch_group_enter(group);
    dispatch_async(queue, ^{

        // 模仿耗时操作
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download A -- %@", [NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 模仿耗时操作
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download B -- %@", [NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
//    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@" download complete ");
//    });
    
    // 阻塞式等待调度组中所有任务执行完毕, 如果组内有内容，就一直等待
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    // 这两种写法好像就没有什么用，跟普通的异步执行没什么区别
    //dispatch_group_wait(group, DISPATCH_TIME_NOW);
    //dispatch_group_wait(group, DISPATCH_TIMER_STRICT);
    
    // 判断异步
    NSLog(@" download complete - %@", [NSThread currentThread]);
}

@end
