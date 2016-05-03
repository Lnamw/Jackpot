//
//  WinningTicketViewController.m
//  Jackpot
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "WinningTicketViewController.h"

@interface WinningTicketViewController ()

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;

- (IBAction)OKButtonPressed:(id)sender;

@end

@implementation WinningTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grTapped:)];
    [self.view addGestureRecognizer:gr];
    
}

-(void)grTapped:(id)sender {
    [self.view endEditing:YES];
}



-(BOOL)isNumberValid:(int)number {
    if (number < 1 || number > 53) {
        return NO;
    } else {
        return YES;
    }
    
}


- (IBAction)OKButtonPressed:(id)sender {
   
    BOOL isValidTicket = YES;
    
    NSMutableArray *winningNumbers = [[NSMutableArray alloc] initWithCapacity:0];

    for (UITextField *myTextField in self.textFieldCollection) {
        
        int number = [myTextField.text intValue];
        [winningNumbers addObject:[NSNumber numberWithInt:number]];
        
        if ([self isNumberValid:number]) {
            myTextField.textColor = [UIColor blackColor];
        } else {
            myTextField.textColor = [UIColor redColor];
            isValidTicket = NO;
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Choose a number between 1 and 53" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            
            [alert addAction:ok];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
    NSLog(@"winning array is %@", winningNumbers);
    

    if (isValidTicket) {
        [self.delegate winningTicketEdited:winningNumbers];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end









