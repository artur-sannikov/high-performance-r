---
title: Future package family for parallel R
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

# Future: versatile framework for parallel R 

- package `future` + a set of related packages
  - `furrr`, `future.apply`, `doFuture`, etc.
  - <https://www.futureverse.org/packages-overview.html>

# Benefits of `future`

- serial to parallel with few changes
- exports variables and packages to parallel processes
- displays messages and warnings
- uses `parallelly::availableCores()` to detect cores
- handles parallel random number generation

# Different strategies defined with `plan()`

- `plan(sequential)`: serial
- `plan(multisession)`: multiple **cores**
  - launches a set of background sessions as a socket cluster
- `plan(multicore)`: multiple **cores** by forking
  - faster than multisession when supported (not in Windows, not in RStudio)
- `plan(cluster)`
  - use with multiple **nodes**

# Parallelizing with `future`

- `purrr::map()` &rarr; `furrr::future_map()`
- `apply()` &rarr; package `future.apply` 

```r
# serial
library(purrr)
map(files, function)

# parallel
library(furrr) # calls future in the background
future_map(files, function)

# resetting the plan
plan(sequential)

```

# Questions on using R on Puhti later on? 

- email servicedesk\@csc.fi
  - help with r-env, parallelization
- weekly [research support session on Zoom](https://csc.fi/en/training-calendar/csc-research-support-coffee-every-wednesday-at-1400-finnish-time-2-2/)
- [creating your own project for using R on Puhti](https://docs.csc.fi/accounts/how-to-create-new-project/)
- [r-env documentation](https://docs.csc.fi/apps/r-env/)

