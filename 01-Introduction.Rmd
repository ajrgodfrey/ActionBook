# Introduction {#introduction}

The BrailleR Project started back in 2011 when I observed blind students working with R and struggling more than I thought was truly necessary. I knew I could do something about it and have spent a lot of time doing so ever since.



## Why will I use the BrailleR package as a novice?

Blind users will want to use the BrailleR package while they are novice R users, but may also want to continue using some of the tools as their skill levels increase. Each of the following reasons for using the BrailleR package are expanded on by way of examples that go into more detail in subsequent chapters of this text.

### BrailleR improves the accessibility of graphical information 

BrailleR converts standard graphs created by standard R commands into a textual form that can
be interpreted by blind students who cannot access the graphs without
printing the image to a tactile embosser, or who need the extra text to
support any tactile images they do create.

At present this is limited to only a few graph types found in base R functionality. An example of a histogram is presented in Chapter \@ref(VI).  

### BrailleR helps gain access to the content of the R console

BrailleR makes text output (that is
visually appealing) more useful for a blind user who is reliant on
synthesized speech or braille output to interpret the results. The first example of this kind presented in Chapter \@ref(VI) shows how the summary statistics for a dataset can be made easier for a screen reader user.


### BrailleR includes convenience functions

Many analyses get repeated over and over again with different variables. Some people like a graphical user interface (GUI) but none of the GUIs developed for R to date are accessible by screen reader users.

BrailleR includes some functions which generate pro forma analyses. When these functions are employed, they generate an HTML document that includes the analysis in an easy to use format. The R commands used to create the analysis are stored in an R script file so that a user can modify the commands if changes are necessary. These functions are introduced in Chapter \@ref(RMarkdown).



## Why will I use the BrailleR package if I am not a novice?

I think some of the reasons for using the package while you are  a novice R user remain relevant to more-experienced users too, but perhaps the main reason for continuing to use BrailleR is that of efficiency. 
The convenience functions introduced in Chapter \@ref(RMarkdown) give you a starting point for analyses. Behind those convenience functions was an R markdown file that generated the R script and the HTML document. Getting into markdown is a great idea and will not take you long to learn.

BrailleR also includes some tools for helping run your R jobs without running R. Experienced users do this all the time so these tools aren't really meant for blind users alone.
 

