//
//  LotterryTickets.h
//  Jackpot
//
//  Created by Elena Maso Willen on 20/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotterryTickets : NSObject

@property (strong, nonatomic) NSArray *lotteryNumbers;

-(instancetype)initWithRandomNumber;

@end
