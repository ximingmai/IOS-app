# C++ Operator overloading #

C++ defines a large number of operators and automatic conversions among the built-in types. These facilities allow programmers to write a rich set of mixed-type expressions. Besides, C++ lets us redefine the meaning of the operators when applied to objects of class type. It also lets us define conversion operations for class types.

**Overloaded operators** are functions with special names: the **keyword operator** followed by the **symbol** for the operator being defined. Like any other function, an overloaded operator has a return type and a parameter list.

    return_type operator symbol(parameter list);

It is a form of overloaded operator function prototype.

We can overload almost all of the operators in C++ except some special operator like '?:' .

> Overloadable Operators
> 
>      +     -    *     /         %         ^
>      &     |    ~     !         ,         =
>      <     >    <=    >=       ++        --
>     <<    >>    ==    !=       &&        ||
>     +=    -=    /=    %=       ^=        &=
>     |=    *=    <<=   >>=      []        ()
>     ->   ->*    new   new[]   delete   delete[]

> Operators That Cannot Be Overloaded
>
>     ::     .*    .     ?:

Let's have a try to overload some simple opeartors!

    class complex_number {
    public:
    	complex_number operator+(const complex_number& another_number) {
    		return complex_number (real + another_number.real, imag + another_number.imag);
    	}
    	complex_number& operator+=(const complex_number& another_number) {
    		real += another_number.real;
    		imag += another_number.imag;
    		return *this;
    	}
    	bool operator==(const complex_number& another_number) {
    		return (real == another_number.real) && (imag == another_number.imag);
    	}
    	complex_number(int real, int imag) {
    		this->real = real;
    		this->imag = imag;
    	}
    private:
    	int real, imag;
    };

We can use an overloaded operator in the same way that we'd use the operator on operands of built-in type.

    complex_number number1(1, 2);
    complex_number number2(2, 3);
    complex_number result(0, 0);
    result = number1 + number2;
    number1 += number2;
    bool compare = (number1 == number2);

**input and output overloading**

Classes often make the IO operators friends.

    #include <iostream>
    using namespace std;
    
    class complex_number {
    public:
    	complex_number(int real, int imag) {
    		this->real = real;
    		this->imag = imag;
    	}
    	friend ostream& operator << (ostream&, const complex_number&);
    	friend istream& operator >> (istream&, complex_number&);
    private:
    	int real, imag;
    };
    
    ostream& operator << (ostream& out, const complex_number& number)
    {
    	out << number.real;
    	if (number.imag > 0) {
    		out << '+' << number.imag << 'j' << endl;
    	} else if (number.imag < 0) {
    		out << '-' << number.imag << 'j' << endl;
    	} else {
    		out << endl;
    	}
    	return out;
    }
    
    istream& operator >> (istream& in, complex_number& number)
    {
    	in >> number.real >> number.imag;
    	return in;
    }
    /* function main begins program execution */
    int main()
    {
    	complex_number number(1, 2);
    	cout << number;
    	cin >> number;
    	cout << number;
    	
    } /* end function main */

The input screen 

    3 5

The output screen

    1+2j
    3+5j

**Assignment operator**

The class assignment operator takes a parameter that is the class type. Usually the parameter is a const reference to the class type. This operator will be synthesized by the compiler if we do not define it ourselves.

    #include <iostream>
    using namespace std;
    
    class complex_number {
    public:
    	complex_number(int real, int imag) {
    		this->real = real;
    		this->imag = imag;
    	}
    	explicit complex_number(const complex_number& another_number) { *this = another_number; }
    	complex_number& operator = (const complex_number&);
    	friend ostream& operator << (ostream&, const complex_number&);
    private:
    	int real, imag;
    };
    
    ostream& operator << (ostream& out, const complex_number& number)
    {
    	out << number.real;
    	if (number.imag > 0) {
    		out << '+' << number.imag << 'j' << endl;
    	}
    	else if (number.imag < 0) {
    		out << '-' << number.imag << 'j' << endl;
    	}
    	else {
    		out << endl;
    	}
    	return out;
    }
    
    complex_number& complex_number::operator = (const complex_number& another_number) {
    	this->real = another_number.real;
    	this->imag = another_number.imag;
    	return *this;
    }
    /* function main begins program execution */
    int main()
    {
    	complex_number number1(1, 2);
    	complex_number number2(3, 4);
    	cout << number1 << number2 << endl;
    	number1 = number2;
    	cout << number1 << number2 << endl;
    } /* end function main */
    
