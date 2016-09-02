//
//  ViewController.m
//  ToastTest
//
//  Created by qiuyu wang on 16/8/25.
//  Copyright © 2016年 qiuyu wang. All rights reserved.
//

#import "ViewController.h"
#import "ToastView.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ToastView *toast = [[ToastView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    toast.message = @"您已提交过dedede  de";
    [toast show];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
