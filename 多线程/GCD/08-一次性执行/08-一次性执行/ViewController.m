//
//  ViewController.m
//  08-一次性执行
//
//  Created by Heaven on 16/1/6.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import "Tools.h"

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
    
    Tools *tools = [Tools shareManager];
    NSLog(@" tools ------ %@", tools);
   
    Tools *tool = [Tools shareSyncTools];
    NSLog(@" tool ====%@", tool);
    
// 需要看这段代码的时候，打开
//    NSLog(@" start ");
//    
//    [self testOnce];
}

// 测试dispatch_once线程安全
- (void)testOnce {
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self once];
        });
    }
}

- (void)once {

    NSLog(@"currentThread === %@", [NSThread currentThread]);
    
    static NSObject *obj;
    
    // 如果 token == 0 就执行 block 中的代码，执行一次之后
    static dispatch_once_t onceToken;
    NSLog(@"onceToken == %ld", onceToken);
    
    dispatch_once(&onceToken, ^{
        NSLog(@"执行了一次");
        
        obj = [[NSObject alloc] init];
    });
    
    NSLog(@"%@", obj);
}

@end
