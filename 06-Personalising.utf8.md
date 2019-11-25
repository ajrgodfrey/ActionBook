# Personalising BrailleR {#Personalising}


## General

Once you've played with a few examples, you might want to settle on the way you want BrailleR to work for you.
There are a wide range of options needed to get the best out of the `BrailleR` package  specific to each user, and perhaps for each user who wants specific settings to be in play for different projects. All `BrailleR` settings are stored in a local file, and also in a global file. These files are both called `BrailleROptions`. The global settings file is located in a folder called `MyBrailleR` which is located where you let `BrailleR` choose when you first loaded the package using the `library(BrailleR)` command. You could have let this be a temporary location so you will be asked every time you start `BrailleR` until you let the standard location be used.

The `BrailleROptions` file in the `MyBrailleR` folder will be used unless a local version is found. This local file will be in the working directory being used when the package is loaded.



## Settings that are about you


### Who is the R markdown file being written by?

You might want your analyses to use your name instead of the default name `BrailleR`. Do this using the `SetAuthor()` function. e.g.

```r
SetAuthor("Jonathan Godfrey")
```
OK, you ought to use your name not mine, but you get the point.

This will have an instant impact, even on the examples for `BrailleR` functions. Set the author and then try `example(UniDesc)` for example.

### The use of the VI() command

The `BrailleR` package was intended for use by blind people, but we need to see more in text than do most people in our intended audiences. You may wish to turn off or on the use of the output generated by the `VI()` commands throughout the R markdown files written by such commands as `UniDesc()	` etc. Do this using the functions `GoBlind()` to use the `VI()` command, and `GoSighted()` to turn it off.

I think a standard workflow might be to start `BrailleR`, do some analyses using `UniDesc()` or `OnePredictor()` and the like, and then having worked out what was working well, use `GoSighted()` and re-issue the commands that you want to share with others. Don't forget to `GoBlind()` again though so that you can get the text descriptions back when you need them.

## Settings for saving 


## BrailleR commands used in this chapter



`SetAuthor()`, `GoBlind()` and `GoSighted()`, 
