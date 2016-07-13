# Templates and Generic Programming #

Generic programming involves writing code in a way that is independent of any particular type. Templates are the foundation of generic programming. We can, and have, used templates without understanding how they are defined.

A template is a blueprint or formula for creating a class or a function. For example, the standard library defines a single class template that defines what it means to be a vector. That template is used to generate any number of type-specific vector classesfor example, vector<int> or vector<string>.

**function template**
A function template is a type-independent function that is used as a formula for generating a type-specific version of the function.

    /* a template function returns 0 if the values are equal, 1 if v1 is larger, -1 if v1 is smaller */
    template <typename T>
    int compare(const T &v1, const T &v2)
    {
    	if (v1 < v2) return -1;
    	if (v2 < v1) return 1;
    	return 0;
    }

A template **definition** starts with the keyword **template** followed by a **template parameter list**, which is a comma-separated list of one or more template parameters bracketed by the less-than (<) and greater-than (>) tokens.

The template parameter list acts much like a function parameter list. Template parameters represent types or values we can use in the definition of a class or function. For example, our compare function declares one type parameter named T. Inside compare, we can use the name T to refer to a type. Which actual type T represents is determined by the compiler based on how the function is used.

A template parameter can be a type parameter, which represents a type, or a nontype parameter, which represents a constant expression. A nontype parameter is declared following a type specifier. A type parameter is defined following the keyword class or typename. For example, class T is a type parameter named T.

    #include <iostream>
    using namespace std;
    
    /* a template function returns 0 if the values are equal, 1 if v1 is larger, -1 if v1 is smaller */
    template <typename T>
    int compare(const T &v1, const T &v2)
    {
    	if (v1 < v2) return -1;
    	if (v2 < v1) return 1;
    	return 0;
    }
    
    /* function main begins program execution */
    int main()
    {
    	/* T is int;
    	 compiler instantiates int compare(const int&, const int&) */
    	cout << compare(1, 0) << endl;
    	/* T is string;
    	 compiler instantiates int compare(const string&, const string&) */
    	string s1 = "hi", s2 = "world";
    	cout << compare(s1, s2) << endl;
    	return 0;
    } /* end function main */

When we use a function template, the compiler infers what template argument(s) to bind to the template parameter(s). Once the compiler determines the actual template argument(s), it instantiates an instance of the function template for us. Essentially, the compiler figures out what type to use in place of each type parameter and what value to use in place of each nontype parameter.

**class template**

Just as we can define function templates, we can also define class templates.

    template <class Type>
    class Queue {
    public:
    	Queue (); // default constructor
    	Type &front (); // return element from head of Queue
    	const Type &front () const;
    	void push (const Type &); // add element to back of Queue
    	void pop(); // remove element from head of Queue
    	bool empty() const; // true if no elements in the Queue
    	private:
    	// ...
    };

A class template is a template, so it must begin with the keyword template followed by a template parameter list. Our Queue template takes a single template type parameter named Type. In the definition of the class and its members, we can use the template parameters as stand-ins for types or values that will be supplied when the class is used. For example, our Queue template has one template type parameter. We can use that parameter anywhere a type name can be used.

    #include <iostream>
    
    using std::cin;
    using std::cout;
    using std::endl;
    
    /* the template class Arithmetic to do some math problem */
    template< typename T >
    class Arithmetic {
    public:
    	Arithmetic(T, T);
    	T addition() const;
    	T subtraction() const;
    	T multiplication() const;
    	T division() const;
    private:
    	T value1;
    	T value2;
    };
    
    /* the implement of the member functions */
    template< typename T >
    Arithmetic< T >::Arithmetic(T v1, T v2) {
    	value1 = v1;
    	value2 = v2;
    }
    
    template< typename T >
    T Arithmetic< T >::addition() const {
    	return value1 + value2;
    }
    
    template< typename T >
    T Arithmetic< T >::subtraction() const {
    	return value1 - value2;
    }
    
    template< typename T >
    T Arithmetic< T >::multiplication() const {
    	return value1 * value2;
    }
    
    template< typename X >
    X Arithmetic< X >::division() const {
    	return value1 / value2;
    }
    
    template< typename T >
    void printResult(T number) {
    	cout << "The result of the operation is: " << number << endl;
    }
    
    /* function main begins program execution */
    int main() {
    	Arithmetic< int > a(5, 3);
    	Arithmetic< double > b(7.3, 5.2);
    
    	cout << "Arithmetic performed on object a:\n";
    	printResult(a.addition());
    	printResult(a.subtraction());
    	printResult(a.multiplication());
    	printResult(a.division());
    
    	cout << "\nArithmetic performed on object b:\n";
    	printResult(b.addition());
    	printResult(b.subtraction());
    	printResult(b.multiplication());
    	printResult(b.division());
    } /* end function main */

The definition of a member function of a class template has the following form:

    template< typename X >
    X Arithmetic< X >::division() const {
    	return value1 / value2;
    }

> It must start with the keyword template followed by the template parameter list for
> the class.
> 
> It must indicate the class of which it is a member.
> 
> The class name must include its template parameters.

The form of the implement:

    template <class T> 
    return_type template_class<T>::member-name(parameters_list)
    { function body }

In contrast to calling a function template, when we use a class template, we must explicitly specify arguments for the template parameters. The compiler uses the arguments to instantiate a type-specific version of the class. Essentially, the compiler rewrites our Queue class replacing Type by the specified actual type provided by the user.

    /* the instantiation of Queue */
    Queue<int> qi; // Queue that holds ints
    Queue< vector<double> > qc; // Queue that holds vectors of doubles
    Queue<string> qs; // Queue that holds strings

    	/* the instantiation of Arithmetic */
    	Arithmetic< int > a(5, 3);
    	Arithmetic< double > b(7.3, 5.2);

