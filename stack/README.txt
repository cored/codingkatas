A stack machine is given. It contains an internal stack that can store arbitrary number of 12-bit unsigned integers. The machine processes a string of characters in the following way:
characters of the string are processed one by one;
if the current character is a digit ('0'-'9'), the machine pushes the value of that digit onto its internal stack;
if the current character is '+', the machine pops two topmost values from its internal stack, adds them and pushes the result onto the stack;
if the current character is '*', the machine pops two topmost values from its internal stack, multiplies them and pushes the result onto the stack;
after the machine has processed the whole string it returns the topmost value of its internal stack as the result;
the machine reports an error if any operation it performed (addition or multiplication) resulted in an overflow or underflow;
the machine reports an error if it tried to pop an element from its internal stack and the stack was empty.

For example, given the string "13+62*7+*" the machine will perform the following operations:
 character | comment                | stack
-----------------------------------------------
           |                        | [empty]
'1'        | push 1 onto the stack  |
           |                        | 1
'3'        | push 3 onto the stack  |
           |                        | 1, 3
'+'        | perform addition       |
           |                        | 4
'6'        | push 6 onto the stack  |
           |                        | 4, 6
'2'        | push 2 onto the stack  |
           |                        | 4, 6, 2
'*'        | perform multiplication |
           |                        | 4, 12
'7'        | push 7 onto the stack  |
           |                        | 4, 12, 7
'+'        | perform addition       |
           |                        | 4, 19
'*'        | perform mutliplication |
           |                        | 76

The machine will return 76 as the result as it is the topmost element of its internal stack. Write a function
def stack_machine_emulator(s)
that given a string S consisting of N characters containing an input to the stack machine returns the result the machine would return given this string. The function should return − 1 if the machine would report an error during processing of the string.
Assume that:
the length of S is within the range [0..1,000,000];
string S consists only of the following characters: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, + and/or *.

For example; Given string S = "13+62*7+*" the function should return 76, as explained in the example above. Given string S = "11++" the function should return −1.
