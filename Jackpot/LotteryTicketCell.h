//
//  LotteryTicketCell.h
//  Jackpot
//
//  Created by Elena Maso Willen on 28/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LotteryTicketCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *ticketNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *WinLabel;
@property (weak, nonatomic) IBOutlet UILabel *prizeLabel;

@end
