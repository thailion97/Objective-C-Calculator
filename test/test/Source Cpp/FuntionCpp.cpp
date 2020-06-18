//
//  FuntionCpp.cpp
//  test
//
//  Created by Nguyen Anh Thai on 6/11/20.
//  Copyright © 2020 Nguyen Anh Thai. All rights reserved.
//

#include "FuntionCpp.h"
using namespace std;

#define PLUS     0
#define MINUS    1
#define MULTIPLY 2
#define DIVIDE   3



double plusNum(double num1, double num2){
    return num1 + num2;
}

double minusNum(double num1, double num2){
    return num1 - num2;
}

double multiplyNum(double num1, double num2){
    return num1 * num2;
}

double divideNum(double num1, double num2){
    return num1 / num2;
}

string convertDoubleToString(double answer){
    return to_string(answer);;
}

double convertStringtoDouble(string theNumber){
    return stod(theNumber);;
}

string cutStringNegative(string str){
    return str.substr(1, str.length());
}


