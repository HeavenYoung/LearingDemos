//
//  EditViewController.m
//  02-Blcok传值
//
//  Created by Heaven on 16/1/8.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "EditViewController.h"

@implementation EditViewController
- (IBAction)save:(id)sender {
    
    // 执行block
    if (self.finished) {
        self.finished(self.textField.text);
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
