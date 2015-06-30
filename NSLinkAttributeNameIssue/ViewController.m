//
//  ViewController.m
//  NSLinkAttributeNameIssue
//
//  Created by lingye on 15/6/30.
//  Copyright (c) 2015年 lingye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, (CGRectGetHeight(self.view.frame) - 60) / 2, CGRectGetWidth(self.view.frame), 60)];
    textView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    textView.delegate = self;
    textView.editable = NO;
    [self.view addSubview:textView];
    
    NSMutableAttributedString *as = [[NSMutableAttributedString alloc] initWithString:@"#123中文# test"
                                                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16],
                                                                                        NSForegroundColorAttributeName: [UIColor blackColor]}];
    [as addAttributes:@{NSLinkAttributeName: @"http://example.com", NSFontAttributeName: [UIFont boldSystemFontOfSize:16]}
                range:NSMakeRange(0, 7)];
    textView.attributedText = as;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"%@, %@", URL, NSStringFromRange(characterRange));
    return NO;
}

@end
