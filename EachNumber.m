//
//  EachNumber.m
//  ProbabilityApp
//
//  Created by Mac2 on 10/02/15.
//  Copyright (c) 2015 webguru. All rights reserved.
//

#import "EachNumber.h"

@implementation EachNumber

/*
+(NSArray*)generateRow :(NSArray*)LuckyNum and :(int)unluckyNum and :(int)sizeOfArr{
  
    NSMutableArray *mySingleArr = [NSMutableArray array];
     NSSet *luckyNumSet = [LuckyNum mutableCopy];
    [mySingleArr addObjectsFromArray:[luckyNumSet mutableCopy]];
    int countStart = (int)[luckyNumSet count];
    for (int i =countStart;i<sizeOfArr -countStart;) {
        int currentNum = arc4random()%101;
        if(currentNum!=unluckyNum){
            [mySingleArr addObject:[NSNumber numberWithInt:currentNum]];
            i++;
        }
    }
    
    return [self shuffleTheArray:mySingleArr];
}
*/

+(NSArray*)generateRow :(NSArray*)LuckyNum and :(NSArray*)unluckyNum and :(int)sizeOfArr andRange:(int)lowerBound andUpperBound:(int)upperBound{
    
    NSMutableArray *mySingleArr = [NSMutableArray array];
    BOOL insertNumber = NO;
    [mySingleArr addObjectsFromArray:LuckyNum];
    int countStart = (int)[LuckyNum count]-1;
    for (int i =countStart;i<sizeOfArr-1;) {
        int currentNum = (int)[self randomNumberBetween:lowerBound maxNumber:upperBound];
       // int currentNum = arc4random_uniform(99)+1;
        if([unluckyNum count]>0){
            for (int x=0; x<[unluckyNum count]; x++) {
                if(currentNum!=[[unluckyNum objectAtIndex:x] intValue]){
                    insertNumber = YES;
                }
                else {
                    insertNumber = NO;
                    break;
                }
            }
        }
        else {
            insertNumber = YES;
        }
        

        
        if(insertNumber){
            [mySingleArr addObject:[NSNumber numberWithInt:currentNum]];
            i++;
        }
    }
    NSSet *set = [NSSet setWithArray:mySingleArr];
    if([set count]==[mySingleArr count]){
       // return [self shuffleTheArray:mySingleArr];
        return [self sort:mySingleArr];
    }
    else {
       return  [self generateRow:[set allObjects] and:unluckyNum and:(int)[mySingleArr count]andRange:lowerBound andUpperBound:upperBound];
    }
   
}

+(NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return (NSInteger)min + arc4random_uniform(max - min + 1);
}

+(NSArray*)shuffleTheArray:(NSMutableArray*)myArray{

    NSUInteger count = [myArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [myArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    return myArray;
}

+(NSArray *)sort:(NSMutableArray*)myArray{
    NSArray *sortedArray = [myArray sortedArrayUsingSelector:@selector(compare:)];
    return sortedArray;
}

@end
