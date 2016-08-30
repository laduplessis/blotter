---
layout: post
title: Distributed vs Central
author: Louis du Plessis
---

## Distributed

Here are a number of arguments why I decided to go for hosting each tuturial in a separate GitHub repository:

### Bloating

The tutorials and the website should be separated from each other. The website source code does not contain any tutorial data except for a list of GitHub repositories. Besides from separating code (good practice) it also keeps the source repository from becoming bloated. Since tutorials contain a lot of figures / data files, it will easily become bloated. 

On the other hand the production version of the website does contain all the tutorials. It is not important to keep this from becoming bloated. The production version is only a copy of the compiled website, which can easily be overwritten if it becomes too bloated (the history is not important). In fact, it should not be a repository at all, but only is one because it is hosted on GitHub. (keep in mind that at the moment I have both the production and development versions of the site in the same repo, because this is only a demo). 



### Assigning blame (and metadata)
	
By having each tutorial in a repository owned by the creator, the creator of the tutorial remains responsible for it. This keeps whoever is in charge of the website from having to maintain all the tutorials. 

It is also best practice to keep tutorials separate, preventing contributors from messing with tutorials they should not have access to.

In addition, it allows us to extract metadata for tutorials and display it on the website - last updated, latest commits, owner, contributors etc. 
	


## Central

Arguments for keeping all of the tutorials together in one repository (and counterarguments):

### Everything is easy to find

One clone gives you all the tutorials. One fetch + merge gives you all updates. 

#### Counterargument

There is already a script for cloning all the repositories. It should be possible to provide a clone / download option for all tutorials on the website. 

The website automatically lists tutorials in the order they were last updated, along with the dates they were updated. This makes it easy to track when tutorials have been added / changed. Simply looking at a GitHub repository for all tutorials means that you see each commit, not only which tutorials have been changed, which can be confusing. 


### Share data and figures

Having all tutorials in the same repository makes it possible to share resources between tutorials. 

#### Counterargument

While duplication is generally not a good idea, having one tutorial using resources of another makes it possible to break several tutorials by changing one file (tutorials are no longer self-contained units, but are all connected to each other). This makes it difficult for someone not 


### It's easier for anyone to contribute

To contribute your own tutorial, simply fork the repository, add your tutorial and do a pull request. 

#### Counterargument

I don't have no good counterargument to this - it does seem to be the easier solution. But see [here]() for my ideas of how contributors can add new repositories in the modular, distributed format. 


