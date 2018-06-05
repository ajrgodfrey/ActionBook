# New BrailleR commands for making basic graphs {#NewGraphs}


This chapter introduces some of the new commands found in the `BrailleR` package that are substitutes for other functions found in the base distribution of R. You can jump ahead to the examples, but there is some theory needed to explain how the `BrailleR` package does the extra work it does, and why we need to use these substitute commands.




You will need the `BrailleR` package to be ready for use to follow along with the examples in this chapter. Do this by issuing the command `library(BrailleR)` now.



## Background

In Chapter \@ref(VI), we saw creation of a histogram using the `hist()` command. The `hist()` command used for many years is found in the `graphics` package and has its own `plot()` command called `plot.histogram()` as well. This `plot()` command is actually a family of commands that all start with`plot.*()` where the star is replaced by the type of object that is being plotted. We use this `plot()` command all the time to give us plots for different reasons. When we fit a regression model, we need to create various plots of the residuals and it is done using `plot()` which actually employs `plot.lm()` in the background to do the work. The family of commands are referred to as "methods" and the types of objects being worked on are called "classes".  We need a little more background before diving into the various new commands BrailleR offers.

### Methods and classes

Methods and classes are important ideas because we can write a method function that says how we want an object with a stated class to be processed. When we create a histogram with the `hist()` command we can store an object of class "histogram", and when we create a regression model using `lm()` we create an object of class "lm". This class attribute is stored when many objects are created by R commands and many classes have methods written for them such as `print()`, `summary()`, and `plot()`.

If data is stored with a specified class attribute, such as a time series with class "ts", we will generate different results from employing the methods. A data.frame is itself of  class "data.frame", a matrix is of class "matrix", but rather confusingly,  a vector is not of class "vector". Vectors are assigned class attributes that depend on the type of data being stored, being "integer", "numeric", "logical", "character", etc.


### Who cares about classes anyway?

It is a reasonable question to ask. BrailleR cares because the functions written such as the `VI()` command used in  Chapter \@ref(VI) is actually a family of commands. The `VI()` commands called actually refered to the `VI.histogram()` and `VI.data.frame()` commands to generate output that is sensitive to the object of interest.

So for the `VI()` command to do the processing necessary to extract the information that is pushed into a graphic or textual output, we need to know what kind of object was being created. For the examples shown in Chapter \@ref(VI), that was done with the standard R commands used when creating the histogram and the data.frame we used. Well that's almost true. The standard `hist()` command from the base distribution of R does assign the class "histogram" to the stored object, but it doesn't have all the necessary information in it to replicate a plotted histogram. The solution is to create a new `hist()` command in the `BrailleR` package that does all the work of the original function and does add the details we want to help describe the histogram being plotted.



## Example: A histogram

One of the easiest ways to demonstrate code snippets is to include them in the help documentation of the function. Running these examples is possible using the `example()` command. 

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
 [1] -4.0 -3.5 -3.0 -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5
[15]  3.0  3.5  4.0

$counts
 [1]   1   3   3  11  48  96 156 194 184 154  92  33  17   6   1   1

$density
 [1] 0.002 0.006 0.006 0.022 0.096 0.192 0.312 0.388 0.368 0.308 0.184
[12] 0.066 0.034 0.012 0.002 0.002

$mids
 [1] -3.75 -3.25 -2.75 -2.25 -1.75 -1.25 -0.75 -0.25  0.25  0.75  1.25
[12]  1.75  2.25  2.75  3.25  3.75

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
 [1] -4.0 -3.5 -3.0 -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5
[15]  3.0  3.5  4.0

$counts
 [1]   1   3   3  11  48  96 156 194 184 154  92  33  17   6   1   1

$density
 [1] 0.002 0.006 0.006 0.022 0.096 0.192 0.312 0.388 0.368 0.308 0.184
[12] 0.066 0.034 0.012 0.002 0.002

$mids
 [1] -3.75 -3.25 -2.75 -2.25 -1.75 -1.25 -0.75 -0.25  0.25  0.75  1.25
[12]  1.75  2.25  2.75  3.25  3.75

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
[1] 16

$par
$par$xaxp
[1] -4  4  4

$par$yaxp
[1]   0 200   4


$xTicks
[1] -4 -2  0  2  4

$yTicks
[1]   0  50 100 150 200

attr(,"class")
[1] "Augmented" "histogram"

> VI(MyHist)
This is a histogram, with the title: Histogram of x
"x" is marked on the x-axis.
Tick marks for the x-axis are at: -4, -2, 0, 2, and 4 
There are a total of 1000 elements for this variable.
Tick marks for the y-axis are at: 0, 50, 100, 150, and 200 
It has 16 bins with equal widths, starting at -4 and ending at 4 .
The mids and counts for the bins are:
mid = -3.75  count = 1 
mid = -3.25  count = 3 
mid = -2.75  count = 3 
mid = -2.25  count = 11 
mid = -1.75  count = 48 
mid = -1.25  count = 96 
mid = -0.75  count = 156 
mid = -0.25  count = 194 
mid = 0.25  count = 184 
mid = 0.75  count = 154 
mid = 1.25  count = 92 
mid = 1.75  count = 33 
mid = 2.25  count = 17 
mid = 2.75  count = 6 
mid = 3.25  count = 1 
mid = 3.75  count = 1
```

When you first issued the `library(BrailleR)` command, there were several warnings printed out. One of them told you that the `hist()` function from the `graphics` package was masked by the `BrailleR` version. This means that when you use `hist()`, it is the `BrailleR` version being used.

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


