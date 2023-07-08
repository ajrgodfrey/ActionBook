# Introduction {#introduction}

Access to information is crucial for a blind person's success in education, but transferring the knowledge about the existence of techniques into actually being able to perform those tasks is what will make that blind person employable. This e-book is based on the author's  experiences as a blind academic in statistics who has often been called on for advice by blind students studying statistics and their sighted lecturers wanting to provide the best possible support. Unfortunately, there is little information available in academic journals or the public domain to offer the  statistics lecturer  who is about to teach a blind student for the first time. That is changing however.

At the 2009 Workshop on E-Inclusion in Mathematics and Sciences, I was able to meet other researchers and scientists who are also concerned about the low rate of blind people entering the sciences in a broad sense and the mathematical sciences in particular. [@Godfrey2009AccessiblePaper] presented my first formalized summary of what I saw as the current state of affairs for blind people taking statistics courses; that work discussed what was possible in theory, but lacked evidence of what was happening in practice.
A collaboration with the only other blind person to gain employment as a full-time Lecturer in Statistics  led to a more comprehensive review of what we believe is the current state of affairs for blind students learning statistics. [@GodfreyLoots-JSE] present a  wide range of issues that blind students and their teachers must overcome, often  through use of the best software options available today. R [@Rpkg-base] has featured as a key element in  my recommendations for teaching statistics to blind students [@Godfrey2009AccessiblePaper] because it offers the greatest opportunity for meeting the needs of blind users. 

An invitation to attend the [second "Summer University" event](http://icchp-su.net/)  was taken up in mid 2011; the purpose of this event  was to show blind students and disability support staff from universities what software and hardware is available to improve the success rates of blind students entering the sciences. 
This was my first direct opportunity to show blind students how R could be used by them, and the relative merit that R has for them over alternative statistical software. 
I observed blind students working with R and struggling more than I thought was truly necessary. I knew I could do something about it and have spent a lot of time doing so ever since.
An R Journal article [@GodfreyRJournal] followed which exposed the needs of blind users to the R community and also announced the initial development of the `BrailleR` package [@Rpkg-BrailleR].

The `BrailleR` package is my attempt to help blind students and their lecturers. It is built on functions that I use to work as a lecturer in statistics. It aims to make up for the inability blind users have to work with the same extension tools their sighted peers are using, including the increasing number of graphical user interface (GUI) and integrated development environment (IDE) options.


## Why will I use the BrailleR package as a novice?

Blind users will want to use the BrailleR package while they are novice R users, but may also want to continue using some of the tools as their skill levels increase. Each of the following reasons for using the BrailleR package are expanded on by way of examples that go into more detail in subsequent chapters of this text.

### BrailleR improves the accessibility of graphical information 

BrailleR converts standard graphs created by standard R commands into a textual form that can
be interpreted by blind students who cannot access the graphs without
printing the image to a tactile embosser, or who need the extra text to
support any tactile images they do create.

For many years, this was limited to only a few graph types found in base R functionality. An example of a histogram is presented in Chapter \@ref(VI).  
More recently however, many R users are making use of the `ggplot2` package to create graphs.

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

BrailleR also includes some tools for helping run your R jobs without running R. Experienced users do this all the time so these tools aren't really meant for blind users alone, but as blind people often find little inefficiencies tiresome, I've incorporated the tools I use for my own efficiency when I think they might prove useful to other blind people.
 


In summary, the `BrailleR` package is my attempt to help blind students and their lecturers. It is built on functions that I use to work as a lecturer in statistics. It aims to make up for the inability blind users have to work with the same extension tools their sighted peers are using, including the increasing reliance on GUIs and integrated development environment (IDE) options.


## Why will I use this book?

This book has been compiled for a variety of reasons. The obvious reason is that the `BrailleR` package has many tools that cannot be demonstrated using the standard documentation options found in many packages. Some of the material found here did start in package vignettes, but the time taken to re-work them all was slowing down development of the package. 

A key feature of this book is that it was written by a blind person, using only the tools the book suggests, to create a book that can be read by blind people. This end to end workflow is proof that the `BrailleR` package helps make some actions possible, and others easier for a blind person to undertake. All too often, blind people find themselves using substitute workflows that are painfully slow compared to the tools being used by our sighted peers. I'm not suggesting that the tools here will make a blind person more efficient than all of their peers, but being able to use the most efficient tools that sighted people could choose to use does matter. Using these tools will cut the disadvantage a blind person has to a minimum; I'd even go so far as to suggest that the gap between a blind person and a sighted person's efficiency  is reduced if we use the best tools on offer as compared to the gap we'd suffer if we chose to use inferior tools. 

## What this book is not

This book is not a comprehensive guide to using R. There are now hundreds of books a blind (or sighted) person could choose to wade through, some are good, some are great, and some are truly awesome! There are also plenty of resources on the internet that are tired and really should be avoided. I am keen to promote those texts that can be easily worked with by a blind user. I'll mention them as we get to the right point in this book for doing so, but now is a good time to mention a few that have really made a difference to me and creation of this book.

I am truly reliant on the resources offered by help pages hosted by RStudio. I often include RStudio.com in my list of search terms. In adition, many of the individuals I hold in very high regard have close ties to RStudio, now known as Posit. 

Yihui Xie's work on the `knitr` package [@Rpkg-knitr] 
and his books on writing documents using reproducible research techniques [@Xie2015]
are key to my success and in my opinion, have also led to making life much easier for blind users to read the work of others and to create new content for themselves.

I frequently use several books written by Hadley Wickham and his collaborators. In particular, I rate the [R packages book](http://r-pkgs.had.co.nz/) [@Wickham2015RPackages], the [Advanced R book](https://adv-r.hadley.nz)  [@Wickham2014Advanced', and the [R for Data Science book](http://r4ds.had.co.nz/) [@GrolemundWickham2016].






