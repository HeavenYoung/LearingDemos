//
//  ViewController.m
//  01-NSURLConnection常用代码
//
//  Created by Heaven on 16/1/14.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {

    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    
    // 2. request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 3. 建立网络连接，异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        NSLog(@"%@", html);
        
    }];
}

@end
