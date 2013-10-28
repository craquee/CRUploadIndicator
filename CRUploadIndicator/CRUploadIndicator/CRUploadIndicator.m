//
//  CRUploadIndicator.m
//  CRUploadIndicator
//
//  Created by Tomoya Igarashi on 10/15/13.
//  Copyright (c) 2013 Couger Inc. All rights reserved.
//

#import "CRUploadIndicator.h"

@implementation CRUploadIndicator

- (id)init {
    self = [super init];
    
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CRUploadIndicatorView" owner:nil options:nil];
        _view = [nib objectAtIndex:0];
        _status = kCRUploadIndicatorReady;
    }
    
    return self;
}

- (void)resetStatus {
    _status = kCRUploadIndicatorReady;
    
    _view.progressView.progress = 0.f;
    
    _view.hidden = YES;
    [_view removeFromSuperview];
}

- (void)startProgress:(UITableView *)tableView {
    _status = kCRUploadIndicatorDoing;
    
    [_view.progressView setProgress:0.f animated:NO];
    
    _view.hidden = NO;
    [tableView.superview insertSubview:_view atIndex:0];

    __block UITableView *blockTableView_ = tableView;
    
    CGFloat offset = CGRectGetHeight(_view.frame);
    [UIView animateWithDuration:0.2f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect frame = CGRectMake(0.f, offset,
                                                   CGRectGetWidth(blockTableView_.frame),
                                                   CGRectGetHeight(blockTableView_.frame) - offset);
                         blockTableView_.frame = frame;
                     }
                     completion:nil];
}

- (void)updateProgress:(CGFloat)currentProgress {
    [_view.progressView setProgress:currentProgress animated:YES];
}

- (void)didSucceed:(UITableView *)tableView duration:(CGFloat)duration delay:(CGFloat)delay didCompleteAnimation:(DidCompleteAnimation)didCompleteAnimation {
    _status = kCRUploadIndicatorDone;
    
    __block UITableView *blockTableView_ = tableView;
    __block CRUploadIndicatorView *blockView_ = _view;
    
    CGFloat offset = CGRectGetHeight(_view.frame);
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect frame = CGRectMake(0.f, 0.f,
                                                   CGRectGetWidth(blockTableView_.frame),
                                                   CGRectGetHeight(blockTableView_.frame) + offset);
                         blockTableView_.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if (didCompleteAnimation) {
                             didCompleteAnimation(finished);
                         }
                         blockView_.hidden = YES;
                         [blockView_ removeFromSuperview];
                     }];
}

@end
