//
//  LotterryTickets.m
//  Jackpot
//
//  Created by Elena Maso Willen on 20/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "LotterryTickets.h"

@implementation LotterryTickets 

-(instancetype)initWithRandomNumber
{
    if (self = [super init])
    {
        NSMutableArray *randomNumbers = [NSMutableArray array];
        for (int i=0 ; i<6; i++) {
            long number = arc4random_uniform(53);
            
            [randomNumbers addObject:[NSNumber numberWithLong:number]];
            
        }
        _lotteryNumbers = randomNumbers;
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        _lotteryNumbers = [aDecoder decodeObjectForKey:@"lotteryNumber"];
        _winner = [aDecoder decodeBoolForKey:@"winner"];
        _prizeAmount = [aDecoder decodeObjectForKey:@"prizeAmount"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_lotteryNumbers forKey:@"lotteryNumber"];
    [aCoder encodeBool:_winner forKey:@"winner"];
    [aCoder encodeObject:_prizeAmount forKey:@"prizeAmount"];
}




@end

//
//NSNumberFormatter * numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
//[numberFormatter setPaddingPosition:NSNumberFormatterPadBeforePrefix];
//[numberFormatter setPaddingCharacter:@"0"];
//[numberFormatter setMinimumIntegerDigits:10];
//
//NSNumber * number = [NSNumber numberWithInt:42];
//
//NSString * theString = [numberFormatter stringFromNumber:number];
//
//NSLog(@"%@", theString);