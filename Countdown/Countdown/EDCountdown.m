//
//  EDCountdown.m
//  Countdown
//
//  Created by humor on 15/12/31.
//  Copyright © 2015年 onefiter. All rights reserved.
//

#import "EDCountdown.h"

@interface EDCountdown ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval startTime;

@end

@implementation EDCountdown

- (instancetype)init
{
    if (self = [super init]) {
        
        _timeInterval = 1;
        
    }

    return self;

}

- (void)dealloc
{
    self.isOpen = NO;
}

- (void)setIsOpen:(BOOL)isOpen
{

    _isOpen = isOpen;
    
    __block dispatch_block_t mainBlock = NULL;
    
    if (_isOpen) {
        
        mainBlock = ^{
    
            if (_timer.isValid) {
                
                [_timer invalidate];
                
                
            }
                
                _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(handleCountTimerEvent:) userInfo:nil repeats:YES];
               
                _startTime = CFAbsoluteTimeGetCurrent();
            
        };
    }
    
    else
    {
        mainBlock = ^{
        
            if (_timer.isValid) {
                [_timer invalidate];
            }
            
            _timer = nil;
        };
    
    }
    
    if ([NSThread isMainThread]) {
        mainBlock();
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), mainBlock);
    }
    
}


- (void)handleCountTimerEvent:(id)sender
{

    if ([_delegate respondsToSelector:@selector(notifyCountTimeCallBack:withTimeOffset:)]) {
        NSTimeInterval  deltaTime = CFAbsoluteTimeGetCurrent() - _startTime;
        
        [_delegate notifyCountTimeCallBack:self withTimeOffset:deltaTime];
    }
}

@end
