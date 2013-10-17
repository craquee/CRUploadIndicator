//
//  ViewController.m
//  CRUploadIndicatorDemo
//
//  Created by Tomoya Igarashi on 10/16/13.
//  Copyright (c) 2013 Couger Inc. All rights reserved.
//

#import <CRUploadIndicator/CRUploadIndicator.h>

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CRUploadIndicator *uploadIndicator;
@property (unsafe_unretained, nonatomic) CGFloat progress;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _uploadIndicator = [[CRUploadIndicator alloc] init];
    [_uploadIndicator resetStatus];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ON" style:UIBarButtonItemStyleBordered target:self action:@selector(tapBarButtonItem:)];
    
    NSLog(@"%@", self.view);
    NSLog(@"view.frame:%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"tableView.frame:%@", NSStringFromCGRect(self.tableView.frame));
    NSLog(@"indicator.frame:%@", NSStringFromCGRect(_uploadIndicator.view.frame));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)tapBarButtonItem:(id)sender {
    UIBarButtonItem *barButtonItem = self.navigationItem.rightBarButtonItem;
    if ([barButtonItem.title isEqualToString:@"ON"]) {
        [barButtonItem setTitle:@"DOING"];
        
        [_uploadIndicator startProgress:self.tableView];

        _progress = 0.f;
        [NSTimer scheduledTimerWithTimeInterval:0.05f
                                         target:self
                                       selector:@selector(doTimer:)
                                       userInfo:nil
                                        repeats:YES
         ];
    }
}

- (void)doTimer:(NSTimer *)timer {
    _progress += 0.05f;

    [_uploadIndicator updateProgress:_progress];
    
    if (_progress > 1.f) {
        UIBarButtonItem *barButtonItem = self.navigationItem.rightBarButtonItem;
        [_uploadIndicator didSucceed:self.tableView
                            duration:0.2f
                               delay:0.f
                didCompleteAnimation:^(BOOL finished) {
                    [barButtonItem setTitle:@"ON"];
                }];
        [timer invalidate];
    }
}

@end
