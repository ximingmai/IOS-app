# Introduction to C++ programming #

**C++** uses some **notations** that may appear strange to people who have not programmed computers. We begin by considering a simple C++ program. Our first example prints **a line of text**. The program and the program's screen output are shown as following.

    /* A first program in C++ */
    #include<iostream>
    using namespace std;
    /* function main begins program execution */
    int main()
    {
    	cout << "Welcome to C++!\n";
    	return 0;
    }  /* end function main */

The output screen

    Welcome to C++!

This simple program illustrates several important features of the C++.

### Comments ###

    /* A first program in C++ */

A sentence or a paragraph begins with /* and end with */ indicating that it is a comment. Comments are ignored by the C++ compiler and do not cause the computer to perform any action when the program is run. You can use comments to help other people read and understand your program.

There is also another form of comments. 

    //  I am a single-line comment.

A single-line comment starts with a double slash (//). Everything to the right of the slashes on the current line is a comment and ignored by the compiler.

### Preprocessor ###

    #include<iostream>

It is a directive to the C++ preprocessor. Lines beginning with # are processed by the preprocessor before the program is compiled. The **#include** *preprocessor directive* causes a copy of a specified file to be included in place of the directive. The two forms of the #include directive are 

    #include<filename>
    #include"filename"

If the file name is enclosed in quotes, the preprocessor searches in the same directory as the file being compiled for the file to be included. This method is normally used to include programmer-defined headers. If the file name is enclosed in angle brackers -used for *standard library headers*- the search is performed in an implementation-dependent manner, normally through predesignated directories. There are also many other *preprocessor directive*.

    #define PI 3.14159
    #define CIRCLE_AREA( x ) ( ( PI ) * ( x ) * ( x ) )

The first **#define** *directive* replaces PI with the numeric constant 3.14159. While the second one means that wherever CIRCLE_AREA( y ) appears in the file, the value of y is substituted for x in the right part `( (PI) * ( x ) * ( x ) )`, PI is replaced by its value (defined previously) and the `CIRCLE_AREA( y )` is expanded in the program. For example, the statement

    area = CIRCLE_AREA( 4 );

is expanded to

    area = ( ( 3.14159 ) * ( 4 ) * ( 4 ));

###using declarations###

    using namespace std;

A using declaration has the following form:

    using namespace::name;
    or
    using namespace_name;

In C++, namespace has its own region. When we should use some standard function. We should use using declarations. Now, you just need remember add `using namespace_name` to your program, you will know about what is namespace and why we should use using namespace in the following study.

### Function ###

    int main()

is a part of every C++ program. The parentheses after main indicate that main is a program building block called a *function*. C++ programs contain one or more functions, one of which must be main. Every program in C++ begins executing at the function main.

### Statement ###

    std::cout << "Welcome to C++!\n";

instructs the computer to perform an action, namely to print on the screen the *string* of characters marked by the quotation marks. A string is sometimes called a *character string*, a *message* or a *literal*. The entire line, including *std::cout*, its *argument* within the parentheses and the semicolon(;), is called a *statement*. Every statement must end with a semicolon(also known as the statement terminator).

    return 0;

This *statement* is included at the end of every **main** function. The keyword **return** is one of several means we will use to *exit a function*. When the return statement is used at the end of **main** as shown here, the value 0 indicates that the program has terminated successfully.

