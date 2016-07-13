# Foundation of C++_01 #
### Variable && Basic Types ###
C++ contains many basic types(primitive built-in types)

> **Type**				**Meaning**


> bool                   boolean


> char                  character


> short              short integer


> int                   integer


> long               long integer


> float      single-precision floating-point


> double     double-precision floating-point


> long double   extended-precision floating-point

*bool*,*char*,*int*... these are keywords in C++ programming and these words have their specific meaning(int means integer) to the C compiler. **bool** is stored as integer in memory and **bool** only has two value '0'(**false**) and '1'(**true**).

    /* function main begins program execution */
    int main()
    {
    	int integer1;
    	int integer2;
	}  /* end function main */

This program does nothig but defines two *variables*.

    int integer1;
    int integer2;

These are ***declarations***. All variables must be declared with a name and a data type immediately after the left brace that begins the body of main before they can be used in a program. A **varible** is a location in memory where a value can be stored for use by a program. **integer1** and **integer2** are the names of variables. This declarations means that the variables **integer1** and **integer2** are of type **int** which means that these variables will hold *integer* values.
Let's have a try.

    bool this_is_a_bool;
    float i_am_a_float;

A **variable name** in C++ is any valid *identifier*. An identifier is a series of characters consisting of letters, digits and underscores(_) that does not begin with a digit.

    /* function main begins program execution */
    int main()
    {
    	int integer1 = 0;
    	int integer2 = 1;
    	int sum;
    	sum = integer1 + integer2;
	}  /* end function main */

This program calculates the sum of variables **integer1** and **integer2** and assigns the result to variable **sum** using the *assignment operator =*. This is **definition** which gives declared variable a value. `int integer1 = 0;` *initializes* the variable integer1 and assigns value **0** to integer1. You can through **initialization**

    type variable = value;
or

    /* initialization */
    type variable; /* declaration */
    variable = value; /* definition */

gives the variable a value you like.

    const type variable = value;

or

    const type variable; /* declaration */
    variable = value; /* definition */

Obviously, this program is similar to the last one. However, the keyword **const** makes variable unmodifiable which means that you can not define the same variable more than once. Once you give a value to the variable, it can not be changed.

    #include<iostream>
    /* function main begins program execution */
    int main()
    {
    	int integer1 = 0;
    	int &integer2 = integer1; /* integer2 is integer1's reference. */
    	std::cout << integer1 << " " << integer2 << std::endl;
	}  /* end function main */

the output screen

    0 0

**Reference** is just an alias for an object(integer2 is another name of integer1). A *reference* is declared by preceding a viariable name by the **&** symbol and it must be initialized and only be initialized using an object of the same type. After initializing, the operations on a reference are actually operations on the underlying object to which the reference is bound.


### Library Types ###

In addition to C++ primitive types, C++ defines a rich library of abstract data types. 

    #include<string>
    #include<iostream>
    using std::string;
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	string string1("Welcome to C++!\n");
    	cout << string1 << endl;
    	string1 = "Hello! I am a string.\n";
    	cout << string1 << endl;
	}  /* end function main */

The output screen

    Welcome to C++!
    Hello! I am a string.

**String** is an important type in C++ which stores *character string* for you. `string variable("character string")` is initialization of string variable. It also has many other forms.

    string variable;  /* empty string */
    string variable("character string");  /* initialize string as a copy of character string */
    string variable(another string);  /* initialize string as a copy of another string */
    string variable(int, "character string"); /* initialize string with int copies of character string */

You can also use `cin >> string` to read a string from user and use `cout >> string` to print a string on the screen. This line `string1 = "Hello! I am a string.\n";` is an assignment operation on string. Let's have a try on some operations on string.

    #include<string>
    #include<iostream>
    using std::string;
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	string string1;
    	cout << string1.empty() << endl; /* this operation decides whether string is empty */
    	string1 = "Hello! I am a string.\n";
    	cout << string1.size() << endl; /* this operation returns the number of characters in string1 */
    	cout << string1[0] << endl; /* this operation returns the character at position 0 in string1 */
    	string string2;
    	string2 = string1;  /* this operation replaces characters in string2 by a copy of string1; */
    	cout << (string2 == string1) << endl; /* this operation decides whether string1 is equal to string2 */ 
    	string2 = string2 + string1;  /* this operation(+) returns the concatenation of string2 and string1 */
    	cout << string2 << endl;
	}  /* end function main */

