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
    [self testContentHugging];
    
}

//测试空间的ContentCompressionResistance  抗压缩属性，优先级月大UILayoutPriorityRequired，越不容易被压缩
-(void)testContentCompressionResistance{
    NSLog(@"aaaa");
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"testContentCompressionResistance" forState:UIControlStateNormal];
    [button1 sizeToFit];
    button1.backgroundColor = [UIColor redColor];
    //设置ContentCompressionResistance的变化 设置下面代码后，button不会被压缩
    
    [button1 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-150).priorityHigh();
        
    }];
}

//测试空间的ContentHugging  hugging就是拉伸属性，约束优先级的值越大，就不被拉伸
-(void)testContentHugging{
    NSLog(@"aaaa");
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"testContentHugging" forState:UIControlStateNormal];
    [button1 sizeToFit];
    button1.backgroundColor = [UIColor redColor];
    //设置setContentHuggingPriority的变化 设置下面代码后，button不会被压缩
    [button1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(160);
        make.left.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-100).priorityHigh();
        
    }];
}





@end
