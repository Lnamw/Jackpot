//
//  WinningTicketViewController.h
//  Jackpot
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WinningTicketViewControllerDelegate <NSObject>

-(void)winningTicketEdited:(NSArray *)winningTicket;

@end

@interface WinningTicketViewController : UIViewController

@property (nonatomic, weak) id<WinningTicketViewControllerDelegate>delegate;

@end
