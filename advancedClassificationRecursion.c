#include "NumClass.h"
#include <math.h>
#define True 1
#define False 0

int numOfDigits(int);

int reverse(int, int);

int isArmstrongREC(int, int, int);

int numOfDigits(int n) // a private func to calc num of digits for a number
{
    if (n == 0)
    {
        return 1;
    }
    return (int)log10(n)+1; // it returns the number of digits of the number
}

int isArmstrongREC(int num, int sum, int nOfDig)
    {
        if (sum == 0 && num == 0) // we checked all nums and the num became zero
            return True;
        if (sum < 0 || num == 0) // we passed the value of the num or didn't reach it
            return False;
        int power = num % 10; // take the last digit of the number
        power = (int)pow(power, nOfDig);
        sum -= power; // 
        num /= 10; // get rid of the last digit of the number
        return isArmstrongREC(num, sum, nOfDig); // recursive call
    }

int isArmstrong(int num)
    {
        return isArmstrongREC(num, num, numOfDigits(num));
    }

int reverse(int num, int res) // rec function to return reversed form of number
{
    if (num == 0) // stop condition: the original num has no more digitis to reverse
    {
        return res;
    }
    res = (res*10) + (num%10); // move the curr value of res left by one step and add the last dig of num to it
    return reverse(num/10, res); // get rid of the last dig of num and call the function again
}    

int isPalindrome(int num)
{
    int reversedNum = reverse(num, 0); // reverse the num by inner function
    if (num == reversedNum)
    {
        return True;
    }
    return False;
}