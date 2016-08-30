---
layout: post
title: Distributed vs Central
author: Louis du Plessis
---

## Distributed

Here are a number of arguments why I decided to go for hosting each tuturial in a separate GitHub repository:

### Modular structure
A modular distributed structure where tutorials can be easily added and removed is easier to maintain and makes it easy to add/remove tutorials (a single line needs to be added to `_config.yml` and the update script rerun). 


### Bloating
The tutorials and the website should be separated from each other. The website source code does not contain any tutorial data except for a list of GitHub repositories. Besides from separating code (best practice) it also keeps the source repository from becoming bloated (since tutorials contain a lot of figures/data files).

On the other hand the production version of the website **does** contain all the tutorials. It is not important to keep this repository from becoming bloated. The production version is only a copy of the compiled website, which is not stored in the development repository and can easily be overwritten if it becomes too bloated (the history is not important here). In fact, it should not be a repository at all, but only is one because it is hosted on GitHub. (At the moment I have both the production and development versions of the site in the same repo, because this is only a demo and I wanted to see if it could be done). 



### Assigning blame (and metadata)
By having each tutorial in a repository owned by the creator, the creator of the tutorial remains responsible for it. This keeps whoever is in charge of the website from having to maintain all the tutorials. 

It is also best practice to keep tutorials separate, preventing contributors from messing with tutorials they should not have access to.

In addition, it allows us to extract individual metadata for tutorials and display it on the website - last updated, latest commits, owner, contributors etc. 
	


## Central

Arguments for keeping all of the tutorials together in one repository (and counterarguments):

### Everything is easy to find
One clone gives you all the tutorials. One fetch and merge gives you all updates. 

#### Counterargument
There is already a script for cloning all the repositories. It should be possible to provide a clone/download option for all tutorials on the website. 

Moreover, since the website automatically lists tutorials in the order they were last updated, along with the dates they were updated it's easy to see which tutorials have been added or changed.Simply looking at a GitHub repository for all tutorials means that you see each commit, not only which tutorials have been changed, which can be confusing (e.g. if someone made a 100 commits to only one tutorial, or cleaned up formatting on all tutorials). 


### Share data and figures
Having all tutorials in the same repository makes it possible to share resources between tutorials 

#### Counterargument
While duplication is generally not a good idea, having one tutorial using resources of another makes it possible to break several tutorials by changing one file (tutorials are no longer self-contained units, but are all connected to each other). This makes it difficult for someone not familiar with all of the tutorials to modify a single tutorial (there is no easy way to list which tutorials use which files/figures).


### It's easier for anyone to contribute
To contribute your own tutorial, simply fork the repository, add your tutorial or fix a bug and do a pull request. 

#### Counterargument
Fixing bugs can still be done by a simple pull request, only on the repository of each individual tutorial. 

I agree that a modular structure adds a greater activation energy for external contributors to add their own tutorial. However, I don't think the extra overhead is outrageous (see [here]({{site.baseurl}}{% post_url /news/2016-08-30-Adding-a-new-tutorial %})). However I **don't** think a modular structure adds extra maintenance overhead. With a central structure every time a new tutorial is added **all** of the tutorials need to be checked and tested (of course no-one will do this, but it is possible that the contributor accidentally edited files belonging to another tutorial). With a modular structure the contributor *cannot* edit other tutorials or the website. This is far more secure and makes it easier for us to maintain. 

