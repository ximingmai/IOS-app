# Foundation of C++_02 #
### Functions ###
A function can be thought of as a programmer-defined operation. Like the built-in operators, each function performs some computation and (usually) yields a result.

    #include <iostream>
    using std::cout;
    using std::endl;
    /* function function_name print a string on the screen and return a integer */
    int function_name(int function_parameters)
    {
    	cout << "Hello! I am a function!" << endl;
    	return function_parameters;
    } /* end function function_name */
    
    /* function main begins program execution */
    int main()
    {
    	int result;
    	result = function_name(1);  /* call operator */
    	cout << result << endl;
    	return 0;
    } /* end function main */

The output screen

    Hello! I am a function!
    1

A function is uniquely represented by a **return type**`int`(return type can be **void** which means that the function does not return a value), a **name**`function_name`, a set of **operand types**`int function_parameters` and a **function body**. Its operands, referred to as **parameters**, are specified in a comma-separated list enclosed in parentheses. The actions that the function performs are specified in a block, referred to as the **function body**. Every function has an associated **return type**.

    result = function_name(1);

To invoke a function we use the **call operator**, which is a pair of parentheses. As with any operator, the call operator takes operands and yields a result. The operands to the call operator are the name of the function and a (possibly empty) comma-separated list of arguments. The result type of a call is the **return type** of the called function, and the result itself is the **value returned by the function**.

    return_type function_name(parameter1_type function_parameter1, parameter2_type function_parameter2, ...) /* function head */

    function_name(argument1, argument2, ...); /* function call, pass the arguments to function */

We must pass exactly the **same number** of arguments as the function has parameters. The **type** of each argument must match the corresponding parameter. A **parameter list**(can be empty but cannot be omitted) consists of a comma-separated list of parameter types and (optional) parameter names. Even when the types of two parameters are the same, the type must be **repeated**.

Just as variables must be declared before they are used, a function must be declared before it is called. As with a variable definition, we can declare a function separately from its definition; a function may be defined only once but may be declared multiple times.

    return_type function_name(paremeter_list); /* function declaration */

    function_name(argument_list); /* function call */
    
    return_type function_name(parameter_list)
    	function body
    /* function definition */

A function **declaration** consists of a return type, the function name, and parameter list. The parameter list must contain the types of the parameters but need not name them. These three elements are referred to as the **function prototype**.

Now, you have known about how to use a function, and let's have a try!

    #include <iostream>
    using std::cout;
    using std::endl;
    
    /* function prototype */
    int what_is_the_largest_number(int, int)
    
    /* function main begins program execution */
    int main()
    {
    	int the_largest_number, number1 = 89, number2 = 100;
    	the_largest_number = what_is_the_largest_number(number1, number2);  /* call operator */
    	cout << "The largest number is: " << the_largest_number << endl;
    	return 0;
    } /* end function main */

    /* function what_is_the_largest_number finds and returns the largest number */
    int what_is_the_largest_number(int number1,  int number2)
    {
    	if (number1 > number2)
    		return number1;
    	else
    		return number2;
    } /* end function */
    
The output screen

    The largest number is: 100

Functions bring us many benefits but calling a function is much slower than evaluating the equivalent expression and does a lot of work. Fortunately, **inline function** solve this problem. **inline function** (A function specified as inline (usually)) is expanded "in line" at each point in the program in which it is invoked.

    /* inline function what_is_the_largest_number finds and returns the largest number */
    inline int what_is_the_largest_number(int number1,  int number2)
    {
    	return number1 > number2 ? number1 : number2;
    } /* end function */
    
    the_largest_number = what_is_the_largest_number(number1, number2);  /* call operator */
    
    the_largest_number = (number1 > number2 ? number1 : number2);  /* inline function is expanded in line during compilation */

We can define an **inline function** by specifying the keyword inline before the function's return type. Then the run-time overhead of making a function is thus removed.

Two functions are **overloaded** if they have the same name but have different parameter lists. We can use it to perform the same general action but apply to different parameter types.

    /* three function overloading */
    /* fine the largest integer number */
    int what_is_the_largest_number(int number1,  int number2)
    {
    	return number1 > number2 ? number1 : number2
    }  /* end function */

    /* fine the largest double number */
    double what_is_the_largest_number(double number1,  double number2)
    {
    	return number1 > number2 ? number1 : number2
    } /* end function */

    /* fine the largest float number */
    float what_is_the_largest_number(float number1,  float number2)
    {
    	return number1 > number2 ? number1 : number2
    }  /* end function */

The compiler matches a call to a function automatically by comparing the actual arguments used in the call with the parameters offered by each function in the overload set.

### Library IO ###
In C++, **input/output** is provided through the library. The library defines a family of types that support IO to and from devices such as files and console windows. Each of these IO types defines how to read and write values of the built-in data types.