The output screen

    1
    22
    H
    1
    Hello! I am a string.
    Hello! I am a string.

**vector** plays an important role in C++.

    #include<vector>
    using std::vector;
    /* function main begins program execution */
    int main()
    {
    	vector<int> vector1;
	}  /* end function main */

We should *include* **vector** and *use* **std::vector** to use a **vector**. A *vector* is a collection of objects of single type. `vector<int> vector1` means that vector1 is a collection of objects of **int**. You can use `vector<type> variable name` to define your own *vector*. Let's have a try on operations on *vector*.

    #include<vector>
    #include<iostream>
    using std::vector;
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	vector<int> vector1;
    	cout << vector1.empty() << endl;  /* this operation decides whether vector is empty */
    	vector1.push_back(0);  /* this operation adds element with value 0 to end of vector1 */
    	cout << vector1.size() << " " << vector1[0] << endl; /* the operation vector1.size() returns the number of characters in string1 and the operation vector1[0] returns the character at position 0 in string1 */
    	vector1.pop_back(); /* this operation pops element at the end of vector1 */
    	cout << vector1.empty() << endl;
	}  /* end function main */

The output screen

    1
    1 0
    1

### Array ###

An **array** is a compound type that consists of a **type specifier**, an **identifier**, and a **dimension**. The type specifier indicates what type the elements stored in the array will have. The dimension specifies how many elements the array will contain.

The dimension must be a constant expression whose value is greater than or equal to one and the dimension is specified inside a [] bracket pair.

The form of the definition of array:

    type_specifier identifier[dimension];

The elements of an array are numbered beginning with 0.Array elements can be accessed using the subscript operator.

    identifier[index];


### pointer ###

A **pointer**, a compound type, points to an object of some other type and hold address of the type.

We use the * symbol in a declaration to indicate that an identifier is a pointer.

    vector<int> *pvec; // pvec can point to a vector<int>
    int *ip1, *ip2; // ip1 and ip2 can point to an int
    string *pstring; // pstring can point to a string
    double *dp; // dp can point to a double

There are some kinds of values that may be used to **initialize** or assign to a pointer:


    int* p;
    int number = 0;
    p = NULL;  /*  A constant expression with value 0(A zero-valued pointer points to no object and also the cstdlib header defines a preprocessor variable named NULL, which is defined as 0) */
    p = &number;  /*An address of an object of an appropriate type */
    int* p0 = p;  /* Another valid pointer of the same type */
    cout << *p0;

We can use the symbol **&** to get the address of an object(&object).

We can access the object by dereferencing the pointer. The * operator (the dereference operator) returns the object to which the pointer points.

###scope###

The context used to distinguish the meanings of names is a **scope**. A scope is a region of the program. A name can refer to different entities in different scopes.

Most scopes in C++ are delimited by curly braces. Generally, names are visible from their point of declaration until the end the scope in which the declaration appears.

    #include <iostream>
    int main()
    {
    	int sum = 0;
    	// sum values from 1 up to 10 inclusive
    	for (int val = 1; val <= 10; ++val)
    	sum += val; // equivalent to sum = sum + val
    	std::cout << "Sum of 1 to 10 inclusive is " << sum << std::endl;
    	return 0;
    }

This program defines three names and uses two names from the standard library.Names defined outside any function(`main`) have global scope; they are accessible from anywhere in the program.

The name sum is defined within the scope of the main function. It is accessible throughout the main function but not outside of it. The variable sum has local scope. 
The name is defined in the scope of the for statement. It can be used in that statement but not elsewhere in main. It has statement scope.

###namespace###

A **namespace** is a **scope**. By defining a library's names inside a namespace, library authors (and users) can avoid the limitations inherent in global names.

    namespace student_A {
    	int id;
    	string name;
    	int grade;
    	int math_grade;
    	//...
    }

A **namespace definition** begins with the keyword namespace followed by the namespace name.Following the namespace name is a block of declarations and definitions delimited by curly braces. Any declaration that can appear at global scope can be put into a namespace.

Names defined in a namespace may be accessed directly by other members of the namespace. Code outside the namespace must **indicate** the namespace in which the name is defined:

    student_A::id = ...
    cout << student_A::grade;
    cout << student_A::name;
    // ...