The output screen

    1+2j
    3+4j
    
    3+4j
    3+4j

##Exception Handling##

Exceptions are run-time anomalies, such as running out of memory or encountering unexpected input. Exceptions exist outside the normal functioning of the program and require immediate handling by the program.

Exceptions support this kind of communication between the error-detecting and error-handling parts of a program. In C++ exception handling involves:

> 1. tHRow expressions, which the error-detecting part uses to indicate that it encountered an error that it cannot handle. We say that a throw raises an exceptional condition.
> 
> 2. try blocks, which the error-handling part uses to deal with an exception. A TRy block starts with keyword TRy and ends with one or more catch clauses. Exceptions thrown from code executed inside a try block are usually handled by one of the catch clauses. Because they "handle" the exception, catch clauses are known as handlers.
> 
> 3. A set of exception classes defined by the library, which are used to pass the information about an error between a throw and an associated catch.

An exception is thrown using a throw expression, which is usually followed by a semicolon, making it into an expression statement.

    throw object;

A TRy block begins with the keyword try followed by a block enclosed in braces. Following the TRy block is a list of one or more catch clauses. A catch clause consists of three parts: the keyword catch, the declaration of a single type or single object within parentheses (referred to as an exception specifier), and a block, which as usual must be enclosed in curly braces.

    try {
    program_statements
    } catch (exception_specifier) {
    handler_statements
    } catch (exception_specifier) {
    handler_statements
    }

If the catch clause is selected to handle an exception, the associated block is executed. Once the catch clause finishes, execution continues with the statement immediately following the last catch clause.

The program-statements inside the TRy constitute the normal logic of the program. They can contain any C++ statement, including declarations. Like any block, a TRy block introduces a local scope, and variables declared within a try block cannot be referred to outside the try, including within the catch clauses.

The C++ library defines a set of classes that it uses to report problems encountered in the functions in the standard library. These standard exception classes are also intended to be used in the programs we write.

> **Standard Exception Classes Defined in <stdexcept>**
> 
> exception The most general kind of problem.
> 
> runtime_error Problem that can be detected only at run time.
> 
> range_error Run-time error: result generated outside the range of values that are meaningful.
> 
> overflow_error Run-time error: computation that overflowed.
> 
> underflow_error Run-time error: computation that underflowed.
> 
> logic_error Problem that could be detected before run time.
> 
> domain_error Logic error: argument for which no result exists.
> 
> invalid_argument Logic error: inappropriate argument.
> 
> length_error Logic error: attempt to create an object larger than the maximum size for that type.
> 
> out_of_range Logic error: used a value outside the valid range.

    #include <iostream>
    #include<stdexcept>
    using namespace std;
    
    /* the complex number class */
    class complex_number {
    public:
    	/* the constructor function */
    	complex_number(int real, int imag) {
    		this->real = real;
    		this->imag = imag;
    	}
    	/* the copy constructor function*/
    	explicit complex_number(const complex_number& another_number) { *this = another_number; }
    	/* the opeartor!= overloaded function */
    	bool operator!=(const complex_number& another_number) {
    		if ((this->real == another_number.real) && (this->imag == another_number.imag)) return false;
    		else return true;
    	}
    	/* the output overloaded function */
    	friend ostream& operator << (ostream&, const complex_number&);
    private:
    	int real, imag;
    };
    
    ostream& operator << (ostream& out, const complex_number& number)
    {
    	out << number.real;
    	if (number.imag > 0) {
    		out << '+' << number.imag << 'j' << endl;
    	}
    	else if (number.imag < 0) {
    		out << '-' << number.imag << 'j' << endl;
    	}
    	else {
    		out << endl;
    	}
    	return out;
    }
    
    /* function main begins program execution */
    int main()
    {
    	complex_number number1(1, 2);
    	complex_number number2(3, 4);
    	cout << number1 << number2 << endl;
    	/* the exception handling */
    	try {
    		if (number1 != number2) throw exception(); /* throw a standard exception */
    	}
    	catch (exception e) {  /* catch the exception */
    		cout << "The two complex number are not equal to each other!" << endl;
    	}
    	cout << number1 << number2 << endl;
    } /* end function main */

The output screen

    1+2j
    3+4j
    
    The two complex number are not equal to each other!
    1+2j
    3+4j




