//
//  CRUploadIndicator.h
//  CRUploadIndicator
//
//  Created by Tomoya Igarashi on 10/15/13.
//  Copyright (c) 2013 Couger Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CRUploadIndicatorView.h>

typedef NS_ENUM(NSUInteger, CRUploadIndicatorStatus) {
    kCRUploadIndicatorReady = 0,
    kCRUploadIndicatorDoing,
    kCRUploadIndicatorDone,
};

typedef void(^DidCompleteAnimation)(BOOL finished);

@interface CRUploadIndicator : NSObject

@property (strong, nonatomic) CRUploadIndicatorView *view;
@property (unsafe_unretained, nonatomic, readonly) CRUploadIndicatorStatus status;

- (id)initWithTableView:(UITableView *)tableView;
- (void)resetStatus;
- (void)startProgress:(UITableView *)tableView;
- (void)updateProgress:(CGFloat)currentProgress;
- (void)didSucceed:(UITableView *)tableView duration:(CGFloat)duration delay:(CGFloat)delay didCompleteAnimation:(DidCompleteAnimation)didCompleteAnimation;

@end
