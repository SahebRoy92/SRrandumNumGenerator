//
//  EachNumber.h
//  ProbabilityApp
//
//  Created by Mac2 on 10/02/15.
//  Copyright (c) 2015 webguru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EachNumber : NSObject


//+(NSArray*)generateRow :(NSArray*)LuckyNum and :(int)unluckyNum and :(int)sizeOfArr;
//+(NSArray*)generateRow :(NSArray*)LuckyNum and :(NSArray*)unluckyNum and :(int)sizeOfArr;
+(NSArray*)generateRow :(NSArray*)LuckyNum and :(NSArray*)unluckyNum and :(int)sizeOfArr andRange:(int)lowerBound andUpperBound:(int)upperBound;
@end
