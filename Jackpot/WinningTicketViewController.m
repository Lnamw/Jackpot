//
//  WinningTicketViewController.m
//  Jackpot
//
//  Created by Elena Maso Willen on 27/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "WinningTicketViewController.h"

@interface WinningTicketViewController ()

@property (weak, nonatomic) IBOutlet UITextField *winningNumber1;
@property (weak, nonatomic) IBOutlet UITextField *winningNumber2;
@property (weak, nonatomic) IBOutlet UITextField *winningNumber3;
@property (weak, nonatomic) IBOutlet UITextField *winningNumber4;
@property (weak, nonatomic) IBOutlet UITextField *winningNumber5;
@property (weak, nonatomic) IBOutlet UITextField *winningNumber6;

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




- (IBAction)OKButtonPressed:(id)sender {

    int number1 = [self.winningNumber1.text intValue];
    int number2 = [self.winningNumber2.text intValue];
    int number3 = [self.winningNumber3.text intValue];
    int number4 = [self.winningNumber4.text intValue];
    int number5 = [self.winningNumber5.text intValue];
    int number6 = [self.winningNumber6.text intValue];
    
    NSMutableArray *winningNumbers = [[NSMutableArray alloc] initWithCapacity:0];
    
    [winningNumbers addObject:[NSNumber numberWithInt:number1]];
    [winningNumbers addObject:[NSNumber numberWithInt:number2]];
    [winningNumbers addObject:[NSNumber numberWithInt:number3]];
    [winningNumbers addObject:[NSNumber numberWithInt:number4]];
    [winningNumbers addObject:[NSNumber numberWithInt:number5]];
    [winningNumbers addObject:[NSNumber numberWithInt:number6]];
    
    [self.delegate winningTicketEdited:winningNumbers];
    
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


//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    static const NSUInteger limit = 2; // we limit to 70 characters
//    NSUInteger allowedLength = limit;
//    if (string.length > allowedLength) {
//        if (string.length > 1) {
//            // get at least the part of the new string that fits
//            NSString *limitedString = [string substringToIndex:allowedLength];
//            NSMutableString *newString = [textField.text mutableCopy];
//            [newString replaceCharactersInRange:range withString:limitedString];
//            textField.text = newString;
//        }
//        return NO;
//    } else {
//        return YES;
//    }
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    return (textField.text.length <= 22);
//}
//








