# Getting started with BrailleR {#GettingStarted}


The BrailleR package has been created for the benefit of blind people wishing to
get more out of R than it already offers --- which is actually quite a
lot!

## Accessibility of statistical software

A description of what makes statistical software accessible to the blind was given by [@GodfreyLoots2014JSS]. Many of the problems blind people face are a consequence of the failure of the specialist screen reading software we use to interact with graphical user interfaces.
 Many software applications are making use of graphics when once the information would be presented in text form with an accompanying graph. --- SPSS [@SPSS-Soft] is an example of this, and to a lesser extent so is the standard edition of Minitab [@Minitab-Soft]. The output from Minitab Express [@Minitab-Express] is a prime example of the worst possible presentation of information that was originally text; this product generates graphics that include text which is not readable by a blind person for all of its statistical output. The speech output software used by blind people can only interpret information that is text. As a guide, if the individual text in a window cannot be highlighted using the keyboard and not the mouse, then it is likely that this text will not be read for the blind user. 

It is true that some add-on packages for R also generate unreadable output, but as illustrated below, this is less of an issue than for software like SPSS or Minitab. 
[@GodfreyLoots2014JSS] gave more detailed scrutiny of R, SAS [@SAS-Soft] , SPSS, and Minitab. Of these four applications, R and SAS were clearly superior to SPSS and the standard edition of Minitab.

Some software applications have retained their historical links to the days when graphs and tables were rendered in well controlled monospace fonts --- Minitab for example. In such applications the user may still be able to produce an ASCII graphic instead of the more commonly used high resolution graphs expected of today's software (and user). In contrast, SAS and SPSS can use HTML to present information in well-formatted tables.  These output windows are preferred by blind users over the graph window displays but sometimes the amount of information is not easily understood. Presentation of output is often read by eye in a vertical direction, while speech output software will read line by line. Take for example, a multiple regression where the sighted reader may scan down the list of $p$~values in the right hand column; the same information being read aloud in line by line style could prove quite difficult to interpret. Blind users can use combinations of keys to move around HTML tables to speed up this process and avoid reading the intervening columns of output. While SPSS and SAS can deliver formatted HTML as a matter of course, R users must resort to the add-on packages, many of which are available on CRAN.

## Accessibility of graphics in statistical software

Access to graphical representations of information from mathematical or statistical software is quite limited, and therefore limits the blind user's capacity. To this author's knowledge, no mathematical or statistical software has the capability of directly linking to any hardware or software solutions that make the information presented in graphs immediately available. The scalable vector graphic (SVG) format can be used to present a graphic with text embedded into the file for creating access for a blind user [@BulatovGardner2004SVG,GardnerBulatov2010SVG]. 
Only a small number of statistical software applications have the capacity to create SVG files, but this capacity does not in itself create access because the text that makes them accessible must be added somehow; generally this is a  manual process. The World Wide Web Consortium has a recommendation on the use of SVGs in web content [@SVGStandard] and a number of add-on packages for R make use of SVG because of the opportunity to enrich a graphic's interactivity in webpages; see  [@MurrellPotter2014] for a more detailed discussion of these packages and their functionality. Of particular note is that there are different ways to create an SVG and care must be taken if the maximum accessibility for blind users is ever to be achieved.

In R, a graph can be saved as an SVG using the `svg()` command, but this approach  uses the Cairo SVG format; this has the unfortunate outcome that text is not always preserved as a string, and some shapes are represented by an unstructured set of straight lines [@GardnerBulatov2010SVG]. 
Retention of text as strings is crucial if modifications such as changing the font of any text to the  braille font of a user's choosing is to be managed easily. 
Use of the `gridSVG` package [@MurrellPotter2014] does lead to creation of SVG files that do keep strings of text intact and a hierarchy of graphical elements. These SVG files are more easily modified to create accessibility for blind users that have the technology to interpret them [@GardnerBulatov2010SVG].  
Any graph created in R using functions from the `graphics` package will need to be converted to the `grid` package system for generating graphics through use of the `gridGraphics` [@Murrell2015GridGraphics] package before they are exported in SVG format. Existence of the `gridSVG` and `gridGraphics`  packages means that it should be possible to automate the creation and addition of the necessary text information to the SVG so that the need for  human intervention is minimised.


Add-on scripts for screen reader software, such as JAWS [@JAWS], that attempt to interpret the graphs created by common spreadsheet software has been tried in the past. 
One major problem that results from the creation of these add-on scripts is that of maintenance; unfortunately, the add-on scripts for screen reader software support of spreadsheet applications has not kept pace with the developments of those applications sufficiently enough to give blind people access to the full range of graphs. Sporadic effort has been made at providing access to statistical software through the creation of add-on scripts for screen readers, but little effort was ever given to creating access to the content of graphics. It is unfortunate that these have also not been sufficiently maintained. In this respect the use of R or SAS currently hold an advantage over other commonly used software (notably SPSS and Minitab) for the blind user because no additional scripts for the screen reading software are required. [@GodfreyLoots2014JSS]. R and SAS also work well with the open source screen reader called NVDA [@NVDA].


