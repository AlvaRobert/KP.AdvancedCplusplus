# Advanced C++

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```c++
summary(cars)
```

# Advanced C++: Operator Overloading

## Operators

Definition: Symbol for the compiler to perform speciﬁc mathematical, logical manipulations, or other special operation.

A binary operator takes two operands:
```c++
int i;      
i = 7+7;         // i = 14; 
```

A unary operator takes one operand:
```c++
int i = 0;      // i = 0
i += 7;         // i = 7; 
```

Example:
+ arithmetic operator: + , -, *, /
+ logical operator: && and ||
+ pointer operator: & and *
+ memory management operator: new, delete[ ]
___
## Operator Overloading

+ arithmetic operator such as + are already overloaded in C/C++ for diﬀerent built-in types:
 
 ```c++
int result = 3 + 4; // result = 7
 ```


+ diﬀerent algorithms are used to compute different types of addition:

```c++
2 / 3 //Integer division: Result is 0
2.0 / 3.0 //Floating-point division: Result is 0.6666667
```
+ different calls:

```c++
int main()
{

    int add(int left, int right)
    {
        return left + right;
    };

    int first = 43;
    int sec = 3465;

    int FirstResult = first + sec;
    int SecondResult = +(first + sec); //does not behave like expected
    int ThirdResult = add(first, sec); //see function above
}
```
The User can address the overloaded build-in definition of the +-Operator for the basic Int type in different ways. To simplyfy the programmcode and to have a method for overloading operators for custom types, Operator Overloading was implemented as a feature for C++. 

Overloaded operators have appropriate meaning to user-defined types, so they can be used for these types. e.g. to use operator + for adding two objects of a user-defined class.


### Overloading an Operator

```c++
class complex
{
    int real, imag;
public:
    void input()
    {
        //assign the ints..
    }
    ...

    complex operator+(complex A, complex B)
    {
        complex C;
        C.real = B.real + A.real;
        C.imag = B.imag + A.imag;
    }
    complex operator+(complex A, int i)
    {
        complex C;
        C.real = A.real + i;
        c.imag = A.imag;
        return C;
    }
}

int main()
{
    complex c1, c2;
    c1.input();

    c2 = c1 + 7; // Compiler searching for overloaded function in class complex
}
```

When an operator appears in an expression, and at least one of its operands has a **class type or an enumeration type**, then overload resolution is used to determine the user-defined function to be called among all the functions whose signatures match it.

This allows to define the behavior of operators when applied to objects of a class. There is no reason to overload an operator except if it
will make the code involving your class easier to write and especially easier to read!

___
## Overloadable/Non-overloadable Operators

![alt text][OOs]

___
## Guidelines
+ OO does not allow altering the meaning of operators when applied to built-in types, therefore one of the operands must be an object of a class

+ OO does not allow defining new operator symbols, only those provided in the language can be used to override for a new type of data

+ OO does not allow to change the number of operands an operator expects, precedence and associativity of operators or default arguments with operators 

+ OO should not change the meaning of the operator (+ does not mean subtraction!), the nature of the operator (3+4  == 4+3) or the data types and residual value expected 

+ OO should provide consistent definitions (if + is overloaded, then += should also be overloaded)

___
## Syntax

![alt text][Syntax]

Overloading operators is similar to overloading functions, except the function name is replaced with the keyword operator with the operator’s symbol added. Overloading operators for userdefined objects makes the code easier to understand and it is sensitive to the applications context. Therefore it is simple to understand the addition of the class apples or the addition of two fraction-objects.

```c++
object2 = object2.add(object1);
object2 = operator+(object2, object1);
object2 = object2 + object1;
```
___
## Types of Operators and canonical Implementations

### Unary Operators

should always be overloaded as members, since the first argument must be an object of a class
```c++
class complex
{
    int real, imag;
    complex operator+=(int i)
    {
        complex c;
        c.real = real + i;
        c.imag = imag;
        return c;
    }
}
```

### Binary operators / Shift Operators

