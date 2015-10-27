//
//  ViewController.m
//  CKScrollHost
//
//  Created by lixin on 10/27/15.
//  Copyright © 2015 lixin. All rights reserved.
//

#import "ViewController.h"
#import <ComponentKit/ComponentKit.h>
#import "CKScrollHostingView.h"
#import "ExamScrollHosts.h"


@interface ViewController ()

@end

@implementation ViewController {
    NSArray *_providers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _providers = @[[ExamScrollHosts0 new], [ExamScrollHosts1 new], [ExamScrollHosts2 new]];
    CGRect f = CGRectMake(0, CGRectGetHeight(self.view.frame)/4, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)/2);
    CKScrollHostingView *scrollView = [[CKScrollHostingView alloc] initWithFrame:f direction:CKScrollHostingViewVertical componentProviders:_providers];
    [self.view addSubview:scrollView];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.backgroundColor = [UIColor grayColor];
    
    [_providers[0] updateModel:@(10) mode:CKUpdateModeAsynchronous];
    [_providers[1] updateModel:@"Hello World" mode:CKUpdateModeAsynchronous];
    [_providers[2] updateModel:@"Life's struggle" mode:CKUpdateModeAsynchronous];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:testButton];
    [testButton setTitle:@"**Try me" forState:UIControlStateNormal];
    testButton.translatesAutoresizingMaskIntoConstraints = NO;
    [testButton addTarget:self action:@selector(testButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[testButton]-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(testButton)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[testButton]" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:NSDictionaryOfVariableBindings(testButton)]];
}

- (void)testButtonPressed:(id)sender {
    [_providers[0] updateModel:@(arc4random()%40) mode:CKUpdateModeAsynchronous];
}

@end
