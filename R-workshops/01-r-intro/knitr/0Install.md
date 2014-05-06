Installation
===

To download R you can visit [R's homepage](http://cran.r-project.org/) and follow the link for your operating system.

Alternatively if you trust clicking a link from here to download R you can click one of the following:
* Windows Users: [Installer for R 3.0.0](http://cran.r-project.org/bin/windows/base/)
* Mac OS X: [Pkg for R 3.0.0](http://cran.r-project.org/bin/macosx/)
* Linux users: You can compile [the source code](http://cran.r-project.org/bin/linux/) in the usual way but most likely you can find R in the repository for whichever distro you're using.


R Studio
===
The basic RGui in all of the systems is fairly minimalistic and doesn't provide too many features.  We recommend [R Studio](http://www.rstudio.org/) to provide a much better environment to use R.  Don't let the "Version 0.97" fool you - it is one of the best interfaces to R out there right now.  It also happens to be cross-platform so no matter which operating system you're using RStudio is available.  You can download the latest version of R Studio [here](http://www.rstudio.com/ide/download/desktop).  If you get everything installed correctly and get it up and running the basic layout looks something like this:

<img src="images/rstudio-mac.png" width=600 height="auto">

That screengrab was shamelessly stolen from the R Studio website.  The look and feel is consistent across all platforms though so you should feel comfortable no matter where you run R Studio from.

<a name="testing">
Testing that R works
---

We'll show what it looks like for an RStudio user to test R and provide the necessary changes at the bottom for Mac and Linux users.
Jump to: <a href="#MAC">Differences for Mac users</a>
Jump to: <a href="#LINUX">Differences for Linux users</a>

Once installed open up "RStudio".  You should be presented with something that looks very similar to this:

<img src="images/Rstudio Empty.png" width=600 height="auto">

Test that you can use the console by typing something like `2+2`


```r
2 + 2
```

```
## [1] 4
```


Ok, if that worked, try to write something simple in a script file and submit it to the console


```r
print("Hello World")
```

```
## [1] "Hello World"
```


Now let's install some packages that we'll need for the workshop.  You'll need an active internet connection for this.

Copy and paste the following line into your script (or console):
`install.packages(c("ggplot2", "reshape2", "sos"), repos = "http://streaming.stat.iastate.edu/CRAN/")`

The console will display a bunch of stuff and hopefully it looks like:

<img src="images/InstallPackages.png" width=600 height="auto">

We'll load one of the packages we installed and test that it works.  Paste the following lines into the console. The result should be a plot that looks similar (but not the same as) the plot below:


```r
library(ggplot2)
qplot(rnorm(100))
```


<img src="images/Ggplot Test.png" width=600 height="auto">

If you got that plot then you are ready to go!

<a name="MAC">
### Mac users
Essentially all of the details above are the same except that you use "command" + "enter".


<a href="#testing">Jump back to top of "Testing that R works"</a>

<a name="LINUX">
### Linux users (not using RStudio)
To use basic R you just need to open up your preferred terminal and type `R`.  If this doesn't work then you'll need to add R's path to your path.  The commands you'll want to use to test are the same.  However, you'll see a lot more output when installing the packages because instead of downloading binaries (like Windows and Mac do) you end up compiling the packages directly.  Don't worry about having more output - this is to be expected.

### Linux users (using RStudio)
There are binary (deb and rpm) and source files for Rstudio available for Linux. In addition, if you use Ubuntu, you can add [ppa:marutter/rrutter](https://launchpad.net/~marutter/+archive/rrutter) and [ppa:marutter/c2d4u](https://launchpad.net/~marutter/+archive/c2d4u) using `add-apt-repository` - this will provide binaries for R and many R packages that can have some tricky dependencies and can make your life much easier.

<a href="#testing">Jump back to top of "Testing that R works"</a>
