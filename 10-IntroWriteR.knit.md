# Getting started with the WriteR application {#WriteR}

The WriteR application was written to support use of R markdown and the `BrailleR` package. It is a Python script making use of wxPython to help build the graphic user interface (GUI) in such a way that it works for screen reader users. This book has been written in R markdown, and I have made extensive use of WriteR because it offers so many convenient tools for a blind user wanting to write R markdown files.

The script is in the `BrailleR` package, but it cannot run unless the user has both Python and wxPython installed. Commands have been included in the `BrailleR` package to help Windows users obtain installation files for them. Users of other operating systems currently have to install Pandoc, Python and WxPython independently, but these tools may well already be installed.

## Getting the required software (Windows users only)

You can check if a version of Python is already installed on your computer using

```r
Sys.which("Python")
```

```
##                               Python 
## "C:\\PROGRA~1\\Python38\\Python.exe"
```

The output above shows you that I have Python 3.8 installed on my computer, and that it can be found in the folder I know is the default location. You can use this command later to check your progress, but there are other ways to check that return more useful detail What it does not show you is whether the installation of Python is suited for a 64 bit machine, or is the more universal 32 bit installation. We must have an exact match between the version of Python and the version of R being used.

The files downloaded as a consequence of running commands in this set of instructions will be saved in your `MyBrailleR` folder. You will need to follow the instructions and answer questions that arise whenever you install new software, but you should probably read all the way through this set of instructions before getting underway. 

Ultimately, you will need a mainstream tool to process the markdown files you write into other formats. The WriteR application will end up using a tool called "pandoc" to do this so we need to get this installed.
If you do not have an installation of Pandoc and Python 3 then you can use some functions from the `BrailleR` package to help make the setup smoother. Remember to load the package using:
 
`library(BrailleR)`

It doesn't matter if you install Python before or after Pandoc. 

### Installing Pandoc

Let's first install Pandoc using the command:

`GetPandoc()`

To check that you have Pandoc installed, and that R can therefore find it, use the command"



```r
Sys.which("pandoc")
```

```
##                             pandoc 
## "C:\\PROGRA~2\\Pandoc\\pandoc.exe"
```

which will show where Pandoc was installed.

### Installing Python


The following  instructions fetch the installation files from the reputable Python sites. Windows and any security software you might have should know that, but you can never tell! You may need to let Windows know it is OK to install the software in the default location. The pop-up might not appear as the window with focus so if things look like they're going slowly, look around for the pop-up window.


The following  commands automatically download the installation files needed for Python 3.x, and start the installation process going. 
Issue them at the R prompt

`GetPython3()`

Make sure that the first thing you do as part of the installation is to choose to use a custom installation. This allows you to make sure Python will be availabel to all users, update the system's environment variables. You may need to make sure these options are selected.

You need to make sure that the second of these options definitely happens; this ensures that the Python folders are added to your system path which means R and any other software that wants Python can find it. This makes it possible to run Python scripts from any folder on your computer. The next few commands will fail if this is not done properly. If you missed that step during the installation, look for the installer file in your `MyBrailleR` folder and run it again manually before proceeding.

We can check the installation has worked properly at this point using:








