//
//  FuntionCpp.hpp
//  test
//
//  Created by Nguyen Anh Thai on 6/11/20.
//  Copyright © 2020 Nguyen Anh Thai. All rights reserved.
//


#ifdef __cplusplus

#include <stdio.h>
#include <string.h>
#include <sstream> 
#include <iostream>

using namespace std;

#define PLUS     0
#define MINUS    1
#define MULTIPLY 2
#define DIVIDE   3



double plusNum(double num1, double num2);
double minusNum(double num1, double num2);
double multiplyNum(double num1, double num2);
double divideNum(double num1, double num2);

double convertStringtoDouble(string theNumber);
string convertDoubleToString(double answer);
string cutStringNegative(string str);



#endif /* FuntionCpp_hpp */

