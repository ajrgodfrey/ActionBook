# New BrailleR commands for making basic graphs {#NewGraphs}


This chapter introduces some of the new commands found in the `BrailleR` package that are substitutes for other functions found in the base distribution of R. You can jump ahead to the examples, but there is some theory needed to explain how the `BrailleR` package does the extra work it does, and why we need to use these substitute commands.




You will need the `BrailleR` package to be ready for use to follow along with the examples in this chapter. Do this by issuing the command `library(BrailleR)` now.



## Background

In Chapter \@ref(VI), we saw creation of a histogram using the `hist()` command. The `hist()` command used for many years is found in the `graphics` package and has its own `plot()` command called `plot.histogram()` as well. This `plot()` command is actually a family of commands that all start with`plot.*()` where the star is replaced by the type of object that is being plotted. We use this `plot()` command all the time to give us plots for different reasons. When we fit a regression model, we need to create various plots of the residuals and it is done using `plot()` which actually employs `plot.lm()` in the background to do the work. The family of commands are referred to as "methods" and the types of objects being worked on are called "classes".  We need a little more background before diving into the various new commands BrailleR offers.

### Methods and classes

Development of the `BrailleR` Package and discussion of its opportunities is totally reliant on two of the structures used in the S language. 
These are "methods" and "classes". 
In brief, a set of commands that perform a  similar task on a selection of different classes is a "method". 

Methods and classes are important ideas because we can write a method function that says how we want an object with a stated class to be processed. Methods need classes, and we wouldn't need classes if we didn't hope to use methods.

When we create a histogram with the `hist()` command we can store an object of class "histogram", and when we create a regression model using `lm()` we create an object of class "lm". 
The `hist()` command does create an object with the class attribute set to `histogram`, but  only one specific function exists for this class, that being the `plot.histogram()`  function to plot the histogram. 
Sighted users don't need an explicit print function for a histogram, nor does this summary graph need further summarisation.


Tasks that warrant a method being written for each of a variety of classes include:

- we might need a function to print the object out in an easy to use fashion. THis happens all the time, but most R users just take it for granted that the output looks the way it does. In fact, the output is formatted behind the scenes.
- we may need to plot the results in a graph. A simple `plot()` command does all sorts of different things. Novice users just watch the magic without asking how it happens.
- we may need to create a different kind of object that summarizes the original object in some way. This is already done using the `summary()` function, but that simple `summary()` command is actually a set of functions for different classes.

 These are just three tasks common to objects of many classes. There is nothing stopping any R user  from writing a method to handle a variety of classes or adding to the methods that already exist.

A complete method will have a base function that informs the software that there is a family of functions written for different classes, and that a method has been written for the default action, which is applied if no specific method exists for a class. For example, the print method includes specific functions:  `print()`, `print.default()`, `print.matrix()`, and many more.
If we issue the command `print(x)`, and we know that `x` is a matrix, the `print()` method will employ the `print.matrix()` function to display the matrix. The example given in Chapterthat printed the results of the histogram object used the `print.default()` function as there is no `print.histogram()` function in existence.


Many R commands do lead to an object being created with a class attribute being explicitly stated, sometimes it is more implicit, but all too commonly no class attribute is established at all.  The vast majority of statistical models set a class for the model being stored. There are some quite uninformative classes set as well.
Assigning a class to an object means that we can write functions that relate to all objects of a particular class using a general approach. A class therefore needs to be defined for a set of objects that are going to be homogeneous in their structure.

Data is usually stored with a specified class attribute, such as a time series with class "ts" for example.  We will generate different results from employing methods if we have correctly specified the data using a class attribute. We can also modify a data object's class, using commands like `as.tx()` to turn a vector of numbers into a time series if we need to do so to get the desired outcome.
 
A data.frame is itself of  class "data.frame", a matrix is of class "matrix", but rather confusingly,  a vector is not of class "vector". Vectors are assigned class attributes that depend on the type of data being stored, being "integer", "numeric", "logical", "character", etc.

As previously stated, the usefulness of methods is dependent on the use of classes being employed when objects are created. 
The original `hist()` command does specify the resulting histogram to have a class, but no `print()` method `print.histogram()` exists. 
In addition, not all objects are given a class so the default method must be constructed carefully. 
There are actually only a few basic data structures to work with, the easiest and most common of which is called a "list". 

