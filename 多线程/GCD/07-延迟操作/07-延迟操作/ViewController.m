//
//  ViewController.m
//  07-延迟操作
//
//  Created by Heaven on 16/1/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**

 // 最常用的延迟操作 GCD 动画
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 <#code to be executed after a specified delay#>
 });

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self after];
}

- (void)delay {

    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));

    // 主队列
    //    dispatch_after(when, dispatch_get_main_queue(), ^{
    //        NSLog(@"%@", [NSThread currentThread]);
    //    });
    
    // 全局队列
    //    dispatch_after(when, dispatch_get_global_queue(0, 0), ^{
    //        NSLog(@"%@", [NSThread currentThread]);
    //    });
    
    // 串行队列
    dispatch_after(when, dispatch_queue_create("itheima", NULL), ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"come here");

}

- (void)after {

    // 参数
    // 开始时间
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    
    // 队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // c语言函数
    dispatch_function_t function = operation;
    
    // 函数参数
    NSString *str = @"hello world";
    
    dispatch_after_f(when, queue, (__bridge void *)(str), function);
}

// 由线程执行的函数
void operation(void * param) {
    
    NSString *str = (__bridge NSString *)(param);
    
    NSLog(@"%@ - %@", [NSThread currentThread], str);
    
}

@end