Besides, we can write a using declaration to obtain direct access to names we know we'll use frequently: `using student_A::name` to use namespace student_A member name from outside the namespace.

### Expressions ###

C++ provides a number of operators and defines what these operators do when applied to operands of built-in type.

Let's have a look at these operators!

**Arithmetic operators**

> Operator	Function Use
> 
> "+" unary plus + expr 
> 
> "-" unary minus - expr 
> 
> "*" multiplication expr * expr 
> 
> "/" division  expr / expr 
> 
> "%" remainder  expr % expr 
> 
> "+" addition expr + expr 
> 
> "-" subtraction expr - expr 

    #include<iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	int integer1 = 1;
    	int integer2 = 1;
    	int result;
    	result = +integer1;
    	cout << result << endl;
    	result = -integer1;
    	cout << result << endl;
    	result = integer1 + integer2;
    	cout << result << endl;
    	result = integer1 - integer2;
    	cout << result << endl;
    	result = integer1 * integer2;
    	cout << result << endl;
    	result = integer1 / integer2;
    	cout << result << endl;
    	result = integer1 % integer2;
    	cout << result << endl;
	}  /* end function main */

The output screen

    1
    -1
    2
    0
    1
    1
    0

**Relational and logical operators**

> Operator Function Use
> 
> "!" logical NOT !expr
> 
> "<" less than expr < expr
> 
> "<=" less than or equal expr <= expr
> 
> ">"  greater than expr expr
> 
> ">="  greater than or equal expr >= expr
> 
> "=="  equality expr == expr
> 
> "!=" inequality expr != expr
> 
> "&&" logical AND expr && expr
> 
> "||" logical OR expr || expr

    #include "stdafx.h"
    #include<iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	bool bool1 = true;  /* value 1 means true */
    	bool bool2 = false;  /* value 0 means false */
    	bool result;
    	result = !bool1;
    	cout << result << endl;
    	result = bool1 < bool2;
    	cout << result << endl;
    	result = bool1 > bool2;
    	cout << result << endl;
    	result = bool1 == bool2;
    	cout << result << endl;
    	result = bool1 && bool2;
    	cout << result << endl;
    	result = bool1 || bool2;
    	cout << result << endl;
    }  /* end function main */

The output screen

    0
    0
    1
    0
    0
    1

**Other operators**

    #include<iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	int integer1 = 1;
    	int integer2 = 1;
    	int result;
    	int* adress; /* adress of an object of type int */
    	result = integer1++; /* the postfix increment, which increments its operand but yields a copy of the original,
    unchanged value as its result */
    	cout << result << " " << integer1 << endl;
    	result = integer1--; /* the postfix decrement
    operates similarly, except that it decrements its operand */
    	cout << result << " " << integer1 << endl;
    	result = ++integer1; /* the prefix increment, which
    increments its operand and yields the changed value as its result */
    	cout << result << " " << integer1 << endl;
    	result = --integer1; /* the prefix decrement
    operates similarly, except that it decrements its operand*/
    	cout << result << " " << integer1 << endl;
    	adress = &integer1; /* the & operator figures the memory number stored in computer */
    	cout << adress << endl;
    	result = (integer1 > integer2) ? integer1 : integer2; /* the conditional operator ?: */
    	cout << result << endl;
    }  /* end function main */

The output screen

    1 2
    2 1
    2 2
    1 1
    0113F868
    1

The **conditional operator**(?:) is the only ternary operator in C++. It allows us to embed simple if-else tests inside an expression. The conditional operator has the following syntactic form

    cond ? expr1 : expr2;

where **cond** is an expression that is used as a condition. The operator executes by evaluating **cond**. If **cond** evaluates to 0, then the condition is false; any other value is true. **cond** is always evaluated. If it is true, then **expr1** is evaluated; otherwise, **expr2** is evaluated.

An **expression** is composed of one or more operands that are combined by operators. The simplest form of an expression consists of a single literal constant or variable. More complicated expressions are formed from an operator and one or more operands.

Every expression yields a result. In the case of an expression with no operator, the result is the operand itself.The result of expressions that involve operators is determined by applying each operator to its operand(s).

