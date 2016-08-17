//
//  ViewController.m
//  04-全局队列
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

    [self globalQueue_async];
    
}

/**
 
  dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)

 参数
 <#long identifier#>
 服务质量(队列对任务调度的优先级)/iOS 7.0 之前，是优先级
 
 iOS 8.0
 QOS_CLASS_USER_INTERACTIVE 0x21, 用户交互(希望最快完成－不能用太耗时的操作)
 QOS_CLASS_USER_INITIATED 0x19, 用户期望(希望快，也不能太耗时)
 QOS_CLASS_DEFAULT 0x15, 默认(用来底层重置队列使用的，不是给程序员用的)
 QOS_CLASS_UTILITY 0x11, 实用工具(专门用来处理耗时操作！)
 QOS_CLASS_BACKGROUND 0x09, 后台
 QOS_CLASS_UNSPECIFIED 0x00, 未指定，可以和iOS 7.0 适配
 
 iOS 7.0
 DISPATCH_QUEUE_PRIORITY_HIGH 2 高优先级
 DISPATCH_QUEUE_PRIORITY_DEFAULT 0 默认优先级
 DISPATCH_QUEUE_PRIORITY_LOW (-2) 低优先级
 DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN 后台优先级
 
 iOS 9.0 还不知道
 
 为了适配不同的系统版本
 dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
 
 <#unsigned long flags#>
 为未来保留使用的，应该永远传入0
 
 */

// 全局队列，异步执行
- (void)globalQueue_async {

    // 1. 获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2. 异步执行
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ - %d", [NSThread currentThread], i);
        });
    }
}

@end