> **IO Library Types and Headers**
> 
> **Header** **Type**
> 
> **iostream**
> 
>       istream reads from a stream
>       ostream writes to a stream
>       iostream reads and writes astream
> 
> **fstream** 
> 
>       ifstream, reads from a file
>       ofstream writes to a file
>       fstream, reads and writes a file
> 
> **sstream**
>  
>       istringstream reads from a string
>       ostringstream writes to a string
>       stringstream reads and writes a string
> 
Let's have a try!

    #include <iostream>
    #include <fstream>
    #include <sstream>
    using namespace std;
    
    /* function tests iostream */
    void test_iostream()
    {
    	string a;
    	cin >> a;
    	cout << "I have a string: " << a << endl;
    } /* end funciton */
    
      /* function tests sstream */
    void test_sstream()
    {
    	stringstream ss;
    	string a;
    	cin >> a;
    	ss << a;
    	cout << "I have a stringstream: " << ss.str() << endl;
    } /* end funciton */
    
    /* function main begins program execution */
    int main()
    {
    	test_iostream();
    	test_sstream();
    	return 0;
    } /* end function main */

The input screen

    string
    string

The output screen

    I have a string: string
    I have a stringstream: string


### Classes ###

**Class Type**


In C++ we define our own data types by defining a **class**. A **class** defines the data that an object of its type contains and the operations(functions) that can be executed by objects of that type. The library types string, istream, and ostream are all defined as classes. The **data** and **functions** of a class are intimately tied together(**encapsulation**). A class like a blueprint. Out of a blueprint, a builder can build a house. Out of a class, a programmer can create an object. One blueprint can be reused many times to make many houses. One class can be reused many times to make many objects of the same class.

Each class defines an **interface** and **implementation**. The interface consists of the operations that we expect code that uses the class to execute. The implementation typically includes the data needed by the class. The implementation also includes any functions needed to define the class but that are not intended for general use.

When we define a class, we usually begin by defining its interfacethe operations that the class will provide. From those operations we can then determine what data the class will require to accomplish its tasks and whether it will need to define any functions to support the implementation.

    class class_name {
    	class body
    };

A **class definition** starts with the **keyword class** followed by an **identifier** that names the class. The **body** of the class appears inside curly braces. The close curly must be followed by a **semicolon**.

The **class body**, which can be empty, defines the data and operations that make up the type. The operations and data that are part of a class are referred to as its **members**. The operations are referred to as the **member functions** and the data as **data members**.

The class also may contain zero or more **public**(the public section of a class defines members that can be accessed by any part of the program) or **private**(code that is not part of the class does not have access to the private members) *access labels*. An **access label** controls whether a member is accessible outside the class. Code that uses the class may access only the **public members**.

**Class Data Members**

    int class_data_int;
    double class_data_double;
    string class_data_string;

The data members of a class are defined in somewhat the same way that normal variables are defined. However, We ordinarily **cannot initialize** the members of a class as part of their definition. When we define the data members, we can only name them and say what types they have. The data members of a class define the contents of the **objects** of that class type. When we define objects of **type class**, those objects will contain an int, a double, and a string.

**Class Member Functions**

We define **member functions** similarly to how we define ordinary functions. As with any function, a member function consists of four parts:

-  A return type for the function
-  The function name
-  A (possibly empty) comma-separated list of parameters
-  The function body, which is contained between a pair of curly braces

As we know, the first three of these parts constitute the **function prototype** and the function prototype must be defined within the class body. The body of the function, however, may be defined within the class itself or outside the class body.

Now let's define a class!

    #include <iostream>
    #include <fstream>
    #include <sstream>
    using namespace std;
    
    /* define a class called Time */
    class Time {
    public:
    	/* the distructor is public */
    	~Time() {}
    	/* the constructor is public */
    	Time(int, int, int);
    	/* the setTime function prototype */
    	void setTime(int, int, int);
    	/* the const getTime function defines inside the class Time */
    	void getTime() const { cout << hour << ":" << min << ":" << sec << endl; }
    private:
    	int hour, min, sec; /* class data members are private */
    };
    
    /* the setTime function defines outside the class Time */
    void Time::setTime(int hour, int min, int sec)
    {
    	this->hour = hour;  /* use this pointer */
    	this->min = min;
    	this->sec = sec;
    }
    
    /* the constructor defines outside the class Time */
    Time::Time(int hour, int min, int sec)
    {
    	this->hour = hour;
    	this->min = min;
    	this->sec = sec;
    }
    
    /* function main begins program execution */
    int main()
    {
    	Time time(11, 45, 1); /* instantiate a object of class Time called time */
    	time.getTime();  /* call the member function getTime of object time */
    } /* end function main */

The output screen

    11:45:1

This program not only defines a class Time but also call a member function of the instantiated object. There are a lot of knowledge points to study.

**member functions defined outside**

Member functions defined outside the class definition must indicate that they are members of the class:

    void Time::setTime

The function name uses the **scope operator** **::** to say that we are defining the function named **setTime** that is defined in the scope of the **Time** class.

**this parameter**

    /* the constructor defines outside the class Time */
    Time::Time(int hour, int min, int sec)
    {
    	this->hour = hour;
    	this->min = min;
    	this->sec = sec;
    }