Let's have a try to evaluate some **compond expressions**.

    #include<iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	cout << 6 + 3 * 4 / 2 + 2 << endl;
    	int temp = 3 * 4;
    	cout << temp << endl;
    	cout << ((6 + ((3 * 4) / 2)) + 2) << endl;
    	int ival = 0, jval = 1, kval = 2, lval = 3;
    	ival = jval = kval = lval; /* right associative */
    	cout << ival << " " << jval << " " << kval << " " << lval << endl;
    	int result = ival * jval / kval * lval; /* left associative */
    	cout << result << endl;
    }  /* end function main */

The output screen

    14
    12
    14
    3 3 3 3
    9

An expression with two or more operators is a **compound expression**. In a compound expression, the way in which the operands are grouped to the operators may determine the result of the overall expression. If the operands group in one way, the result differs from what it would be if they grouped another way. **Precedence** and **associativity** determine how the operands are grouped.

**Operator Precedence and Associativity table**

### Statements ###

In C++ there are **simple statements** that execute a single task and compound statements that consist of a block of statements that execute as a unit. An expression, such as `ival + 5`, becomes an expression statement by following it with a semicolon. **Expression statements** cause the expression to be evaluated.
Defining or declaring an object or a class is a statement.( `int integer;` ) **Definition statements** are usually referred to as declaration statements although definition statement might be more accurate.
A **compound statement**, usually referred to as a block, is a (possibly empty) sequence of statements surrounded by a pair of curly braces.

    {
    	int integer1;
    	integer1 = 0;
    	cout << integer1 << endl;
    }  /* a compound statement */

An **if statement** conditionally executes another statement based on whether a specified expression is true.

    if (condition statement)
    	another statement

if condition statement is true, the another statement will be executed, or it will not be executed.

Another form of **if statement**

    if (condition statement)
    	statement1;
    else 
    	statement2;

if condition statement is true, the statement1 will be executed, or the statement2 will be executed.

We can use the **if statement** to solve some problem.

    #include<iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	int number1, number2, the_largest_number;
    	number1 = 95;
    	number2 = 100;
    	if (number1 > number2) /* we use the if statement to find the largest number */
    	{
    		the_largest_number = number1;
    	} else { 
    		the_largest_number = number2;
    	}
    	cout << the_largest_number << endl;
    }  /* end function main */

The output screen

    100

Occasionally, an algorithm will contain a series of decisions in which a variable or expression is tested separately for each of the constant values it may assume, and different actions are taken. C++ provides the **switch statement** to handle such decision making.

    #include <iostream>
    using std::cin;
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	char sex;
    	cin >> sex;
    	switch (sex) { /* switch sex, f means girl while m means boy */
    		case 'm':
    			cout << "The baby is a boy!" << endl;
    			break; /* necessary to exit switch */
    
    		case 'f':
    			cout << "The baby is a girl!" << endl;
    			break; /* exit switch */
    
    		default: /* catch all other characters */
    			cout << "Incorrect letter entered." << endl;
    			break; /* optional; will exit switch anyway */
    	} /* end switch */
    
    	return 0; /* indicate program ended successfully */
    
    } /* end function main */

The input screen

    f

The corresponding output screen

    The baby is a girl!

The form of **switch statement**

    switch (condition) {
    	case value1:
    		statement1;
    		break;
    	case value2:
    		statement2;
    		break;
    	...
    	default:
    		statement;
    		break;
    } /* end switch */

A **while statement** repeatedly executes a target statement as long as a condition is true.
The form of **while statement**

    while (condition)
    	statement

We can use the **while statement** to solve some problem.

    #include <iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	int tot = 10;
    	while (tot > 0)
    		cout << tot-- << endl;
    } /* end function main */

The output screen

    10
    9
    8
    7
    6
    5
    4
    3
    2
    1

The **for loop statement** 

    for (initializer; condition; expression)
    	statement

In general, the **init-statement** is used to initialize or assign a starting value that is modified over the course of the loop. The **condition** serves as the loop control. As long as condition evaluates as true, statement is executed. After executing statement, expression will be executed and then the program will go back to the condition again. When the condition is false, the for loop will be terminated.

We can use **for loop statement** to solve some problem.

    #include <iostream>
    using std::cout;
    using std::endl;
    /* function main begins program execution */
    int main()
    {
    	int total = 0;
    	int i;
    	for (i = 0; i < 10; i++)
    	{
    		total++;
    	} /* use the for loop statement to do increment */
    	cout << total << endl;
    } /* end function main */

The outpur screen

    10

