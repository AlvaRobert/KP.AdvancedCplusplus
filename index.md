## Advanced C++

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Advanced C++: Operator Overloading

### Operators

Definition: Symbol for the compiler to perform speciﬁc mathematical, logical manipulations, or other special operation.

A binary operator takes two operands

A unary operator takes one operand

Example:
+ arithmetic operator: + , -, *, /
+ logical operator: && and ||
+ pointer operator: & and *
+ memory management operator: new, delete[ ]

### Operator Overloading

Arithmetic operator such as + are already overloaded in C/C++ for diﬀerent built-in types:

Reference-style: 
![alt text][logo]

[logo]: ./assets/images/add1.PNG "already overloaded operators"



You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.


## Advanced C++: Template Meta-Programming