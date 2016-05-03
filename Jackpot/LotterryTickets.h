//
//  LotterryTickets.h
//  Jackpot
//
//  Created by Elena Maso Willen on 20/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotterryTickets : NSObject <NSCoding> 

@property (strong, nonatomic) NSArray *lotteryNumbers;
@property (nonatomic, assign, getter=isWinner)BOOL winner;
@property (nonatomic, strong) NSNumber *prizeAmount;


-(instancetype)initWithRandomNumber;

@end
