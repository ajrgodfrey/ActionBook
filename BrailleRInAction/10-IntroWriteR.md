# Getting started with the WriteR application {#WriteR}


The WriteR application was written to support use of R markdown and the BrailleR package. It is a Python script making use of wxPython to help build the graphic user interface (GUI) in such a way that it works for screen reader users. This book has been written in R markdown, and the author has made extensive use of WriteR because it offers so many convenient tools for a blind user wanting to write R markdown files.

The script is in the BrailleR package, but it cannot run unless the user has both Python and wxPython installed. Two commands have been included in the BrailleR package to help Windows users obtain installation files for them. Users of other operating systems currently have to install Python and WxPython independently.

## Getting Python and wxPython (Windows users only)

Issue the following commands at the R prompt

`library(BrailleR)`

`GetPython27()`

`GetWxPython27()`

These commands automatically download the installation files and start the installation process going. The downloaded files will be saved in your MyBrailleR folder. You will need to follow the instructions and answer questions that arise whenever you install new software. These are reputable installation files from the primary sites for Python and wxPython. Windows and any security software you might have should know that, but you can never tell! You will probably need to let Windows know it is OK to install the software in the default location. That pop-up might not appear as the window with focus so if things look like they're going slowly, look around for the pop-up window.

Once you have completed both installations, you are ready to go. You shouldn't need those installation files again, but keep them just in case.

## Opening WriteR from BrailleR

Opening WriteR is as easy as typing WriteR! Well almost. You have the option of specifying a filename; if that file exists, it gets opened for you, and if it doesn't exist, then it gets created with a few lines already included at the top to help get you started. Try:

`WriteR("MyFirst.Rmd")`



## What can I do with WriteR?

The window you are in has a number of menus, a status bar at the bottom and a big space in the middle for your work. Take a quick look at those menus; some will look familiar because they are common to many Windows applications.

The file you have open is a markdown file. It is just text which is why it is so easy to read. The file extension of `Rmd` means it is an R markdown file. There are several flavours of markdown in common use, but they are practically all the same except for some very minor differences.

A markdown file can be converted into many file formats for distribution. These include HTML, pdf, Microsoft Word, Open Office, and a number of different slide presentation formats. Let's make the HTML file now.


## Our first HTML file

Making your first HTML file is as easy as hitting a single key, or using one of the options in the `Build` menu. The variety of options are the commonly used ones in RStudio.

Navigate to the current working directory using your file browser. To find out where that is, type `getwd()` back in the R window. You should see the file `MyFirst.Rmd` and once you have built it, the associated HTML file.

Open the HTML file and see how the markdown has been rendered. You may need to switch back and forth between the WriteR window and your browser to compare the plain text and the beautiful HTML.


## BrailleR commands used in this chapter

We needed to use `GetPython27()` and `GetWxPython27()` to install the necessary software to allow us to run a Python script like WriteR. We then opened a new file using `WriteR()`.

