//
//  NSTimer+Action.m
//  SLBanner
//
//  Created by 苏磊 on 2017/8/17.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import "NSTimer+Action.h"

@implementation NSTimer (Action)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                      block:(void(^)())block
                                    repeats:(BOOL)repeats{
    
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:self
                                       selector:@selector(blockInvoke:)
                                       userInfo:block
                                        repeats:repeats];
}

+ (void)blockInvoke:(NSTimer *)timer{
    
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self pauseTimer];
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}


@end
