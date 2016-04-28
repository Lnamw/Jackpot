//
//  LotteryTicketTableViewController.m
//  Jackpot
//
//  Created by Elena Maso Willen on 20/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "LotteryTicketTableViewController.h"
#import "LotterryTickets.h"
#import "LotteryTicketCell.h"

@interface LotteryTicketTableViewController ()

@property (strong, nonatomic)NSMutableArray *ticketList;

-(void)addTicket:(id)sender;

@end

@implementation LotteryTicketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Quick Picks";
    UIBarButtonItem *newQuickPickButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTicket:)];
    self.navigationItem.rightBarButtonItem = newQuickPickButton;
    
//    UIBarButtonItem *winningTicketSetupButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(setupWinningTicket:)];
//    self.navigationItem.leftBarButtonItem = winningTicketSetupButton;
    
    self.ticketList = [[NSMutableArray alloc] initWithCapacity:0];
    

}



-(void)addTicket:(id)sender
{
    LotterryTickets *newTicket = [[LotterryTickets alloc] initWithRandomNumber];
    [self.ticketList addObject:newTicket];
    [self.tableView reloadData];
    
    
}

#pragma mark - WinningTicket Delegate

-(void)winningTicketEdited:(NSArray *)winningTicket {
    
    NSLog(@"Winning Ticket array is %@", winningTicket);
    
    [self.navigationController popViewControllerAnimated:YES];
   
    for (LotterryTickets *ticket in self.ticketList) {
        int matchingNumber = 0;
        for (NSNumber *number in ticket.lotteryNumbers) {
            for (NSNumber *winningNumber in winningTicket) {
                if ([number isEqualToNumber:winningNumber]) {
                    matchingNumber ++;
                }
            }
        }
        if (matchingNumber > 3) {
            ticket.winner = YES;
        }
        
        switch (matchingNumber) {
            case 0:
            case 1:
            case 2:
                ticket.prizeAmount = @0;
                break;
            case 3:
                ticket.prizeAmount = @1;
                break;
            case 4:
                ticket.prizeAmount = @5;
                break;
            case 5:
                ticket.prizeAmount = @20;
                break;
            case 6:
                ticket.prizeAmount = @100;
                break;
            default:
                break;
        }
        
        
        NSLog(@"I have %d matching numbers and you win £%@", matchingNumber, ticket.prizeAmount);
    }
    
    [self.tableView reloadData];

}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ticketList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LotteryTicketCell *cell = (LotteryTicketCell *)[tableView dequeueReusableCellWithIdentifier:@"lotteryTicketCell" forIndexPath:indexPath];
    
    LotterryTickets *newLotteryTicket = self.ticketList[indexPath.row];
    
    NSNumberFormatter * numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterNoStyle;
    [numberFormatter setPaddingCharacter:@"0"];
    [numberFormatter setFormatWidth:2];
    
    NSMutableArray *temporaryNumbers = [NSMutableArray array];
    for (NSNumber *number in newLotteryTicket.lotteryNumbers) {
        NSString *numberString = [numberFormatter stringFromNumber:number];
        [temporaryNumbers addObject:numberString];
    }
    
    cell.ticketNumberLabel.text = [temporaryNumbers componentsJoinedByString:@" "];
    
        if (newLotteryTicket.isWinner) {
            cell.WinLabel.text = @"You have a winning ticket";
            cell.prizeLabel.text = ([NSString stringWithFormat:@"You won £%@", newLotteryTicket.prizeAmount]);
        }
     else {
        cell.WinLabel.text = @" ";
        cell.prizeLabel.text = @" ";
    }

    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"winTicketSegue"]) {
        WinningTicketViewController *vc = (WinningTicketViewController *)[segue destinationViewController];
        vc.delegate = self;
    }
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




@end
