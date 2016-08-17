//
//  ViewController.m
//  02-Blcok传值
//
//  Created by Heaven on 16/1/8.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"


/**
 
 block的反向传值
 
 1. 调用方：准备块代码
 跟"代理"来对比 - 类似于协议方法的实现
 不同点：块代码都在一起，并没有单独的实现一个方法
 
 2. 被调用方：执行块代码
 1>     要执行的代码：在.h中定义一个块代码的属性，又被称作“回调方法”
 2>     在需要的时候执行块代码！
 
 
 *** delegate
 
 1. 调用方(代理)
 1> 遵守协议
 2> 设置代理，让委托方知道代理是谁
 3> 实现协议方法
 － 类似给块代码传值
 
 2. 被调用方(委托)
 1> 定义协议方法目的
 －委托方知道让代理执行什么方法
 －代理方知道实现什么方法
 2> 定义一个弱引用的delegate属性，跟代理建立联系
 3> 在需要的时候，通知代理执行协议方法
 －定义一个块代码属性，便于调用方传递数值
 －在需要的时候执行！
 
 *** block 在传值上有什么特点？
 －简单
 －所有代码都在一起，便于阅读，便于维护
 
 *** block & delegate 如何选择？
 
 －如果回调方法比较少，1～2，最好不要超过3个，这个时候使用block比较合适
 －如果回调方法太多，会让代码显得臃肿，反而不好维护
 
 －如果回调方法非常多，同时又不用每一个方法都必须实现，这个时候用delegate会比较方便！
 */

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    EditViewController *eVC = segue.destinationViewController;

    eVC.finished = ^(NSString *string) {
        self.nameLabel.text = string;
    };
}

@end
