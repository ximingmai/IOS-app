# Inheritance #

**Inheritance** lets us define classes that model relationships among types, sharing what is common and specializing only that which is inherently different. Members defined by the **base class** are inherited by its **derived classes**. The derived class can use, without change, those operations that do not depend on the specifics of the derived type. It can redefine those member functions that do depend on its type, specializing the function to take into account the peculiarities of the derived type. Finally, a derived class may define additional members beyond those it inherits from its base class.

In many ways, base and derived classes are **defined** like other classes we have already seen. However, there are some additional features that are required when defining classes in an **inheritance hierarchy**. This section will present those features.

To define a derived class, we use a class **derivation list** to specify the base class(es). A class derivation list names one or more base classes and has the form 

    class class_name: access_label base_class 

where access_label is one of **public**, **protected**, or **private**, and base_class is the name of a previously defined class.

Access to the members the class inherits is controlled by a combination of the **access level** of the member in the **base class** and the access label used in the **derived class'** derivation list.

    #include <iostream>
    using namespace std;
    
    /* the class Base */
    class Base {
    public:
    	/* a public function is public derived by derived class through public access level*/
    	Base() 
    	{ 
    		protected_data = 1;
    		private_data = 0;
    		cout << "I am class Base!" << endl; 
    	}
    protected:
    	/* a protected member can be accessed by public derived class */
    	int protected_data;
    private:
    	/* a private member only can be accessed by this class */
    	int private_data;
    };
    
    /* the class Derived */
    class Derived:public Base {
    public:
    	/* a public constructor function */
    	Derived() 
    	{
    		derived_private_data = 1;
    		cout << "I am class Derived!" << endl; 
    	}
    	/* access to the protected member of the base class */
    	int getBaseData() { return protected_data; }
    private:
    	int derived_private_data;
    };
    
    /* function main begins program execution */
    int main()
    {
    	Derived derived_object;  /* instantiate a derived object */
    	cout << derived_object.getBaseData() << endl; /* call the public function */
    } /* end function main */

The output screen

    I am class Base!
    I am class Derived!
    1

A **protected** member may be accessed by a derived object but may not be accessed by general users of the type

> - In **public inheritance**, the members of the base retain their access levels: The public members of the base are public members of the derived and the protected members of the base are protected in the derived.
> - In **protected inheritance**, the public and protected members of the base class are protected members in the derived class.
> - In **private inheritance**, all the members of the base class are private in the derived class.


**derived class constructor**

**Derived constructors** are affected by the fact that they inherit from another class. Each derived constructor initializes its **base class** in addition to initializing its own data members.

    	/* a public constructor function */
    	Derived() 
    	{
    		derived_private_data = 1;
    		cout << "I am class Derived!" << endl; 
    	}

The constructor initializer invokes the **Base** class **default constructor** to initialize its base-class part.

The constructor initializer list may not directly initialize its inherited members. Instead, a derived constructor indirectly initializes the members it inherits by including its base class in its constructor initializer list:

    	/* another derived constructor function including its base class's constructor */
    	Derived1(int initializer1, int initializer2):Base1(initializer1)
    	{
    		derived1_private_data = initializer2;
    		cout << "I am class Derived!" << endl; 
    	}

**derived class copy constructor**

If a derived class defines its own **copy constructor,** that copy constructor usually should **explicitly** use the base-class copy constructor to initialize the base part of the object:

    class Base { function_body };
    class Derived: public Base {
    public:
    	/* Base::Base(const Base&) not invoked automatically */
    	/* Derived class copy constructor should explicitly use the base class copy constructor */
    	Derived(const Derived& d):Base(d) { function_body }
    };

Had the initializer for the base class been omitted,

    // probably incorrect definition of the Derived copy constructor
    Derived(const Derived& d) /* derived member initizations */
    { function_body }

the effect would be to run the Base **default constructor** to initialize the base part of the
object.

**derived class destructor**

The destructor works differently from the copy constructor and assignment operator: The derived destructor is never responsible for destroying the members of its base objects. The compiler always implicitly invokes the destructor for the base part of a derived object. Each destructor does only what is necessary to clean up its own members.

**multiple and virtual Inheritance**

Multiple inheritance is the ability to derive a class from more than one immediate base class. A multiply derived class inherits the properties of all its parents.

    #include <iostream>
    using namespace std;
    
    class Base1 {
    public:
    	Base1(int i) { data1 = i; }
    protected:
    	int data1;
    };
    
    class Base2 {
    public:
    	Base2(int j) { data2 = j; }
    protected:
    	int data2;
    };
    
    /* Derived class multiple inheritance */
    class Derived:public Base1, Base2 {
    public:
    	Derived(int i, int j) :Base1(i), Base2(j) {
    		cout << "I am Base1's data: " << data1 << endl;
    		cout << "I am Base2's data " << data2 << endl;
    	}
    };
    
    /* function main begins program execution */
    int main() {
    	Derived multiply_derived_object(1, 2);
    } /* end function main */

The output screen

    I am Base1's data: 1
    I am Base2's data 2

# Polymorphism #
**Dynamic Binding**

**Dynamic binding** lets us write programs that use objects of any type in an inheritance hierarchy without caring about the objects' specific types. Programs that use these classes need not distinguish between functions defined in the base or in a derived class.In C++, dynamic binding happens when a virtual function is called through a **reference** (or a **pointer**) to a base class.

**vitual function**

Functions defined as **virtual** are ones that the base expects its derived classes to redefine. Functions that the base class intends its children to inherit are not defined as virtual.

Because every derived object contains a base part, we can bind a base-type reference to the base-class part of a derived object. We can also use a pointer to base to point to a derived object:

    #include <iostream>
    using namespace std;
    
    /* the class Base */
    class Base {
    public:
    	Base() {}
    	/* a virtual function */
    	virtual void print() { cout << "Hello! You are printing a Base object now!" << endl; }
    };
    
    /* the class Derived */
    class Derived:public Base {
    public:
    	Derived() {}
    	/* a virtual redefined function */
    	void print() { cout << "Hello! You are printing a Derived object now!" << endl; }
    };
    
    /* function main begins program execution */
    int main()
    {
    	Derived dereived_object;
    	Base& base_reference = dereived_object;
    	base_reference.print();
    } /* end function main */

The output screen

    Hello! You are printing a Derived object now!

The output screen without **virtual**

    Hello! You are printing a Base object now!

**pure virtual function**

Defining a virtual as pure indicates that the function provides an interface for sub-sequent types to override but that the version in this class will never be called. As importantly, users will not be able to create objects of this class.

A pure virtual function is specified by writing = 0 after the function parameter list:

    class class_name {
    public:
    	return_type function_name(parameters_list) = 0;
    };

A class containing (or inheriting) one or more pure virtual functions is an abstract base class. An attempt to create an object of an abstract base class is a compile-time error.