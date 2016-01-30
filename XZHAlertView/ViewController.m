//
//  ViewController.m
//  XZHAlertView
//
//  Created by 熊志华 on 15/12/20.
//  Copyright © 2015年 熊志华. All rights reserved.
//

#import "ViewController.h"
#import "XZHAlertView.h"
@interface ViewController ()<XZHAlertViewDelegate>

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
- (IBAction)handleShowAlertView:(UIButton *)sender {
    XZHAlertView *alertView = [XZHAlertView XZHAlertViewWithTitle:@"提示" DeatilMessage:@"这是XXX输入框" Placeholder:@"请输入XXX" delegate:self];
    [alertView show];
}
- (void)XZHAlertView:(XZHAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}
@end