The results of applying the `print()` command to a histogram shown in Chapter \@ref(VI), couldn't use the non-existent `print.histogram()` function so it used the `print.default()` method instead. The content of the object is stored as a "list", but note the last element of the list that states the class of the object. Adding this extra attribute to the data object is a minor matter that has very powerful consequences!


### Who cares about classes anyway?

It is a reasonable question to ask. 
BrailleR cares because the functions written such as the `VI()` command used throughout   Chapter \@ref(VI) is actually a family of commands. 
The beginnings of the `BrailleR` Project were formed on the idea of writing a method that would provide the summarised text version of the graph object created. To this end, a method was started with the functions: `VI()`, `VI.default()`, and `VI.histogram()` in order to demonstrate the approach.
The `VI()` commands called actually refered to the `VI.histogram()` and `VI.data.frame()` commands to generate output that is sensitive to the object of interest.


So for the `VI()` command to do the processing necessary to extract the information that is pushed into a graphic or textual output, we need to know what kind of object was being created. For the examples shown in Chapter \@ref(VI), that was done with the standard R commands used when creating the histogram and the data.frame we used. Well that's almost true. The standard `hist()` command from the base distribution of R does assign the class "histogram" to the stored object, but it doesn't have all the necessary information in it to replicate a plotted histogram. The solution is to create a new `hist()` command in the `BrailleR` package that does all the work of the original function and does add the details we want to help describe the histogram being plotted.



## Example: A histogram

One of the easiest ways to demonstrate code snippets is to include them in the help documentation of the function. Running these examples is then possible using the `example()` command. 
In this example, we see that use of the original `hist()` from the `graphics` package yields the same graph as the `BrailleR` package version, but that the additional text for such items as titles and axis labelling used in the text description are only added by `BrailleR::hist()`. Running the command, `example(hist)` command will give you the following:

```

> x = rnorm(1000)

> MyHist = graphics::hist(x, xlab = "random normal values", 
+     main = "Example histogram (graphics package)")
```

