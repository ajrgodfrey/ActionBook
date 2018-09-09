# Introduction {#introduction}




Access to information is crucial for a blind person's success in education, but transferring the knowledge about the existence of techniques into actually being able to perform those tasks is what will make that blind person employable. This paper is based on the author's  experiences as a blind academic in statistics who has often been called on for advice by blind students studying statistics and their sighted lecturers wanting to provide the best possible support. Unfortunately, there is little information available in academic journals or the public domain to offer the  statistics lecturer  who is about to teach a blind student for the first time. 

At the 2009 Workshop on E-Inclusion in Mathematics and Sciences, I was able to meet other researchers and scientists who are also concerned about the low rate of blind people entering the sciences in a broad sense and the mathematical sciences in particular. [@Godfrey2009AccessiblePaper] presented my first formalized summary of what I saw as the current state of affairs for blind people taking statistics courses; that work discussed what was possible in theory, but lacked evidence of what was happening in practice.
A collaboration with the only other blind person to gain employment as a full-time Lecturer in Statistics  led to a more comprehensive review of what we believe is the current state of affairs for blind students learning statistics. [@GodfreyLoots-JSE] present a  wide range of issues that blind students and their teachers must overcome, often  through use of the best software options available today. R [@Rpkg-base] has featured as a key element in  my recommendations for teaching statistics to blind students [@Godfrey2009AccessiblePaper] because it offers the greatest opportunity for meeting the needs of blind users. 

An invitation to attend the [second "Summer University" event](http://icchp-su.net/)  was taken up in mid 2011; the purpose of this event  was to show blind students and disability support staff from universities what software and hardware is available to improve the success rates of blind students entering the sciences. 
This was my first direct opportunity to show blind students how R could be used by them, and the relative merit that R has for them over alternative statistical software. 
I observed blind students working with R and struggling more than I thought was truly necessary. I knew I could do something about it and have spent a lot of time doing so ever since.
An R Journal article [@GodfreyRJournal] followed which exposed the needs of blind users to the R community and also announced the initial development of the `BrailleR` package.

The `BrailleR` package is my attempt to help blind students and their lecturers. It is built on functions that I use to work as a lecturer in statistics. It aims to make up for the inability blind users have to work with the same extension tools their sighted peers are using, including the increasing number of graphical user interface (GUI) and integrated development environment (IDE) options.


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

BrailleR also includes some tools for helping run your R jobs without running R. Experienced users do this all the time so these tools aren't really meant for blind users alone, but as blind people often find little inefficiencies tiresome, I've incorporated the tools I use for my own efficiency when I think they might prove useful to other blind people.
 


In summary, the `BrailleR` package is my attempt to help blind students and their lecturers. It is built on functions that I use to work as a lecturer in statistics. It aims to make up for the inability blind users have to work with the same extension tools their sighted peers are using, including the increasing reliance on GUIs and integrated development environment (IDE) options.
