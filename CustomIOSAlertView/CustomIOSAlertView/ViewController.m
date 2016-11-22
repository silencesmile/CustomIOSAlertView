//
//  ViewController.m
//  CustomIOSAlertView
//
//  Created by Richard on 20/09/2013.
//  Copyright (c) 2013-2015 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Just a subtle background color
    [self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];

    // A simple button to launch the demo
    UIButton *launchDialog = [UIButton buttonWithType:UIButtonTypeCustom];
    [launchDialog setFrame:CGRectMake(10, 30, self.view.bounds.size.width-20, 50)];
    [launchDialog addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
    [launchDialog setTitle:@"Launch Dialog" forState:UIControlStateNormal];
    [launchDialog setBackgroundColor:[UIColor whiteColor]];
    [launchDialog setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [launchDialog.layer setBorderWidth:0];
    [launchDialog.layer setCornerRadius:5];
    [self.view addSubview:launchDialog];
}

- (IBAction)launchDialog:(id)sender
{
    // Here we need to pass a full frame
//    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] initWithParentView:self.view];
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];

//    // Modify the parameters
//    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", @"Close2", @"Close3", nil]];
//    [alertView setDelegate:self];
//    
//    // You may use a Block, rather than a delegate.
//    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
//        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
//        [alertView close];
//    }];
//    
//    [alertView setUseMotionEffects:true];

    // And launch the dialog
    [alertView show];
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}

- (UIView *)createDemoView
{
    float textWidth = 260;
    
    float textMargin = 10;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    titleLabel.textColor = [UIColor blackColor];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    titleLabel.lineBreakMode =NSLineBreakByWordWrapping;
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.text = @"新版本检查";
    
    titleLabel.frame = CGRectMake(0, textMargin, textMargin * 2 + textWidth, 40);
    
    NSString *message =  @"1、增加白菜党等特色标签增加白菜党等特色标签增加白菜党等特色标签筛选\n2、增加频道热度排行\n3、增加夜间模式\n4、Material design风格优化\n5、滑动返回优化\n6、其他bug修复";
    
    UIFont *textFont = [UIFont systemFontOfSize:15];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSFontAttributeName] = textFont;
    
    CGSize maxSize = CGSizeMake(textWidth-textMargin*2, MAXFLOAT);
    
    CGSize size = [message boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textMargin,CGRectGetMaxY(titleLabel.frame) + textMargin,textWidth, size.height)];
    
    textLabel.font = textFont;
    
    textLabel.textColor = [UIColor blackColor];
    
    textLabel.backgroundColor = [UIColor clearColor];
    
    textLabel.lineBreakMode =NSLineBreakByWordWrapping;
    
    textLabel.numberOfLines =0;
    
    textLabel.textAlignment =NSTextAlignmentLeft;
    
    textLabel.text = message;
    
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textWidth + textMargin * 2,CGRectGetMaxY(textLabel.frame)+textMargin)];
    
    [demoView addSubview:titleLabel];
    
    [demoView addSubview:textLabel];
    
    NSLog(@"%@",demoView);
    
    return demoView;
    

}

@end