<div class="figure">
<img src="04b-NewGraphCommands_files/figure-html/exampleHist-1.png" alt="testing examples" width="480" />
<p class="caption">(\#fig:exampleHist)testing examples</p>
</div>

```

> MyHist
$breaks
 [1] -3.0 -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5
[15]  4.0

$counts
 [1]   7  15  42  95 152 184 208 133  95  43  20   4   1   1

$density
 [1] 0.014 0.030 0.084 0.190 0.304 0.368 0.416 0.266 0.190 0.086 0.040
[12] 0.008 0.002 0.002

$mids
 [1] -2.75 -2.25 -1.75 -1.25 -0.75 -0.25  0.25  0.75  1.25  1.75  2.25
[12]  2.75  3.25  3.75

$xname
[1] "x"

$equidist
[1] TRUE

attr(,"class")
[1] "histogram"

> MyHist = hist(x, xlab = "random normal values", main = "Example histogram (BrailleR package)")
```

<div class="figure">
<img src="04b-NewGraphCommands_files/figure-html/exampleHist-2.png" alt="testing examples" width="480" />
<p class="caption">(\#fig:exampleHist)testing examples</p>
</div>

```

> MyHist
$breaks
 [1] -3.0 -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5
[15]  4.0

$counts
 [1]   7  15  42  95 152 184 208 133  95  43  20   4   1   1

$density
 [1] 0.014 0.030 0.084 0.190 0.304 0.368 0.416 0.266 0.190 0.086 0.040
[12] 0.008 0.002 0.002

$mids
 [1] -2.75 -2.25 -1.75 -1.25 -0.75 -0.25  0.25  0.75  1.25  1.75  2.25
[12]  2.75  3.25  3.75

$xname
[1] "x"

$equidist
[1] TRUE

$main
[1] "Example histogram (BrailleR package)"

$xlab
[1] "random normal values"

$ExtraArgs
$ExtraArgs$main
[1] "Histogram of x"

$ExtraArgs$xlab
[1] "x"

$ExtraArgs$ylab
[1] "Frequency"

$ExtraArgs$sub
[1] ""


$NBars
[1] 14

$par
$par$xaxp
[1] -3  4  7

$par$yaxp
[1]   0 200   4


$xTicks
[1] -3 -2 -1  0  1  2  3  4

$yTicks
[1]   0  50 100 150 200

attr(,"class")
[1] "Augmented" "histogram"

> VI(MyHist)
This is a histogram, with the title: Histogram of x
"x" is marked on the x-axis.
Tick marks for the x-axis are at: -3, -2, -1, 0, 1, 2, 3, and 4 
There are a total of 1000 elements for this variable.
Tick marks for the y-axis are at: 0, 50, 100, 150, and 200 
It has 14 bins with equal widths, starting at -3 and ending at 4 .
The mids and counts for the bins are:
mid = -2.75  count = 7 
mid = -2.25  count = 15 
mid = -1.75  count = 42 
mid = -1.25  count = 95 
mid = -0.75  count = 152 
mid = -0.25  count = 184 
mid = 0.25  count = 208 
mid = 0.75  count = 133 
mid = 1.25  count = 95 
mid = 1.75  count = 43 
mid = 2.25  count = 20 
mid = 2.75  count = 4 
mid = 3.25  count = 1 
mid = 3.75  count = 1
```

When you first issued the `library(BrailleR)` command, there were several warnings printed out. One of them told you that the `hist()` function from the `graphics` package was masked by the `BrailleR` version. This means that when you use `hist()`, it is the `BrailleR` version being used.

the `BrailleR` package includes `hist()` and `boxplot()` functions that pass the details of the command on to the `graphics` package functions of the same name, and then add any additional content required that will improve the ability to describe the visual graphic produced in text. In most cases, the graph producing functions pass on arguments such as `main`, `xlab`, or `ylab` (for main title and axis labels) to the relevant plotting commands without storing these elements in the object that is created. These elements are stored as graphical parameters and can be recalled using `par()` commands. 

## Scatter plots

The description of the `hist()` function given above shows what is possible if a graph is created using a specific function. Many plots are created using the `plot()` function which is actually a family of functions tailored to the type of object pushed into them. In addition, the `plot()` command is used to generate a simple scatter plot. This is slightyly unfortunate in a theoretical sense, but useful in a practical sense. The use of `plot()` to generate a scatter plot cannot lead to a graph that the `VI()` functionality can work with. Unlike the `hist()` command which can be replaced by a function of the same name in the `BrailleR` package, the solution needs to be a new function of a new name. In addition to the new `ScatterPlot()` function, the `BrailleR` package has a `FittedLinePlot()` function that adds a fitted line to the scatter plot. 

The example given on the help page for `ScatterPlot()` proves that the plots generated by `ScatterPlot()` and `FittedLinePlot()` are identical to those that would normally be created using `plot()` and the addition of the fitted line using `abline()`. Running the command, `example(ScatterPlot)` command will give you the following:


```

> attach(airquality)

> op = par(mfcol = c(3, 2))

> plot(Wind, Ozone, pch = 4)
```

```

> test1 = ScatterPlot(Wind, Ozone, pch = 4)
```

```

> test1
```

```

> plot(Wind, Ozone)
```

```

> abline(coef(lm(Ozone ~ Wind)), col = 4)

> test2 = FittedLinePlot(Wind, Ozone, line.col = 4)
```

```

> test2
```

<div class="figure">
<img src="04b-NewGraphCommands_files/figure-html/exampleScatterPlot-1.png" alt="The six graphs generated by the `example(ScatterPlot)`" width="768" />
<p class="caption">(\#fig:exampleScatterPlot)The six graphs generated by the `example(ScatterPlot)`</p>
</div>

```

> par(op)

> detach(airquality)

> rm(test1)

> rm(test2)

> rm(op)
```




## BrailleR commands used in this chapter

The BrailleR versions of the `hist()` and  `boxplot()` commands replace those found in the `graphics` package. The BrailleR commands `ScatterPlot()` and `FittedLinePlot()` are specific to BrailleR and replace the functionality usually obtained through use of `plot()` and `abline()`.


