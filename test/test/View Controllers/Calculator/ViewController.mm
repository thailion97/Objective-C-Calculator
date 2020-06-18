//
//  ViewController.m
//  test
//
//  Created by Nguyen Anh Thai on 6/10/20.
//  Copyright © 2020 Nguyen Anh Thai. All rights reserved.
//

#import "ViewController.h"
#include "FuntionCpp.h"
#import <UIKit/UIKit.h>


#define PLUS     0
#define MINUS    1
#define MULTIPLY 2
#define DIVIDE   3
#define DEFAULT  4

@interface ViewController ()
    {
        double num1;
        double num2;
        double answer;
        
        int countPressOperand;
        int countPressNegativeOrPositive;
        NSInteger        operand;
        int        countPressNum;
        int        countPressDot;
        string         theNumber;
        IBOutlet UILabel *lblText;
        NSString *converStringToNSString;
    }

    @property double num1;
    @property double num2;
    @property double answer;

    @property NSInteger operand;
    @property int countPressOperand;
    @property int countPressNegativeOrPositive;
    //@property int countPressOperandPlus;
    @property int countPressDot;
    @property int countPressNum;
    @property string theNumber;
    @property (strong, nonatomic) IBOutlet UILabel *lblText;
    @property (strong, nonatomic) NSString *converStringToNSString;

@end


@implementation ViewController

    @synthesize num1, num2, answer, operand, countPressNum, theNumber, lblText, converStringToNSString, countPressOperand, countPressDot, countPressNegativeOrPositive;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setCountPressNegativeOrPositive:0];
    [self setCountPressNum:0];
    [self setCountPressDot:0];
   // [self setCountPressOperand:]
    [self setNum1:      0];
    [self setNum2:      0];
    [self setOperand:   DEFAULT];
    [self setAnswer:    0];
    theNumber = "0";
    //viewStart(countPress, num1, num2, operand, answer, theNumber);
    
    [self printNumber];
}

- (void)printNumber {
    
    converStringToNSString = @(theNumber.c_str());
    [lblText setText:converStringToNSString];
}

- (void)saveNum1 {
    num1 = [@(theNumber.c_str()) doubleValue];
    countPressNegativeOrPositive = 0;
    theNumber = "0";
    [self printNumber];
}

- (IBAction)clearNum:(id)sender {
    theNumber = "0";
    countPressNegativeOrPositive = 0;
    countPressNum = 0;
    countPressDot = 0;
    [self printNumber];
}

- (IBAction)clearAll:(id)sender {
    theNumber = "0";
    operand = DEFAULT;
    num1 = 0;
    num2 = 0;
    answer = 0.0;
    countPressNum = 0;
    countPressDot = 0;
    countPressOperand = 0;
    countPressNegativeOrPositive = 0;
    [self printNumber];
}

- (IBAction)calculate:(id)sender {
    num2 = convertStringtoDouble(theNumber);
    if (operand == PLUS) {
        answer = plusNum(num1, num2);
    }
    else if (operand == MINUS) {
        answer = minusNum(num1, num2);
    }
    else if (operand == MULTIPLY) {
        answer = multiplyNum(num1, num2);
    }
    else if (operand == DIVIDE) {
        if (num2 == 0) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                message:@"Can not divide by zero."
                                       preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];

            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];

        } else {
            answer = divideNum(num1, num2);
        }
    } else if(operand == DEFAULT) {
        [self saveNum1];
        answer = num1;
    }

    theNumber = string([[NSString stringWithFormat:@"%g", answer] UTF8String]);
    //theNumber = convertDoubleToString(answer);
    //theNumber = @(convertIntegerToString(answer).c_str());
    [self printNumber];

    num1 = answer;
    operand = DEFAULT;
    num2 = 0;
    answer = 0.0;
    countPressNum = 0;
    countPressDot = 0;
    countPressOperand = 0;
    countPressNegativeOrPositive = 0;
}
- (IBAction)setPlus:(id)sender {
    countPressOperand++;
  //  countPressOperandPlus++;
    if (countPressOperand == 1) {
        [self saveNum1];
    }
    operand = PLUS;
    countPressNum = 0;
    countPressDot = 0;
    countPressNegativeOrPositive = 0;
}

- (IBAction)setMinus:(id)sender {
    countPressOperand++;
    //countPressOperandMinus++;
    
    if (countPressOperand == 1) {
        [self saveNum1];
    }
    operand = MINUS;
    countPressNum = 0;
    countPressDot = 0;
    countPressNegativeOrPositive = 0;
}

- (IBAction)setMultiply:(id)sender {
    countPressOperand++;
    if (countPressOperand == 1) {
        [self saveNum1];
    }
    operand = MULTIPLY;
    countPressNum = 0;
    countPressDot = 0;
    countPressNegativeOrPositive = 0;
}

- (IBAction)setDivide:(id)sender {
    countPressOperand++;
    if (countPressOperand == 1) {
        [self saveNum1];
    }
    operand = DIVIDE;
    countPressNum = 0;
    countPressDot = 0;
    countPressNegativeOrPositive = 0;
}

- (IBAction)press9:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "9";
        } else {
            theNumber = "-9";
        }
    } else {
        theNumber += "9";
    }
    countPressNum++;
    [self printNumber];
}

- (IBAction)press8:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "8";
        } else {
            theNumber = "-8";
        }
    } else {
        theNumber += "8";
    }
    countPressNum++;
    [self printNumber];
}

- (IBAction)press7:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "7";
        } else {
            theNumber = "-7";
        }
    } else {
        theNumber += "7";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press6:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "6";
        } else {
            theNumber = "-6";
        }
    } else {
        theNumber += "6";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press5:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "5";
        } else {
            theNumber = "-5";
        }
    } else {
        theNumber += "5";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press4:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "4";
        } else {
            theNumber = "-4";
        }
    } else {
        theNumber += "4";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press3:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "3";
        } else {
            theNumber = "-3";
        }
    } else {
        theNumber += "3";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press2:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "2";
        } else {
            theNumber = "-2";
        }
    } else {
        theNumber += "2";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press1:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
        if(countPressNegativeOrPositive % 2 == 0){
           theNumber = "1";
        } else {
            theNumber = "-1";
        }
    } else {
        theNumber += "1";
    }
    countPressNum++;
    [self printNumber];
}
- (IBAction)press0:(id)sender {
    double checkZero = convertStringtoDouble(theNumber);
    if ((countPressNum == 0 || checkZero == 0) && countPressDot == 0 ) {
       theNumber = "0";
    } else {
        theNumber += "0";
    }
    countPressNum++;
    [self printNumber];

}

- (IBAction)pressDot:(id)sender {
    countPressDot++;
    if(countPressDot == 1) {
        theNumber += ".";
    }
    countPressNum++;
    [self printNumber];
}

- (IBAction)pressNegativeOrPositive:(id)sender {
    if(countPressNegativeOrPositive % 2 == 0){
        //string([[@"-" stringByAppendingString:@(theNumber.c_str())] UTF8String]);
        theNumber = "-" + theNumber;
    } else {
        theNumber = cutStringNegative(theNumber);
    }
    [self printNumber];
//    theNumber = convertDoubleToString((double)(-1.0) * [@(theNumber.c_str()) doubleValue]);
    countPressNegativeOrPositive++;
}


@end
