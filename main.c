# include <stdio.h>
# include "NumClass.h"
# define True 1

int main()
{
    int first, second, i; // our scale of numbers
    scanf("%d %d", &first, &second);
    if (first < 0 || second < 0)
    {
        return 1; // because the numbers must be positive
    }
    if (first > second)
    {
        int temp = first;
        first = second;
        second = temp;
    }
    printf("The Armstrong numbers are:");
    for (i = first; i < second+1; i++)
    {
        if (isArmstrong(i) == True)
        {
           printf(" %d", i);
        }
    }
    printf("\nThe Palindromes are:");
    for (i = first; i < second+1; i++)
    {
        if (isPalindrome(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Prime numbers are:");
    for (i = first; i < second+1; i++)
    {
        if (isPrime(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\nThe Strong numbers are:");
        for (i = first; i < second+1; i++)
    {
        if (isStrong(i) == True)
        {
            printf(" %d", i);
        }
    }
    printf("\n");
    return 0;
}