should always be overloaded as friend function, since often the new function may require access to private parts of the object
```c++
class complex
{
    int real, imag;
public:
    friend complex operator+(complex A, complex B);
}
complex operator+(complex A, complex B)
{
    complex c;
    c.real = B.real + A.real;
    c.imag = B.imag + A.imag;
    return c;
}
```
Binary operators are typically implemented as non-members, to embody the possibility to add a integer to the complex object. (If the +-operator is only implemented as member function, only complex+integer would compile, and not integer+complex)

### Conversion operator

are used for converting the object to another class (even base types)
```c++
struct Fraction
{
    int numerator;
    int denominator;

    operator float() const { return numerator *1.0f / denominator;}
};
int main()
{
    Fraction fract;
    fract.numerator = 3; fract.denominator = 4;
    float value = fract;                        // value = 0.75
}
``` 

### Commonly overloaded operators have the following typical, canonical forms:

#### Canonical copy-assignment operator

expected to perform no action on self-assignment, and to return by reference

![alt-text][copyOp.PNG]

#### move assignment
expected to leave the moved-from object in valid state

![alt-text][moveOp.PNG]

#### Stream extraction and insertion

#### Function call operator

#### Increment and decrement

#### Best Practises

## Author´s Opinion on OO
On one hand operator overloading makes your program easier to write and to understand, on the other hand overloading does not actually add any capabilities to C++. Everything you can do with an overloaded operator you can also do with a function. However, overloaded operators make your programs easier to write, read, and maintain which in fact is a great benefit! So i would personally recommend to overload operators for defined object, if it fits the application.





# Advanced C++: Template Meta-Programming

## Templates in C++

Templates offer the possibility in C++ to program in a generic way and to create type-safe containers. There are class templates and function templates.
The following example shows a function template. It should be noted here that the keyword typename can also be replaced by class. For simple templates, there is no right or wrong. In the main method, the template is used in different ways. initially it is applied to the types int and double. in the next line you see a special case, different types are compared. this is not possible here, but with the addition <double> the integer is cast on double.

```C++
#include <iostream>

template <typename T>
T max (const T& first, const T& second)
{
    return (first >= second) ? (first) : (second);
};

int main()
{
    std::cout << max(10, 20) << st::endl;
    std::cout << max(8.43, 23.22) << std::endl;
    std::cout << max<double>(13.44, 10 << std::endl;
    return 0;
}
```

## History of Template Meta Programming

Templates are turing-complete. Also, they were evaluated at the compile time. That means, that all functions, that can be calculated, can be calculated with C++ Templates at compile time.
In 1994, Erwin Unruh von Siemens-Nixdorf presented a program to the C++ Standard Committee, which calculated the primes up to 30 and returned them in the form of error messages. Thus he proved this fact.

## Basic Techniques of Template Meta Programming

The following section will first provide an overview of important basics of template meta-programming.

**Functions**

Template metaprogramming requires functions that produce a result
already at the compile time. But that's about classic C ++
Function definitions hardly possible. Therefore, one uses a trick: With the function arguments
a class template is parameterized. The result of the function can be statically extracted via a constant member.

```C++
template <unsigned int x, unsigned int y>
struct add
{
    enum { value = x + y };
};
```

It should also be noted that the parameters are not limited to the data type unsigned int. all discreet data types can be used.

**Enumeration vs. constant variable**

Again and again it is discussed whether the presentation of results in template functions
over a one-element enumeration or maybe better over a constant one
Class variable should happen:

```C++
template <int x>
struct id_enum
{
    enum { value = x };
};

template <int x>
struct id_static
{
    static const int value = x;
};
```

Parameterizing a class template that contains class variables causes the compiler to create and instantiate them in static memory. Values ​​of enumerations are not lvalues, so have no address and are treated as literals by the compiler. Since, according to the definition of the template metaprogramming, this refers exclusively to computation or processing at compile time, and the effect of class variables relates to translation time, and the effect of class variables goes beyond compile time, enumerations are preferable.

**Recursion**

In TMP there are no variable variables, only constant ones. Therefore there can be no loops. Instead of these, in TMP recursions are used.
A recursion cancellation is due to the specialization of the template for the corresponding
Case defined.

