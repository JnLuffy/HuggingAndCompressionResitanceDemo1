//
//  ViewController.m
//  HuggingAndCompressionResitanceDemo1
//
//  Created by IOS.Mac on 17/2/16.
//  Copyright © 2017年 com.elepphant.pingchuan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testContentCompressionResistance];
    
}

//测试空间的ContentCompressionResistance
-(void)testContentCompressionResistance{
    NSLog(@"aaaa");
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"button 1 button 2" forState:UIControlStateNormal];
    [button1 sizeToFit];
    button1.backgroundColor = [UIColor redColor];
    //设置ContentCompressionResistance的变化 设置下面代码后，button不会被压缩
    
//    [button1 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-150).priorityHigh();
        
    }];
}



@end
