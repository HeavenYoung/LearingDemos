//
//  ViewController.m
//  05-同步任务
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

    [self gcdOne];
    
    //[self gcdTwo];
}

/**
 */
- (void)gcdOne {

    dispatch_queue_t q = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    // 同步任务不执行完，队列不会调度后续的任务
    dispatch_sync(q, ^{
        NSLog(@"login %@", [NSThread currentThread]);
    });
    
    dispatch_async(q, ^{
        NSLog(@"步骤 1 %@", [NSThread currentThread]);
    });
    
    dispatch_async(q, ^{
        NSLog(@"步骤 2 %@", [NSThread currentThread]);
    });
}

- (void)gcdTwo {

    dispatch_queue_t q = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    void (^task)() = ^{

        // 同步任务不执行完，队列不会调度后续的任务
        // 阻塞队列调度，必须执行完成，才允许后续的操作！
        dispatch_sync(q, ^{
            NSLog(@"login %@", [NSThread currentThread]);
        });
        
        dispatch_async(q, ^{
            NSLog(@"步骤 1 %@", [NSThread currentThread]);
        });
        
        dispatch_async(q, ^{
            NSLog(@"步骤 2 %@", [NSThread currentThread]);
        });
    };
    
    dispatch_async(q, task);
}

@end
