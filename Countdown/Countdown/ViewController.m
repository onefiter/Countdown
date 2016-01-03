//
//  ViewController.m
//  Countdown
//
//  Created by humor on 15/12/31.
//  Copyright © 2015年 onefiter. All rights reserved.
//

#import "ViewController.h"
#import "EDCountdown.h"

@interface ViewController ()<EDCountdownDelegate>

@property (strong, nonatomic) IBOutlet UILabel *timerCount;

@property (nonatomic, strong) EDCountdown *edCountdown;

- (IBAction)Countdown:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}



- (IBAction)Countdown:(id)sender
{
    if (_edCountdown == nil)
    {
        _edCountdown = [[EDCountdown alloc] init];
        _edCountdown.delegate = self;
        _edCountdown.timeInterval = 1;
        _edCountdown.isOpen = YES;
        
        [self notifyCountTimeCallBack:_edCountdown withTimeOffset:0];
        
        
    }
    
    
}


- (void)notifyCountTimeCallBack:(id)sender withTimeOffset:(NSTimeInterval)timeOffset
{
    if (sender == _edCountdown) {
        if (timeOffset > 60) {
            
            [self timerClose];
            
        }
        
        else
        {
            double deltaTime = 60 - timeOffset;
            
             NSInteger intDeltaTime = ceilf(deltaTime);
            
            
            _timerCount.text = [NSString stringWithFormat:@"%d秒后重发",intDeltaTime];
        
        }
    }

}


- (void)timerClose
{
    _edCountdown.isOpen = NO;
    [_timerCount setText:@"发送验证码"];
    _edCountdown  = nil;

}
@end
