---
title: Memory profiling and optimization
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

## Data types

:::: {.columns}

::: {.column}

A **data type** defines how the data is represented in the memory.

Primitive data types:

- numbers (`integer`, `double`)
- character strings (`character`)
- logical values (`logical`)

:::

::: {.column}

```
> x <- 42
> typeof(x)
[1] "double"
> object.size(x)
56 bytes
```

:::

::::

## Strings vs. factors

:::: {.columns}

::: {.column}

**Factors** store categorical variables in an efficient way.

:::

::: {.column}

```
> df <- read.csv(
+ "data/surveys_complete.csv",
+ header=T)
+ )
> typeof(df$genus)
[1] "character"
> object.size(df$genus)
244256 bytes
```

```
> df <- read.csv(
+ "data/surveys_complete.csv",
+ header=T, stringsAsFactors=T
+ )
> typeof(df$genus)
[1] "integer"
> object.size(df$genus)
122856 bytes
```

:::

::::

## Vectors

:::: {.columns}

::: {.column}

In R, every variable is a one-dimensional vector by default.

:::

::: {.column}

```
> x <- 1
> typeof(x)
[1] "double"
> length(x)
[1] 1
> object.size(x)
56 bytes
```

```
> x <- c(1, 1, 2, 3, 5, 8)
> typeof(x)
[1] "double"
> length(x)
[1] 6
> object.size(x)
96 bytes
```

:::

::::

## Vectors: element names

TODO

## Lists

:::: {.columns}

::: {.column}

TODO

:::

::: {.column}

TODO

:::

::::

## Data frames

:::: {.columns}

::: {.column}

TODO

:::

::: {.column}

TODO

:::

::::

## Exercise

1. Generate vectors of random numbers of type `integer` and `float`
and sizes from 1 to 1000. Try to determine:
   - how many bytes does an individual element take?
   - how large is the overhead per the entire vector?

   Plot the object size depending on length.

## TODO and open questions

* Rprof
* garbage collection

```
Rprof(memory.profiling=T, interval=0.001)
data(iris)
d <- dist(iris)
hc <- hclust(d)
plot(hc)
savePlot('hc_iris.png', 'png')
Rprof(NULL)
summaryRprof(memory='ts')
```
