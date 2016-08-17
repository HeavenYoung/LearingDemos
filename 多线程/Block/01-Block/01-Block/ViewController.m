//
//  ViewController.m
//  01-Block
//
//  Created by Heaven on 16/1/8.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) void (^myBlcok)();
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
    
    [self block6];
}

// 1. 最基本的block
- (void)block1 {

    // 定义一个block
    void (^myBlock)() = ^{
        NSLog(@"Hello Block -- Block执行了");
    };
    
    NSLog(@"准备执行Block");
    
    // 执行block
    myBlock();
}

// blcok 当作参数传递
- (void)block2 {

    void (^myBlock)() = ^{
        NSLog(@"block当作参数传递 -- block回调");
    };

    // 传递block
    [self callBack:myBlock];
}

- (void)callBack:(void (^)())block {

    NSLog(@"blcok准备回调");
    
    // 执行block
    block();
    
}

// block 引用参数内存
- (void)block3 {

    // 栈区变量   堆区地址 0x7fff58049cdc
    int i = 10;
    NSLog(@"blcok外部 ==== %d ------ %p", i, &i);
    
    void (^myBlock)() = ^{
        // 堆区地址 0x7f8701d22700 在定义blcok的时候，对引用的外部变量进行了copy，copy到堆中
        NSLog(@"block内部 ==== %d ------ %p", i, &i);
    };
    
    // 执行blcok
    myBlock();
}

// block 内部修改／引用外部变量
- (void)block4 {

    // 栈区变量
    __block  int i = 10;
    NSLog(@"blcok外部 ==== %d ------ %p", i, &i);
    
    void (^myBlock)() = ^{
        
        i = 20;
        
        NSLog(@"block内部 ==== %d ------ %p", i, &i);
    };
    
    // 执行blcok
    myBlock();
    
    NSLog(@"block内部使用之后---- %d -- %p",i ,&i);
}

- (void)block5 {
    // 这种情况，保存在全局区，没有使用任何外部变量，不会因为任何外部因素而改变 <__NSGlobalBlock__: 0x10c263330>
    
    void (^myBlcok)() = ^{
        NSLog(@"hello world");
    };
    NSLog(@"%@",myBlcok);
}

- (void)block6 {

    // 这种情况，保存在堆区 <__NSMallocBlock__: 0x7fc33a097170>  blcok是准备好的代码，不知道什么时候执行，所以放到堆区
    // 在定义 block 属性的时候 ，必须使用 copy 这样在设制数值的时候，可以将栈区的 block 复制到堆区
    
    int i = 10;
    void (^myBlcok)() = ^{
        NSLog(@"hello world ---- %d",i );
    };
    
    NSLog(@"%@",myBlcok);
    
    self.myBlcok = myBlcok;
    NSLog(@"%@", self.myBlcok);
}

@end
