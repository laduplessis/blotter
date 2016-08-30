---
layout: post
title: Website style and ideas
author: Louis du Plessis
---

## Summary

This is a website to host a set of tutorials for BEAST 2. A core aspect of the site is that it should be straightforward to add or edit tutorials and that anyone should be able to contribute. For this reason the tutorials, and the website, are hosted on GitHub. There will be an organization page containing the website and each tutorial is a different GitHub repository.  Although tutorials are ideally hosted as repositories on the website organization page, they can also be hosted anywhere on GitHub. The website simply acts as an aggregator for tutorials. (The structure of the website also makes it ideal to act as an aggregator of BEAST2 packages, I added a couple of packages as tutorials just as a proof of concept).


## Website style and layout

The website is a fork of Trevor Bedford's lab website [bedford.io](http://bedford.io). I haven't changed much of the style so far.
A lot of the things are great and should be left alone, but some other things should probably be changed:

- I don't like Trevor's navigation bar. It is overly complicated (it uses a lot of code to make a collapsible navbar that can't be collapsed). 
- The website needs a footer.
- KaTeX is beautiful, but it does not support all of the LaTeX mathematics environments. If we run into problems we should switch to MathJax, which seems to work with everything (but isn't as beautiful). 


## Website architecture

The website is built using Jekyll, which creates a static site. That means there are no databases etc. so the site is faster, simpler and more secure.  New pages can easily be added as markdown files with a yaml header (which minimizes the amount of html that needs to be typed). To parse the markdown files to html I am using redcarpet, simply because Trevor used it, but this could be changed to kramdown or pandoc. 

Each tutorial is a separate GitHub repository. The reasons for this decision are given [here]({{site.baseurl}}{% post_url /news/2016-08-29-Distributed-vs-Central %}). A ruby script clones each repository listed in the website's config file and extracts the `README.md` file from the repository as well as some metadata. (**TODO:** The script should also detect/compile/convert the LaTeX version of the tutorial). 

The website itself is currently hosted on GitHub itself, using github-pages. This is free, but has some limitations, e.g. we can't use a webhook to automatically run the ruby script when a tutorial is updated, but need to do it manually. This means that someone needs to periodically update the website by recompiling and pushing to the repository, or else changes to tutorials will not be apparent on the website. If we host the site outside of GitHub this would be done automatically.