In conclusion, it seems  that until such time as adaptive technology for creating immediate access via tactile images is commonly available, other solutions will continue to be relevant. In fact, even once the immediacy issue is overcome, there will be a place for solutions such as the `BrailleR` package as a complementary solution rather than a substitute.


## Accessibility of R

[@GodfreyRJournal] documented the ability to use R almost immediately after installation; only one minor change is recommended and can be achieved in less than a minute even when explained via email or a telephone call. For users of the Windows operating system, up until Windows XP, I always recommended running R in a terminal window instead of the GUI; the shortcut placed on the Windows desktop would then need to be pointed to `Rterm.exe` instead of `Rgui.exe`. 
Macintosh and Linux users are operational with no special actions required. 
Users of Windows Vista or Windows 7 did have an additional challenge of what appeared to be the screen locking up, or more exactly, the screen reader software  "losing focus" in the R terminal window. The solution for this problem, as  documented in [@GodfreyErhardtRJournalAddendum], was to hit the `Alt` key. 
Blind users now need to compare the combinations of screen reader and the terminal versus the GUI. 
The decision should be made by the individual user after some experimentation; their decision  may  depend on the skill level they have with their prefered screen reader and should be revisited at a later date.



## Installing the BrailleR package

To use the functionality of the BrailleR package you need to have it installed. The package has several dependencies so installation from the CRAN repository is recommended. This would be done by issuing the following two commands in an R session:

```r
chooseCRANmirror(ind=1)
install.packages("BrailleR")
```

If for some reason you have difficulty with the above commands, you can install the BrailleR package using a zip file version available from a CRAN repository or the latest version on GitHub. 

From time to time, you should check that you are using the most recent version of the BrailleR package. You  can update all installed packages using the commands:

```r
chooseCRANmirror(ind=1)
update.packages(ask=FALSE)
```

Once you've got the package installed, you still need to get it running in your current R session by issuing one last command. When you issue the first of the following lines, the package start messages will also appear.

```r
library(BrailleR)
```

You're ready to go!


### Some initial setting up instructions

When you first use the `library(BrailleR)` command, you will see some start up messages and a question. The rules of R packages include not writing to the user's hard drive without expressly asking them for permission to do so. If you do not want a folder for your `BrailleR` files then use the temporary folder which will be removed when you end your R session. This will mean you need to answer the question over the location of the `MyBrailleR` folder next time you issue the `library(BrailleR)` command though.

The welcome message from `BrailleR` suggests you issue the `GetGoing()` command. This will ask you a few questions that will help personalise your use of the `BrailleR` package. We will see how to alter these settings in Chapter blah later so don't panic if you don't do it all right the first time. You can re-issue the `GetGoing()` command again at any time.


The book you are reading now can be reached from your R session by issuing the command `BrailleRInAction()`. That might seem a bit much, but do remember you can use tab completion to avoid typing the whole command name out in full. You will probably need no more than `B`, `r`, `a`, then tab (which adds the rest of BrailleR), then `I` and one last tab; add the opening and closing parentheses and press the Enter key. This will open the front page of the book in your browser. A similar command, `BrailleRHome()`, will open the BrailleR Project home page.

Itis all too easy to feel you're doing it on your own, which even the most accomplished people have experienced. I put the `ThankYou()` command in the BrailleR package so that it would be easy to send me a message to tell me about your experiences as a blind person using R or to ask for help; it starts an email message to me.  I'm not the only blind person out there using R, and many of us are on an email list so that we can share ideas and solutions for problems, many of which are specific to blind users. The `JoinBlindRUG()` command will start the email needed to join the BlindRUG email list.

## What else do you need?

You obviously have R installed or an intention to do so soon if you are reading this document. Aside from R and the add-on packages that BrailleR needs, there are no other software requirements. There are several optional software installations that could make life easier if they are installed before you need them. In order of necessity, they are:

### The document converter --- pandoc

BrailleR requires the very useful file converter called pandoc. Get it from the 
[pandoc download page](https://github.com/jgm/pandoc/releases)

### The principal integrated development environment --- RStudio

It is a good idea to install RStudio, even if you can't actually use it as a blind person using screen reading software. The reason is that RStudio installs a few other useful tools that we will make use of by other means. Get it from the
[RStudio download page](https://www.rstudio.com/products/rstudio/download2)

### One programming language --- Python

WriteR is a simple text editor written in wxPython that needs Python27 and wxPython. Unfortunately, they are two separate downloads at present. You do not need this editor so do not install Python unless you are really keen. Windows users can obtain an executable file by issuing `GetWriteR()` once the BrailleR package has been successfully installed. More on this in Chapter #WriteR



## BrailleR commands used in this chapter

The only BrailleR command actually recommended in this chapter was `GetGoing()`. You might find it useful to use `BrailleRHome()` and `BrailleRInAction()` from time to time, but you're already reading the book that the second of these commands opens. 

The `ThankYou()` and `JoinBlindRUG()` commands should be used when you want to connect with me, or other blind R users.

At this stage it is recommended that you install any additional software manually when it is required.


## References
