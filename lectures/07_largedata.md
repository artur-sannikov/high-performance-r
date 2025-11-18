---
title: Tips for large data sets in R
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

# Problems being solved

-   slow → faster: computing power as bottleneck → can the task use multiple cores?
-   many → more at once: carrying out similar, independent tasks/data sets concurrently
-   **big → memory & size of data or object as the bottleneck**

``` r
Error: cannot allocate vector of size X
```

# Use batch jobs instead of RStudio

-   RStudio struggles with heavy jobs
-   more resources available in batch jobs
-   no waiting at the screen
    -   submit a job and get email notification when it is ready
-   run several jobs at once
    -   interactive jobs only 2 at a time

# Splitting the data set

-   remove anything unnecessary
-   split one large dataset into multiple smaller chunks
    -   split/apply/combine
    -   array jobs, multiprocessing
-   `multidplyr` package ([see more](https://multidplyr.tidyverse.org/articles/multidplyr.html))

# Improve code: memory-handling tips (see day 1)

-   do as little as possible
-   vectorization: ‘R-like’ scripting, solves many problems
    -   `rowSums()`, `colSums()`, `rowMeans()`, `colMeans()`
-   use `rm()` in scripts to remove large unneeded objects
-   create functions to ensure temporary objects stay temporary
-   use list instead of data frame
-   read in data inside parallel functions

# Watch out for growing objects

-   `for` loop + `c()`, `append()`, `cbind()`, `rbind()`, or `paste()`
-   pre-allocate objects in the final size
-   save results in a list and combine in the end
-   use functionals instead of a for loop (`purrr::map()` for data frames, `apply()`for matrices)

# Avoid operations that create a copy

-   copy-on-modify vs. modify in place
    -   R favours [copy-on-modify](https://adv-r.hadley.nz/names-values.html#copy-on-modify)
    -   where and how an operation is carried out matters
-   only one name bound to object → modified in place, no copy created

# Working with large data frames that fit in memory

-   `readr::read_csv()` in tidyverse is faster than `read.csv()`
-   [fastverse packages](https://fastverse.github.io/fastverse/)
-   `data.table::fread()` instead of `read.csv()` / `read_csv()`
-   [fst](https://www.fstpackage.org/): another option for reading and writing csv files

# `data.table` package

-   alternative approach to tidyverse
-   different syntax (SQL-like)
-   works well with large data sets
-   memory management: avoids copy-on-modify behaviour
-   uses threading → built-in parallelism
    -   on Puhti: use multiple cores + `OMP_NUM_THREADS` ([see r-env documentation](https://docs.csc.fi/apps/r-env/#improving-performance-using-threading))

# What to do when dataset doesn't fit into memory?

-   another data format that takes less memory?
    -   matrix with lots of zeros: sparseMatrix()
    -   parquet instead of CSV
-   [arrow](https://arrow.apache.org/docs/r/index.html) package + dplyr
    -   reading, writing and analyzing larger-than-memory datasets
-   database approaches: duckdb and dbplyr / duckplyr

# Object on disk instead of in memory

-   specific packages for the purpose
    -   matrices: `bigmemory`
-   options in packages
    -   example: `terra`package for spatial data
    -   large objects written to disk instead of kept in memory

``` r
terraOptions(todisk = TRUE, memmax = 50, verbose = TRUE)
```