Each member function (except for static member functions) has an extra, implicit parameter named **this**. When a member function is called, the **this** parameter is initialized with the address of the object on which the function was invoked and in the body of the function we can refer to the **this** pointer explicitly to reprensent **a certain member** in the object.

**class objects**

When we define a class, we are defining a type. Once a class is defined, we can define **objects** of that type. Storage is allocated when we define objects.

    Time time(11, 45, 1); /* instantiate a object of class Time called time */

the compiler allocates an area of storage sufficient to contain a **Time** class object. The name **time** refers to that area of storage. Each object has its own copy of the class data members. Modifying the data members of item does not change the data members of any other **Time** object.

**member function call**

    	time.getTime();  /* call the member function getTime of object time */

The member function is **called** in the similar way like normal function except the preceeding object name and a dot(**.**) followed the object.

**const member function**

    void getTime() const { cout << hour << ":" << min << ":" << sec << endl; }

A function that uses const in this way(`return_type function_name(parameters list) const { function body }`) is called a const member function and a const member function cannot change the object on whose behalf the
function is called.

**constructor**

    /* the constructor defines outside the class Time */
    Time::Time(int hour, int min, int sec)
    {
    	this->hour = hour;
    	this->min = min;
    	this->sec = sec;
    }
    
This function is called **constructor**, a special member function that is distinguished from other member functions by having the same name as its class. Unlike other member functions, constructors have no return type. Constructors usually are used to initialize data members in an object.

A **constructor** is declared inside the class and may be defined there or outside the class and generally we put the constructor in the **public** section of the class to make the class type to be able to define and initialize class objects.

    	Time time(11, 45, 1); /* instantiate a object of class Time called time */

When a class object is created, its members can be initialize by that class's **constructor** function(**constructor call**) and *initializers* can be provided in parentheses to the right of the object name and before the semicolon.

**Distructor**

    	/* the distructor is public */
    	~Time() {}

A **destructor** is a special member function of a class whose name is the **tilde(~)** character followed by the class name. A class's **destructor** is **called** when an object is destroyed automatically. A **destructor** receives no parameters and returns no value.

**Copy Constructor function** **/* without example */**

The **constructor** that takes a single parameter that is a (usually const) reference to an object of the class type itself is called the **copy constructor**.

    class_name(const class_name& another_object) { function_body }

The **copy constructor** will copy the members from its argument into the object that is being constructed. You can decide how to copy members in function body. This function can also be defined inside or outside the class body like other function. 

    class_type new_object(another_object);

The copy constructor function calling is similar to the constructor function calling except that *initializers* becomes another object.

**friend Function and friend class** **/* without example */**

    friend void setTime(Time&, int, int, int);  /* the friend function prototype of Time inside the class body */
    
    /* the friend function defines outside the class body */
    void setTime(Time& time, int hour, int min, int sec)
    {
    	time.hour = hour;
    	time.min = min;
    	time.sec = sec;
    }
    
    setTime(time, 15, 45, 1);  /* the friend function calling */

A **friend** function of a class is defined outside that class's scope, yet has the right to access **private** members of the class. To declare a function as a **friend** of a class, precede the function prototype in the class definition with the keyword **friend**. Friends are not members of the class, and the friend function is invoked for a object in this way `setTime(time, 15, 45, 1);` which takes **time** as an argument rather than using the name of the object to call the function like `time.setTime(15, 45, 1)`.

A **friend** not only can be a ordinary, nonmember function but also may be a **member function of another
previously defined class**, or an entire **class**.

**static class members**

    #include <iostream>
    #include <fstream>
    #include <sstream>
    using namespace std;
    
    /* define a class called Time */
    class Time {
    public:
    	/* the static function */
    	static int getCount() { return count; }
    	/* the constructor function is public */
    	Time(int, int, int);
    	/* the distructor function */
    	~Time() {}
    private:
    	int hour, min, sec; /* class data members are private */
    	static int count;
    };
    
    /* the static data initializes */
    int Time::count = 0;
    
    /* the constructor function defines outside the class Time */
    Time::Time(int hour, int min, int sec)
    {
    	count++;
    	this->hour = hour;
    	this->min = min;
    	this->sec = sec;
    }
    
    /* function main begins program execution */
    int main()
    {
    	cout << Time::getCount() << endl; /* the static function can be called by class directly */
    	Time time(11, 45, 1); /* instantiate a object of class Time called time */
    	cout << time.getCount() << endl; /* the static function can be called like other member function*/
    } /* end function main */

The output screen

    0
    1

A **static** member is shared by all objects of a class. A **static data member** exists independently of any object of its class. A **static member function **has no **this** parameter. It may directly access the static members of its class but may not directly use the nonstatic members.

A member is made static by prefixing the member declaration with the **keyword static**. The static members obey the normal public/private access rules.

    	/* the static function */
    	static int getCount() { return count; }
    	static int count;
    	/* getCount() is public, count is private */

A **static member** can be invoked directly from the class using the scope operator or indirectly through an object.

    	cout << Time::getCount() << endl; /* the static function can be called by class directly */
    	cout << time.getCount() << endl; /* the static function can be called like other member function*/


