//
//  ViewController.m
//  04-线程状态
//
//  Created by Heaven on 16/1/7.
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
    NSLog(@" come here ");
    
    // 不要在主线程使用
    //[NSThread exit];
    //NSLog(@"能到这里吗？");
    
    // 新建
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadDemo) object:nil];
    
    // 就绪 --> 进入 CPU 可调度线程池
    [thread start];
    
    
    // 休眠一会
    [NSThread sleepForTimeInterval:1.2];

    // cancel
    [thread cancel];
}

- (void)threadRun {

    // 模仿阻塞
    NSLog(@"睡会");
    [NSThread sleepForTimeInterval:1.0];
    
    for (int i = 0; i < 20; ++i) {
        if (i == 9) {
            
            NSLog(@"再睡");
            // 在程序执行过程中，为了等待某一个状态，可能仍然需要休眠
            // 睡到指定日期
            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        }
        
        NSLog(@"%@ %d", [NSThread currentThread], i);
        
        CGMutablePathRef path = CGPathCreateMutable();
        
        // 当满足某一个条件，直接死亡
        if (i == 14) {
            
            // 一旦终止线程，后续所有代码都不会执行
            // Invoking this method should be avoided as it does not give your thread a chance to clean up any resources it allocated during its execution.
            // 调用此方法应该注意需要释放之前创建的资源，主要要考虑 C 语言框架的对象的释放
            CGPathRelease(path);
            
            // 终止当前所在的线程！
            [NSThread exit];
        }
    }
    
    NSLog(@"over");
}

// 如果要在外部取消线程，只需要在关键节点位置，增加判断！
// 否则，线程不会终止！
- (void)threadDemo {
    
    // 1. 取出当前线程
    NSThread *thread = [NSThread currentThread];
    
    // 判断线程是否被取消
    if (thread.isCancelled) {
        NSLog(@"1. --- 88");
        return;
    }
    
    // 阻塞
    NSLog(@"睡会");
    [NSThread sleepForTimeInterval:1.0];
    
    // 判断线程是否被取消
    if (thread.isCancelled) {
        NSLog(@"2. --- 88");
        return;
    }
    
    for (int i = 0; i < 20; ++i) {
        // 判断线程是否被取消
        if (thread.isCancelled) {
            NSLog(@"3. --- 88");
            return;
        }
        
        if (i == 9) {
            NSLog(@"再睡");
            // 在程序执行过程中，为了等待某一个状态，可能仍然需要休眠
            // 睡到指定日期
            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        }
        
        NSLog(@"%@ %d", [NSThread currentThread], i);
    }
    NSLog(@"over");
}

@end
