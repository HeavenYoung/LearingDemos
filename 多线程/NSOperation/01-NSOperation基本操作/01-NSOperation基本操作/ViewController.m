//
//  ViewController.m
//  01-NSOperation基本操作
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

    // 1. invocation - start
    //[self invocationStart];
    
    // 2. invocation - NSOperationQueue
    //[self invocationQueue];
    
    // 3. invocation - NSOperationQueue 添加多个操作
    //[self invocationQueues];
    
    // 4. NSBlockOperation
    //[self blockOperation];
    
    // 5.
    [self loadConnection];
}

// invocation
- (void)invocationStart {
    // 继承于 NSOperation
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(load:) object:@"invocation - start"];
    
    // start 会在当前线程执行 selector 方法，不会开启线程
    [operation start];
}

/**
 队列是一个`并发`队列
 操作添加到队列中，就会`异步`执行！
 */
// 将操作添加到队列
- (void)invocationQueue {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(load:) object:@"invocation - NSOperationQueue"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 将操作添加到队列上， 异步执行，会开线程
    [queue addOperation:operation];
}

// 添加多个操作
- (void)invocationQueues {

    // 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 会开启多条线程，而且不是顺序执行
    for (int i = 0; i < 10; i++) {
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(load:) object:@"invocation - NSOperationQueue"];
        
        // 将操作添加到队列上
        [queue addOperation:operation];
    }
}

// NSBlockOperation 继承于NSOperation
- (void)blockOperation {

    // 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    for (int i = 0; i < 10; ++i) {
//        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//            NSLog(@"%@ %d", [NSThread currentThread], i);
//        }];
//        
//        [queue addOperation:operation];
        
        // 精简的写法， 直接添加
        [queue addOperationWithBlock:^{
           
            NSLog(@"%@ %d", [NSThread currentThread], i);
            
        }];
    }
}

// 线程间通讯
- (void)loadConnection {
    // 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperationWithBlock:^{
        NSLog(@"耗时的操作... %@", [NSThread currentThread]);
        
        // 在主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"更新 UI %@", [NSThread currentThread]);
        }];
    }];
}

- (void)load:(id)obj {
    NSLog(@"%@ --- %@", [NSThread currentThread], obj);
}

@end
