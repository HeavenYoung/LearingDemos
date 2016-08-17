//
//  ViewController.m
//  coreText
//
//  Created by Heaven on 15/12/15.
//  Copyright © 2015年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *familyNames = [UIFont familyNames];
    NSLog(@"%@", familyNames);
    
    NSString *string = @"hello  JJ Boom Sky";
    // 1.
    [self label1WithString:string];
    
    // 2.
    [self label2WithString:string];
    
    // 3.
    [self label3WithString:string];
    
    // 4.
    [self label4WithString:string];
    
    // 5.
    [self label5WithString:string];
    
    // 6.
    [self label6WithString:string];
    
    // 7.
    [self label7WithString:string];
    
    // 8.
    [self label8WithString:string];
    
    // 9.
    [self label9WithString:string];
}

- (void)label1WithString:(NSString *)string {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 0, 0)];
    [self.view addSubview:label];
    
    // 创建属性文本
    NSMutableAttributedString *attString1 = [[NSMutableAttributedString alloc] initWithString:string];
    
    // 添加属性
    [attString1 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Zapfino" size:15] range:NSMakeRange(0, 5)];
    [attString1 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:18] range:NSMakeRange(5, string.length-5)];
    
    [attString1 addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0, 5)];
    [attString1 addAttribute: NSForegroundColorAttributeName value: [UIColor redColor] range: NSMakeRange(5, string.length-5)];
    
    label.attributedText = attString1;
    [label sizeToFit];
}

- (void)label2WithString:(NSString *)string {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 0, 0)];
    [self.view addSubview:label];
    
    // 创建属性字典
    NSDictionary *attDic = @{NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15], NSForegroundColorAttributeName: [UIColor blueColor]};
    NSMutableAttributedString *attString2 = [[NSMutableAttributedString alloc] initWithString:string attributes:attDic];
    
    label.attributedText = attString2;
    [label sizeToFit];
}

- (void)label3WithString:(NSString *)string {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 0, 0)];
    [self.view addSubview:label];
    
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor] };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor] };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor] };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
}

- (void)label4WithString:(NSString *)string {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 0, 0)];
    [self.view addSubview:label];
    
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSTextEffectAttributeName: NSTextEffectLetterpressStyle
                                 };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor],
                                 NSTextEffectAttributeName: NSTextEffectLetterpressStyle
                                 };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor],
                                 NSTextEffectAttributeName: NSTextEffectLetterpressStyle
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
}

- (void)label5WithString:(NSString *)string {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 0, 0)];
    [self.view addSubview:label];
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSKernAttributeName: @(5)
                                 };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor] ,
                                 NSKernAttributeName: @(3)
                                 };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor] ,
                                 NSKernAttributeName: @(8)
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
    
}

- (void)label6WithString:(NSString *)string {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 0, 0)];
    [self.view addSubview:label];
    
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                 NSStrikethroughColorAttributeName: [UIColor orangeColor]
                                 };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor],
                                 NSUnderlineStyleAttributeName: @(NSUnderlineStyleDouble),
                                 NSStrikethroughColorAttributeName: [UIColor purpleColor]
                                 };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor],
                                 NSStrikethroughStyleAttributeName: @(NSUnderlineStyleThick),
                                 NSStrikethroughColorAttributeName: [UIColor grayColor]
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
}

- (void)label7WithString:(NSString *)string {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 350, 0, 0)];
    [self.view addSubview:label];
    
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSStrokeWidthAttributeName: @(-5)
                                 };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor] };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor],
                                 NSStrokeWidthAttributeName: @(5)
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
    
}

- (void)label8WithString:(NSString *)string {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 0, 0)];
    [self.view addSubview:label];
    
    //第一段
    NSShadow *shadow1 = [[NSShadow alloc] init];
    shadow1.shadowOffset = CGSizeMake(3, 3);      //阴影偏移（X方向偏移和Y方向偏移）
    shadow1.shadowBlurRadius = 0.5;               //模糊半径
    shadow1.shadowColor = [UIColor orangeColor];  //阴影颜色
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSShadowAttributeName: shadow1
                                 };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSShadow *shadow2 = [[NSShadow alloc] init];
    shadow2.shadowOffset = CGSizeMake(3, 16);
    shadow2.shadowBlurRadius = 2.5;
    shadow2.shadowColor = [UIColor purpleColor];
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor],
                                 NSShadowAttributeName: shadow2
};
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSShadow *shadow3 = [[NSShadow alloc] init];
    shadow3.shadowOffset = CGSizeMake(16, 3);
    shadow3.shadowBlurRadius = 4.0;
    shadow3.shadowColor = [UIColor blueColor];
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor],
                                 NSShadowAttributeName: shadow3
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
}

- (void)label9WithString:(NSString *)string {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 450, 0, 0)];
    [self.view addSubview:label];
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor] };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor] };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [string substringWithRange: NSMakeRange(4, 8)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor greenColor] ,
                                 NSBackgroundColorAttributeName: [UIColor orangeColor]
                                 };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [string substringWithRange:
                                                                                NSMakeRange(12, string.length - 12)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr appendAttributedString: attrStr2];
    [attributedStr appendAttributedString: attrStr3];
    
    label.attributedText = attributedStr;
    [label sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
