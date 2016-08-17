//
//  ViewController.m
//  02-NSOperation高级操作
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSOperationQueue *queue;
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

    // 1.
    // [self maxConcurrentOperation];
    
    // 2. 依赖关系
    [self dependency];
}

- (IBAction)pauseresume:(id)sender {
    if (self.queue.operationCount == 0) {
        NSLog(@"没有需要暂停的操作");
        return;
    }
    
    // 队列挂起的时候，已经开始执行的操作不能被挂起
    self.queue.suspended = !self.queue.isSuspended;
    
    if (self.queue.isSuspended) {
        NSLog(@"暂停 － %tu", self.queue.operationCount);
    } else {
        NSLog(@"继续 - %tu", self.queue.operationCount);
    }
}

// 取消操作
- (IBAction)cancelAll:(id)sender {
    NSLog(@"取消全部");
    if (self.queue.operationCount == 0) {
        NSLog(@"没有需要取消的操作");
        return;
    }
    
    // 取消`队列`中没有调度的全部操作，如果正在执行的操作，不会被取消
    [self.queue cancelAllOperations];
    
    NSLog(@"取消全部操作 %tu", self.queue.operationCount);
}

// 设置最大并发数
- (void)maxConcurrentOperation {

    // 设置队列最大并发数
    [self.queue setMaxConcurrentOperationCount:3];
    
    for (int i = 0; i < 100; ++i) {
        [self.queue addOperationWithBlock:^{

            // 模仿延时
            [NSThread sleepForTimeInterval:1.0];
            
            NSLog(@"%@ %d", [NSThread currentThread], i);
        }];
    }
}

// NSOperation 依赖关系
- (void)dependency {
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"用户登录 %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"付费 %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"下载 %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"通知用户 %@", [NSThread currentThread]);
    }];
    
    // 设置依赖关系 － 并发效率比GCD的串行队列要好！
    // 依赖关系，可以跨队列指定！
    // 付费需要在用户登录之后执行
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    [op4 addDependency:op3];
    
    // 不能出现循环依赖 循环依赖在 iOS 的不同版本表现是不一样的，之前版本会直接死锁！
    // 目前的版本，会不执行，直接走到  NSLog(@"come here");
    [op1 addDependency:op4];
    
    // waitUntilFinished NO 异步 YES 同步
    [self.queue addOperations:@[op1, op2, op3] waitUntilFinished:NO];
    
    // 向主队列添加操作
    [[NSOperationQueue mainQueue] addOperation:op4];
    
    NSLog(@"come here");
}

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

@end
