# Countdown
倒计时的一个Demo

```objc

#import <Foundation/Foundation.h>

@class EDCountdown;

@protocol EDCountdownDelegate <NSObject>

/**
 *  周期性的通知外界，自创建计时器到当前时间差值
 *
 *  @param sender     计时器
 *  @param timeOffset 自创建计时器到当前时间差值
 */

- (void)notifyCountTimeCallBack:(id)sender withTimeOffset:(NSTimeInterval)timeOffset;


@end

@interface EDCountdown : NSObject

@property(nonatomic, weak  )   id<EDCountdownDelegate> delegate;
@property(nonatomic, assign)   BOOL isOpen;
@property(nonatomic, assign)   NSTimeInterval timeInterval;

- (void)handleCountTimerEvent:(id)sender;

@end

```