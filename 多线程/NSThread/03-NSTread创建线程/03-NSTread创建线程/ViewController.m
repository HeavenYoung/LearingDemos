//
//  ViewController.m
//  03-NSTread创建线程
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

    // 1.
    //[self threadOne];
    
    // 2.
    //[self threadTwo];
    
    // 3.
    [self threadThree];
}

// 第一种创建方式  alloc / init - start
- (void)threadOne {

    NSLog(@"before - %@", [NSThread currentThread]);

    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(operation:) object:@"ALLOC"];
    
    [thread start];
    
    NSLog(@"after - %@", [NSThread currentThread]);
}

// 第二种创建方式 detachNewThreadSelector
- (void)threadTwo {

    NSLog(@"before - %@", [NSThread currentThread]);
    
    // 会创建线程并且自动启动 selector 方法
    [NSThread detachNewThreadSelector:@selector(operation:) toTarget:self withObject:@"DETACH"];
    
    NSLog(@"after - %@", [NSThread currentThread]);
}

// 第三种创建方式  NSObject分类方法
- (void)threadThree {
    
    NSLog(@"before - %@", [NSThread currentThread]);
    
    // 隐式后台执行，自动执行 selector 方法
    [self performSelectorInBackground:@selector(operation:) withObject:@"PERFORM"];
    
    NSLog(@"after - %@", [NSThread currentThread]);
}

- (void)operation:(id)obj {
    NSLog(@"%@ - %@", [NSThread currentThread], obj);
}
@end
