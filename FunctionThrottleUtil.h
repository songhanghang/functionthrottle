//
//  FunctionThrottleUtil.h
//  Starfish
//
//  Created by songhang on 14/10/22.
//  Copyright (c) 2014年 bitbrothers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunctionThrottleUtil : NSObject
/*函数节流*/
+(void)startWithTarget:(id)aTarget  delayCallback:(SEL) fireBlockAfterDelay;
+(void)startWithTarget:(id)aTarget  delayCallback:(SEL) fireBlockAfterDelay delay: (NSTimeInterval)delay;
@end
