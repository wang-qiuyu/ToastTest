//
//  ToastView.m
//  ToastTest
//
//  Created by qiuyu wang on 16/8/24.
//  Copyright © 2016年 qiuyu wang. All rights reserved.
//

#import "ToastView.h"

@interface ToastView ()
{
    UIView *_noteView;
}
@end

@implementation ToastView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = remindTagg;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        _noteView = [[UIView alloc] init];
        _noteView.backgroundColor   = RGBACOLOR(80,80, 80, 0.7);
    
        _noteView.frame = CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH/3, SCREEN_HEIGHT/2, SCREEN_WIDTH*2/3, 40);
        _noteView.layer.cornerRadius = 8;
        
//        _noteView.layer.shadowColor = [BlackTextColor CGColor];
        _noteView.layer.shadowOpacity = 0.7;
        _noteView.layer.shadowRadius = 4;
        _noteView.layer.shadowOffset = CGSizeMake(0, 2);
        [self addSubview:_noteView];
    }
    return self;
}
- (void)setMessage:(NSString *)message{
    _message = message;
    UILabel *remindLabel = [[UILabel alloc]init];
    remindLabel.textColor = [UIColor whiteColor];
    remindLabel.text = _message;
    remindLabel.numberOfLines = 0;
    remindLabel.frame = CGRectMake(10, 0, _noteView.bounds.size.width - 20, _noteView.bounds.size.height);
    remindLabel.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:_message];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:4];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [_message length])];
    [remindLabel setAttributedText:attributedString1];
    [remindLabel sizeToFit];
    CGFloat width = [self getWidthWithTitle:_message font:[UIFont systemFontOfSize:15]];
    if (width<SCREEN_WIDTH*2/3-20) {
        _noteView.frame =CGRectMake(SCREEN_WIDTH/2-width/2-20, SCREEN_HEIGHT/2, width+40, SCREEN_WIDTH/10);
        remindLabel.frame = CGRectMake(20, 0, width, SCREEN_WIDTH/10);
    }
    else
    {
        CGFloat height = remindLabel.frame.size.height;
        _noteView.frame =CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH/3, SCREEN_HEIGHT/2-height/2, SCREEN_WIDTH*2/3, height+SCREEN_WIDTH/32);
        remindLabel.frame = CGRectMake(10, SCREEN_WIDTH/64, _noteView.bounds.size.width - 20, height);
    }

    remindLabel.font = [UIFont systemFontOfSize:15];
    remindLabel.textAlignment = NSTextAlignmentCenter;

    [_noteView addSubview:remindLabel];
    
    if ([_message length]>20) {
        [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(remindLabelTap:) userInfo:nil repeats:NO];
    }
    else
    {
        [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(remindLabelTap:) userInfo:nil repeats:NO];
    }
}
-(void)remindLabelTap:(UITapGestureRecognizer *)tap
{
    [self removeFromSuperview];
}
- (void)show
{
    if ([[[UIApplication sharedApplication].keyWindow viewWithTag:remindTagg] isKindOfClass:[self class]] ) {
        [[[UIApplication sharedApplication].keyWindow viewWithTag:remindTagg] removeFromSuperview];
    }
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
//获取宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}
@end
