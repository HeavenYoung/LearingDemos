//
//  EditViewController.h
//  02-Blcok传值
//
//  Created by Heaven on 16/1/8.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, copy) void (^finished)(NSString *string);

@end
