//
//  XZHAlertView.m
//  AlertTextField
//
//  Created by 熊志华 on 15/11/23.
//  Copyright © 2015年 熊志华. All rights reserved.
//
#define AlertViewWith      self.alertView.frame.size.width
#import "XZHAlertView.h"

@interface XZHAlertView ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *projectNameTF;
@property (strong, nonatomic) IBOutlet UIView *alertView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descripLabel;

@end


@implementation XZHAlertView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (id)XZHAlertViewWithTitle:(NSString *)title DeatilMessage:(NSString *)message Placeholder:(NSString *)placeholder delegate:(id)delegate {
    XZHAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:@"XZHAlertView" owner:nil options:nil] firstObject];
    //alertView.frame = [UIScreen mainScreen].bounds;
    alertView.delegate = delegate;
    alertView.titleLabel.text = title;
    alertView.descripLabel.text = message;
    alertView.projectNameTF.placeholder = placeholder;
    return alertView;
    
}
- (void)awakeFromNib {
    self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    self.alertView.layer.cornerRadius = 8;
    self.alertView.layer.masksToBounds = YES;
    _projectNameTF.delegate = self;
    _projectNameTF.layer.borderColor = [UIColor colorWithRed:0 green:142 blue:214 alpha:1].CGColor;
    _projectNameTF.layer.borderWidth = 1;
}

- (void)show
{
    
    if (!_isShow) {
        [[[UIApplication sharedApplication].delegate window]  addSubview:self];
        self.frame = [UIScreen mainScreen].bounds;
        [self shakeToShow:_alertView];
        _isShow = YES;
    }
    
}
- (void)hideView {
    [_projectNameTF resignFirstResponder];
    [self removeFromSuperview];
}
- (IBAction)handleCancel:(UIButton *)sender {
    _isShow = NO;
    if (sender)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(XZHAlertView:clickedButtonAtIndex:)])
        {
            self.string = self.projectNameTF.text;
            [self.delegate XZHAlertView:self clickedButtonAtIndex:0];
        }
        [_projectNameTF resignFirstResponder];
        [self removeFromSuperview];
    }
    
}
- (IBAction)handleComfirm:(UIButton *)sender {
    _isShow = NO;
    if (sender)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(XZHAlertView:clickedButtonAtIndex:)])
        {
            self.string = self.projectNameTF.text;
            [self.delegate XZHAlertView:self clickedButtonAtIndex:1];
        }
        [_projectNameTF resignFirstResponder];
        [self removeFromSuperview];
    }
    
}

- (void)shakeToShow:(UIView*)aView {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //回收键盘
    [textField resignFirstResponder];
    return YES;
}

@end
