# Getting started with the WriteR application {#WriteR}




The WriteR application was written to support use of R markdown and the `BrailleR` package. It is a Python script making use of wxPython to help build the graphic user interface (GUI) in such a way that it works for screen reader users. This book has been written in R markdown, and I have made extensive use of WriteR because it offers so many convenient tools for a blind user wanting to write R markdown files.

The script is in the `BrailleR` package, but it cannot run unless the user has both Python and wxPython installed. Commands have been included in the `BrailleR` package to help Windows users obtain installation files for them. Users of other operating systems currently have to install Pandoc, Python and wxPython independently, but these tools may well already be installed.


## Getting a stand alone version of WriteR

Windows users who do not feel comfortable installing or using Python can make use of a pre-compiled installer. You will still need to look at getting Pandoc (described below) and of course you've already got R installed.

To get a copy of the installer, go to the [https://r-resources.massey.ac.nz/WriteR/](WriteR home page.) If you do use the installer, you can skip the next section because you do not need to install Python.



## Getting the right version of Python (Windows users only)

N.B. The files downloaded as a consequence of running commands in this section will be saved in your `MyBrailleR` folder. You will need to follow the instructions and answer questions that arise whenever you install new software, but you should probably read all the way through this set of instructions before getting underway. 

You can check if a version of Python is already installed on your computer using

```r
Sys.which("Python")
```

```
                              Python 
"C:\\PROGRA~1\\Python38\\Python.exe" 
```

The output above shows you that I have Python 3 installed on my computer, and that it can be found in the folder I know is the default location. You can use this command later to check your progress, but there are other ways to check your system that return more useful detail, but for the moment the `Sys.which()` command above issufficient.  What it does not show you is whether the installation of Python is suited for a 64 bit machine, or is the more universal 32 bit installation. We really ought to have an exact match between the version of Python and the version of R being used.


The following  instructions fetch the installation files from the reputable Python sites. Windows and any security software you might have should know that, but you can never tell! You may need to let Windows know it is OK to install the software in the default location. The pop-up might not appear as the window with focus so if things look like they're going slowly, look around for the pop-up window.


The following  commands automatically download the installation files needed for Python 3.x, and start the installation process going. 
Issue them at the R prompt

`GetPython3()`

Make sure that the first thing you do as part of the installation is to choose to use a custom installation. This allows you to make sure Python will be availabel to all users, and update the system's environment variables. You may need to make sure these options are selected.

You need to make sure that the second of these options definitely happens; this ensures that the Python folders are added to your system path which means R and any other software that wants Python can find it. This makes it possible to run Python scripts from any folder on your computer. The next few commands will fail if this is not done properly. If you missed that step during the installation, look for the installer file in your `MyBrailleR` folder and run it again manually before proceeding.

We can check the installation has worked properly at this point using:

```r
Sys.which("python")
```

```
                              python 
"C:\\PROGRA~1\\Python38\\python.exe" 
```

```r
shell("path", intern=TRUE)
```

```
[1] "PATH=C:\\Program Files\\Python38\\Scripts\\;C:\\Program Files\\Python38\\;C:\\Program Files\\Python310\\Scripts\\;C:\\Program Files\\Python310\\;C:\\windows\\system32;C:\\windows;C:\\windows\\System32\\Wbem;C:\\windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\windows\\System32\\OpenSSH\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\MiKTeX\\miktex\\bin\\x64\\;C:\\batch;C:\\Program Files\\Pandoc\\;C:\\Program Files (x86)\\dotnet\\;C:\\Program Files\\dotnet\\;C:\\Users\\ajgodfre\\AppData\\Local\\Microsoft\\WindowsApps;"
```

This is a much stronger test than was done earlier. You can see the folders that Windows will search through to find the tools you are using all the time. The folder for Python needs to be listed there somewhere.

Now get the additional Python modules needed for WriteR using:
 
`GetWxPython3()`

## Installing Pandoc (Windows users)

N.B. The files downloaded as a consequence of running commands in this set of instructions will be saved in your `MyBrailleR` folder. You will need to follow the instructions and answer questions that arise whenever you install new software, but you should probably read all the way through this set of instructions before getting underway. 

Ultimately, you will need a mainstream tool to process the markdown files you write into other formats. The WriteR application will end up using a tool called "pandoc" to do this so we need to get this installed.
If you do not have an installation of Pandoc then you can use functions from the `BrailleR` package to help make the setup smoother. Remember to load the package using:
 
`library(BrailleR)`


Let's first install Pandoc using the command:

`GetPandoc()`

To check that you have Pandoc installed, and that R can therefore find it, use the command"



```r
Sys.which("pandoc")
```

```
                            pandoc 
"C:\\PROGRA~1\\Pandoc\\pandoc.exe" 
```

which will show where Pandoc was installed.



Once you have completed this installation, you are ready to go. You shouldn't need to keep the  installation file,  but why not keep it just in case.

You can now skip to the section which shows you how to check everything is ready for using WriteR.



## Other operating systems


Anyone using another operating system will have to take the Python scripts to a sensible place on their computer. You will need to have an installationof Python and the necessary additional modules the scripts use. This includes wxPython.

## Checking your system is ready



All going to plan, you should now have Python on your system, and the additional wxPython module as well. You only need to check that R really can see the right version of Python, and that one extra Python module is correctly installed and available to R to find out how well you've done,  using:


```r
TestWX()
```

```
Your system is using Python 3.8.0
```

```
Python can see the necessary wx module.
You are ready to use WriteR.
```

N.B. The command will return more output on your system if you test the function in an interactive setting. Do that now.

The outcome of this command tells you if your system is ready to run the WriteR application. It first checks that a version of Python is available, and if there is, then runs a short script that uses WxPython. 

If you are in an interactive session, and Python is all working, then a small window will have opened  on your system, and told you that you are ready to use WriteR.

If for some reason you are not getting it all going properly, then there are several commands that can be issued at a command prompt. Windows users get a command prompt by typing `cmd` at the `Run` (Found by `Windows+R`). 

The following commands are not R commands. They should work on all operating systems. Do not proceed until each has worked without error messages.

1.Typing
```
python --version
```
will tell you if Python is installed by returning the version number.
2. Make sure you can use the tool that grabs extra Python modules from an official site by typing
```
pip --version
```
If this doesn't work you will need to seek out the correct strategy via the Python wiki pages available online.
3. Upgrade your Python modules using
```
python -m pip install --user --upgrade pip setuptools wheel
```
This should download a few files and automatically put them on your system.
4. Finally, install the wxPython module using
```
pip install --user --upgrade wxPython
```

Remember, do not move on to the next step until each of the commands above has returned satisfactory feedback. Windows users close the window using `Alt+F4` or by typing `exit`.

I strongly recommend that you go back and check everything has worked using the commands presented earlier in this chapter.



## Opening WriteR from BrailleR

Opening WriteR is as easy as typing WriteR! Well almost. You have the option of specifying a filename; if that file exists, it gets opened for you, and if it doesn't exist, then it gets created with a few lines already included at the top to help get you started. Try:

`WriteR("MyFirst.Rmd")`

This should open the WriteR application with the following lines already there for you to edit. 

```
---
title: ""
author: ""
date: ""
output:
    html_document:
        toc: false
        number_sections: false
        fig_height: 5
        fig_width: 7
--- 
```

Some of these lines were explained back in Chapter \@ref(WorkingBlind). Fill in the gaps in the first few lines for title, author, and the date before continuing.

## What can I do with WriteR?

The window you are in has a number of menus, a status bar at the bottom and a big space in the middle for your work. Take a quick look at those menus; some will look familiar because they are common to many Windows applications.

The file you have opened is a markdown file. It is just text which is why it is so easy to read. The file extension of `Rmd` means it is an R markdown file. There are several flavours of markdown in common use, but they are practically all the same except for some very minor differences.

A markdown file can be converted into many file formats for distribution. These include HTML, pdf, Microsoft Word, Open Office, and a number of different slide presentation formats. Let's make the HTML file now.


## Our first HTML file

Making your first HTML file is as easy as hitting the `f5` key, or using one of the options in the `Build` menu. The variety of options are the commonly used ones in RStudio. Let's just stick to making an HTML file for the time being. You can investigate other formats later.

When the processing is underway, a second window will open which gives the same output that you would see printed in an R session window if you were processing R markdown files manually. 
If the last line says "done 0", then everything processed properly; if it says "done 1" then there was an error to fix, so look through this log to see what went wrong. 

The processing  of your R markdown document will use a suite of packages, primarily including the `knitr` [@Rpkg-knitr] and `rmarkdown` [@Rpkg-rmarkdown] packages.
Press the `f4` key to switch back to the main document editing window in WriteR.

If the processing of the file "MyFirst.Rmd" was successful, then you will now have a file called "MyFirst.html" in your current working directory. You have several choices for finding the HTML file you have created:

-  Navigate to the current working directory using your file browser. To find out where that is, type `getwd()` in the R window to see where the files really are located, or if you are a Windows user, issue the `BrailleR` function `Explorer()` to opent he folder automatically. 
You should see the file `MyFirst.Rmd` and once you have built it, the associated HTML file. Open that file in your browser.
- Use the `browseURL()` command in the R session. You will need to provide the filename, in quotes, for example `browseURL("MyFirst.html")`

Use one of these methods to open the HTML file. Read through it to see how the markdown has been rendered. 
You may need to switch back and forth between the WriteR window and your browser to compare the plain text and the beautiful HTML. If you didn't actually edit the R markdown file up to now then the output HTML file will be rather boring. Add in some text, or use the menus to see how to insert headings and other things.

N.B. Changes in your R markdown file are not automatically converted into the HTML file. You must re-build the HTML, and refresh your browser to see the impact of any changes you make, both actions use the `f5` key.


## Some hints for writing Rmarkdown documents

The WriteR application really can make writing documents easier because it offers plenty of shortcut keystrokes for items in the pulldown menus. Formatting text in a markdown document which will be converted to HTML is done in a way that creates semantic structure at the same time as font changes, or to put more precisely, you can't get a larger font for a heading without using a proper heading style. My list of hints given here are to help make your final HTML document a pleasure to read as well as easy to write.

- Always  use the standard markdown syntax for inserting headings, graphics, links, and equations. WriteR will insert placeholders for graphics and links and some mathematical structures.
- Concentrate on the material to be communicated; do not worry about the formatting of it. Keeping it simple is best.
- Make use of the lessons learned by others. If you like the way something is presented, then re-use the approach taken.
- if you insert a graph created in an R chunk, then make sure you use the `fig.cap` properly. This text will be used as the caption for the graph in your document. If you use a `fig.alt` tag, you will get  an "alt tag" for the resulting graph as well; if you don't use `fig.alt` but do provide `fig.cap` then you'll have the caption used for the alt text as well.
- One figure per chunk is recommended. This helps with the alt tags.
- The default presentation of R output is to have three hash signs at the left of each line of output.  Inclusion of an R chunk at the start of the document can fix this. Use something like:
````

```r
library(knitr)
opts_chunk$set(comment="")
```
````


I found the flow of some documents was unnecessarily clunky when simple mathematical elements were entered as math mode elements. Sentences will read better if *x* and *y* are in italicised font and not math mode, and the sighted readers won't notice the difference. This won't work for Greek, some subscripts and superscripts, or symbols. If in doubt, use math mode everywhere. This means using a dollar on both sides of the mathematical content such as `$x$` for example.

The method used to convert your raw markdown to beautiful HTML will matter. WriteR has been configured to use `render()` from the `rmarkdown` package as it delivers the best outcome for screen reader users.

Finally, you should investigate which combination of screen reader and browser gives you the results you like best. I regularly make use of both JAWS and NVDA, and my preferred browser has changed over the years. I used to only ever use Firefox, but Chrome gets more use today; both Internet Explorer and Opera have both been used at times.

## BrailleR commands used in this chapter

We used `TestWX()` to check the necessary Python installations were successful. It automatically called the `TestPython()` command as its first step.

We needed to use `GetPython3()`  and `GetWxPython3()` to install the necessary software to run a Python script like WriteR. 

Finally, we opened a new file using `WriteR()`.

