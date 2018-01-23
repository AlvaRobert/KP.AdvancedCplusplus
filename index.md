## Advanced C++

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Advanced C++: Operator Overloading

### Operators

Definition: Symbol for the compiler to perform speciﬁc mathematical, logical manipulations, or other special operation.

A binary operator takes two operands:
```{r pressure, echo=FALSE}
2 / 3 //Integer division: Result is 0
2.0 / 3.0 //Floating-point division: Result is 0.6666667
```

A unary operator takes one operand:
```{r pressure, echo=FALSE}
2 / 3 //Integer division: Result is 0
2.0 / 3.0 //Floating-point division: Result is 0.6666667
```

Example:
+ arithmetic operator: + , -, *, /
+ logical operator: && and ||
+ pointer operator: & and *
+ memory management operator: new, delete[ ]

### Operator Overloading

+ arithmetic operator such as + are already overloaded in C/C++ for diﬀerent built-in types:
 
    ![alt text][logo]

+ diﬀerent algorithms are used to compute different types of addition:

```{r pressure, echo=FALSE}
2 / 3 //Integer division: Result is 0
2.0 / 3.0 //Floating-point division: Result is 0.6666667
```
+ different calls:

```{r pressure, echo=FALSE}
int main()
{
    int first = 43;
    int sec = 3465;

    int result = first + sec;
    result = +(first + sec); //attention
    result = add(first, sec); //see picture above
}
```

Folie 6



## Advanced C++: Template Meta-Programming







[logo]: ./assets/images/add1.PNG "already overloaded operators"
