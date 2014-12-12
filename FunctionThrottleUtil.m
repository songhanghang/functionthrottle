//
//  FunctionThrottleUtil.m
//  Starfish
//
//  Created by songhang on 14/10/22.
//  Copyright (c) 2014年 bitbrothers. All rights reserved.
//

#import "FunctionThrottleUtil.h"

@implementation FunctionThrottleUtil

/*函数节流*/
+(void)startWithTarget:(id)aTarget  delayCallback:(SEL) fireBlockAfterDelay{
    [FunctionThrottleUtil startWithTarget:aTarget delayCallback:fireBlockAfterDelay delay:1];
}
+(void)startWithTarget:(id)aTarget  delayCallback:(SEL) fireBlockAfterDelay delay: (NSTimeInterval)delay{
    [NSObject cancelPreviousPerformRequestsWithTarget:aTarget selector:fireBlockAfterDelay object:nil];
    [aTarget performSelector:fireBlockAfterDelay withObject:nil afterDelay:delay];
}
/*block实现*/
+(void)startperformBlock:(void (^)(void))block  delay: (NSTimeInterval)delay{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(fireBlockAfterDelay:) object:block];
    [self performSelector:@selector(fireBlockAfterDelay:) withObject:block afterDelay:delay];
}

+ (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay
{
    block = [block copy] ;
    [self performSelector:@selector(fireBlockAfterDelay:)
               withObject:block
               afterDelay:delay];
}

+ (void)fireBlockAfterDelay:(void (^)(void))block {
    block();
}
@end
