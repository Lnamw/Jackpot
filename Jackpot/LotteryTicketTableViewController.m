//
//  LotteryTicketTableViewController.m
//  Jackpot
//
//  Created by Elena Maso Willen on 20/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "LotteryTicketTableViewController.h"
#import "LotterryTickets.h"

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
    
    self.ticketList = [[NSMutableArray alloc] initWithCapacity:0];
}

-(void)addTicket:(id)sender
{
    LotterryTickets *newTicket = [[LotterryTickets alloc] initWithRandomNumber];
    [self.ticketList addObject:newTicket];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lotteryTicketCell" forIndexPath:indexPath];
    
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
    
    cell.textLabel.text = [temporaryNumbers componentsJoinedByString:@" "];
        
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