The following code shows a template for calculating the faculty of an integer. The first template defines the recursion step n * (n - 1) !. It instantiates
itself, as long as there is a decrease in n by 1, until the case n = 0, which is given here by the specialized template with factorial <0>, occurs.
It should also be noted that in the specialization factorial <0> the specified parameter 0 in angle brackets is directly behind the template name and the angle brackets behind the keyword 'template' remain empty. If the template has several parameters, the unspecified ones remain in the upper bracket while the specified ones are written to the lower one.

```C++
template <unsigned int n>
struct factorial
{
    enum { value = n * factorial <n - 1 >:: value };
};

template <>
struct factorial <0>
{
    enum { value = 1 };
};
```

**Type Functions**

Type functions generally mean functions that use a data type instead of a value
as return value or make their result dependent on a data type.

The following example shows the template number_type, which returns a corresponding data type depending on how many bits are passed. You can also see the template bitsize, which returns the number of bits of a data type, and the template bigger_type, which retrieves and returns the next largest data type from the previous two templates.

```C++
#import <iostream>

template <int bits>
struct number_type
{
	typedef int type;
};
template <>
struct number_type <16>
{
	typedef short type;
};
template <>
struct number_type <8>
{
	typedef char type;
};

template <typename arg >
struct bitsize
{
	enum { value = sizeof ( arg ) * 8 };
};

template <typename arg >
struct bigger_type
{
	typedef typename number_type < bitsize <arg>:: value * 2 >::type type;
};

int main()
{
	std::cout << typeid(number_type<16>::type).name() << std::endl;
	std::cout << typeid(short).name() << std::endl;
	std::cout << typeid(number_type<64>::type).name() << std::endl;
	std::cout << typeid(number_type<8>::type).name() << std::endl;
	std::cout << bitsize<number_type<16>::type>::value <<std::endl;
	std::cout << typeid(bigger_type<number_type<8>::type>::type).name() << std::endl;
	return 0;
}
```

**Recursion and conditional branching**

A conditional branch is a branch in the program flow by, for example, an if-else construct or the ternary expression. The evaluation of the condition happens here only at runtime. As already mentioned, however, such post-compilation time effects in the Template Meta Programming should be avoided. Actually, there are several ways to evaluate conditions already at compile time and depending on them to branch out.


The following example shows three templates which should calculate, whether an integer is a prime number or not. 
First, the template IfThenElse can be seen. This is a self-built branched condition. The first parameter is a boolean, second and third parameters are integers, which are returned if the boolean is either true or false.

In the template is_prim_check the IfThenElse template will be used. If a number n is divisible by i, then 0 is returned, otherwise is_prim_check <i-1, n> is called. Termination condition of this recursion is the specialization is_prim_check <1, n>, in this case 1 is returned.
The template is_prim checks whether the transferred integer n is a prime number or not and returns the value 0 or 1 accordingly. If 0 or 1 was passed as n, 0 will be returned, since these are not prime numbers. Otherwise the template is_prim_check with the parameters n / 2 and n is called and returned.

```C++
template <bool cond , int true_part , int false_part>
struct IfThenElse;

template <int true_part , int false_part>
struct IfThenElse <true , true_part , false_part>
{
    enum { value = true_part };
};

template <int true_part , int false_part>
struct IfThenElse <false , true_part , false_part>
{
    enum { value = false_part };
};


template <int i, int n>
struct is_prim_check
{
    enum { value = IfThenElse < ((n % i) != 0), ( is_prim_check <i - 1, n >:: value ),
           (0) >:: value };
};

template <int n>
struct is_prim_check <1, n>
{
    enum { value = 1 };
};


template <int n>
struct is_prim
{
    enum { value = is_prim_check <(n / 2), n >:: value };
};

template <>
struct is_prim <1>
{
    enum { value = 0 };
};

template <>
struct is_prim <0>
{
    enum { value = 0 };
};
```

## Advanced Concepts

**Unrolled loops**

**Expression templates**

**Variadic templates ???**



![alt text][logo]


[logo]: ./assets/images/add1.PNG "already overloaded operators"
[OOs]: ./assets/images/DNoverloadable.PNG "Overloadable / Non-overloadable Operators"
[Syntax]: ./assets/images/syntax.PNG "OO Syntax"
[copyOp.PNG]: ./assets/images/copyOp.PNG "copy assignment operator"
[moveOp.PNG]: ./assets/images/moveOp.PNG "move assignment operator"