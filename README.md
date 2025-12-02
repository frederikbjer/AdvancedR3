# AdvancedR3: Reproducible R development for data anaylsis

This project will describe how to tailor your R data analysis towards
being feasible for collaborative and reproducible research

# Brief description of folder and file contents

The project will contain a folder for data, R and docs

The following folders contain:

-   `data/`: Data that is used for the project
-   `docs/`: Proper description of each step of the analysis workflow
-   `R/`: Tidied functioning workflows

# Installing project R package dependencies

If dependencies have been managed by using
`usethis::use_package("packagename")` through the `DESCRIPTION` file,
installing dependencies is as easy as opening the `AdvancedR3.Rproj`
file and running this command in the console:

```         
# install.packages("pak")
pak::pak()
```

You'll need to have remotes installed for this to work.

# Resource

For more information on this folder and file workflow and setup, check
out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation.
