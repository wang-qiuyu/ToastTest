//
//  ToastView.h
//  ToastTest
//
//  Created by qiuyu wang on 16/8/24.
//  Copyright © 2016年 qiuyu wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//应用尺寸

#define remindTagg 888


@interface ToastView : UIView

@property (nonatomic,copy) NSString *message;
- (void)show;

@end
