---
layout: post
title: Adding a new tutorial
author: Louis du Plessis
---

Anyone can easily contribute a tutorial to the website either by cloning an existing tutorial repository. To make this easier we will also provide an empty tutorial repository.

## Cloning a repository or starting from scratch
1. Clone and rename an existing repository (or create a new repository)
1. Write the tutorial either in Markdown or LaTeX (or both)
1. Contact one of the website maintainers
	- If the tutorial conforms to the right style we will add it to `_config.yml` and recompile the website. The tutorial will now appear on the website. 
	- If the tutorial does not conform to the right style the contributor either has to change it or give one of us developer access to the tutorial repository so we can fix it. Then it gets added as above.
1. If the author wants to, he/she can transfer ownership of the tutorial to us, so that it is hosted on the organization page.



## Fixing a bug in a tutorial
1. Fork the repository
1. Do a pull request
1. One of us evaluates and accepts/rejects the pull request.


## Tutorial style
Tutorials **must** contain a `README.md` file in the root. This file does not have to contain anything, but could also contain the full tutorial in Markdown format. 

If `README.md` is empty the tutorial should contain a `.tex`  or a `.pdf` file in the root. The `.tex` file should compile using `pdflatex`. 

Directory structure should be as follows:

```
---------- data/
	|
	|----- xml/
	|
	|----- precooked-runs/
	|
	|----- scripts/
	|
	|----- figures/
	|
	|-- README.md
	|-- biblatex_macros.tex
	|-- preamble.tex

```

- **data:** Contains data files for use in BEAST (alignments etc.)
- **xml:** BEAST control files.
- **precooked-runs:** Log and tree files from a BEAST run.
- **scripts:** Any additional scripts needed for pre- or postprocessing.
- **figures:** Figures used in the tutorial document.

At the moment the website simply detects PDF files in the root and displays those, as well as the `README.md` file. We should add a script to: 

1. Convert `README.md` to a `.tex` file.
1. Compile any `.tex` files in the root to PDFs. 

That would make it unnecessary to store the compiled PDFs in the tutorial repository. 
