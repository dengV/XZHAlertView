//
//  XZHAlertView.h
//  AlertTextField
//
//  Created by 熊志华 on 15/11/23.
//  Copyright © 2015年 熊志华. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XZHAlertView;

@protocol XZHAlertViewDelegate <NSObject>

- (void)XZHAlertView:(XZHAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface XZHAlertView : UIView

@property (nonatomic) BOOL isShow;
@property (nonatomic, strong) NSString *string;
@property (nonatomic, weak) id<XZHAlertViewDelegate>delegate;


+ (id)XZHAlertViewWithTitle:(NSString *)title DeatilMessage:(NSString *)message Placeholder:(NSString *)placeholder delegate:(id)delegate;
- (void)show;
@end
