---
layout: post
title: Markdown tutorials
author: Louis du Plessis
---

Since the website is built in Jekyll it can display Markdown pages easily. This opens up the possibility to write tutorials directly in Markdown. Markdown is much more human-readable than LaTeX and flexible enough to still provide practically the same functionality. In addition Markdown can easily be converted to practically any end format.

The way the site is built at the moment it can aggregate tutorials written in both Markdown and in LaTeX. For tutorials written only in LaTeX the site will only display the contents of the `README.md` file, and not the tutorial itself (see the skyline tutorial). Tutorials written in Markdown will additionally display the tutorial on the website (see the introduction to BEAST2 tutorial). All tutorials will display links to the GitHub repository and PDFs in the sidebar.

## Conversion from LaTeX to Markdown

This should be easy enough. Markdown is very easy to learn (see [here]({{site.baseurl}}{% post_url /news/2016-08-28-Style %}) for a style guide).
For the most part the tutorial text can be copied verbatim and only the LaTeX commands need to be changed (usually to something much shorter and easier to read). 


### Some things that Markdown cannot do
- Keep rolling counters on figures, tables etc. and have the number automatically inserted when referencing an image (but you can add in an anchor and reference figures, tables etc.). This may actually be possible to implement using javascript or by adding a Jekyll extension. However, since tutorials tend not to be too complex it is probably easy enough to maintain a manual counter (as I have done for the introduction to BEAST2 tutorial).
- Some of the less frequently used mathematical expressions. But this is only because I'm using KaTeX at the moment (Mathjax can do it, but is not pretty). 


### Some things Markdown can do but I have not implemented yet
- Bibtex references, using [Jekyll-Scholar](https://github.com/inukshuk/jekyll-scholar).
- Attribute the original author of the tutorial in the header


## Conversion from Markdown to LaTeX
Markdown preprocessors by default can output the document in a variety of formats (usually html, pdf and tex). However, there is usually some more tweaking that needs to be done afterward (see [here](http://peterlu.github.io/2014/08/03/markdown_latex_pdf.html)).

I think it should be easy enough to write a Python or Ruby script that converts the automatic tex output into a LaTeX document with the right styles and fixes things like figures. In this way future tutorials only need to be written in Markdown and can be (almost) automatically output in pdf. To make it easier to convert from Markdown to LaTeX I prefer using the `<figure>` html tag instead of the native Markdown figure tag `![]()`. This also allows rescaling and makes it easy to add a caption and a reference to the figure. 



