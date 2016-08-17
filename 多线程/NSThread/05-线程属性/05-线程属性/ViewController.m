//
//  ViewController.m
//  05-线程属性
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

    NSLog(@"%tu", [NSThread currentThread].stackSize / 1024);
    
    // 修改栈区大小，最小16K，一定要是 4K 的整数倍
    [NSThread currentThread].stackSize = 1024 * 1024;
    NSLog(@"%tu %@", [NSThread currentThread].stackSize / 1024, [NSThread currentThread]);
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadRun) object:nil];
    
    // 线程名称
    thread1.name = @"线程---1 ";
    
    // 线程优先级
    /**
     1.0表示优先级最高
     0.0表示优先级最低
     默认优先级是0.5
     优先级高只是保证 CPU 调度的可能性会高 
     开了一个线程之后，会优先调度优先级比较高的线程
     */
    thread1.threadPriority = 1;
    
    [thread1 start];
    
    NSThread *thread2= [[NSThread alloc] initWithTarget:self selector:@selector(threadRun) object:nil];
    thread2.name = @"线程---2";
    thread2.threadPriority = 0;
    [thread2 start];
}

- (void)threadRun {
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%@ %d", [NSThread currentThread], i);
    }
}

@end
