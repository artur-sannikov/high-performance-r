---
title: CPU profiling and optimization
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

# Idea

The same thing can be achieved in slower or faster ways.

&nbsp;

**Example**: Cumulative sum

&nbsp;

:::: {.columns}

::: {.column width="75%"}

|   |     |     |     |     |     |
|--:|----:|----:|----:|----:|----:|
| `x` |  1  |  2  |  3  |   4 |  5 |
| `y` |  1  |  3  |  6  |   10 | 15 |
|  |  =1  | =1+2  |  =1+2+3  |  =1+2+3+4 | =1+2+3+4+5 |

:::

::: {.column width="25%"}

$$
\begin{eqnarray*}
y_1 &=& x_1 \\
y_{i+1} &=& y_i + x_{i+1}
\end{eqnarray*}
$$

:::

::::

# Cumulative sum

:::: {.columns}

::: {.column}

<font style="font-weight: bold; color: var(--csc-magenta);">WRONG</font>

```r
slow_cumsum <- function(x) {
  result <- rep(0, length(x))
  result[1] <- x[1]
  for (i in 2:length(x)) {
    result[i] <- result[i-1] + x[i]
  }
  result
}
```

```
> x <- c(1, 2, 3, 4, 5)
> slow_cumsum(x)
[1]  1  3  6 10 15
```

:::

::: {.column}

<font style="font-weight: bold; color: var(--csc-green);">RIGHT</font>

```
> x <- c(1, 2, 3, 4, 5)
> cumsum(x)
[1]  1  3  6 10 15
```

:::

::::


# Cumulative sum: bonus example

<font style="font-weight: bold; color: var(--csc-magenta);">VEEERY WRONG</font>

```r
atrocious_cumsum <- function(x) {
  # we will "build up" the cumulative sum as we iterate over x
  result <- c()
  for (x_elem in x) {
    if (is.null(result)) {
      # if the result is empty, we start with just x[1]
      result <- x_elem
    } else {
      # otherwise we append to the result the sum of the current
      # element of x and the last element of result
      result <- c(result, result[length(result)]+x_elem)  # DON'T!!! ;(
    }
  }
  result
}

```

# Measuring execution time: `Sys.time()`

```
> x <- rchisq(1000000, df = 1)
```

&nbsp;

```
> t <- Sys.time(); y <- slow_cumsum(x); Sys.time()-t
Time difference of 0.1100259 secs
```

&nbsp;

```
> t <- Sys.time(); y <- cumsum(x); Sys.time()-t
Time difference of 0.006928682 secs
```

# Measuring execution time: `system.time()`

:::: {.columns}

::: {.column}

```
> x <- rchisq(1000000, df = 1)
```

&nbsp;

```
> system.time({ y <- slow_cumsum(x) })
   user  system elapsed
  0.112   0.007   0.118
```

&nbsp;

```
> system.time({ y <- cumsum(x) })
   user  system elapsed
  0.002   0.000   0.003
```

:::

::::


# Measuring execution time: package `tictoc`

```
> library(tictoc)
> x <- rchisq(1000000, df = 1)
```

&nbsp;

```
> tic(); y <- slow_cumsum(x); toc()
0.126 sec elapsed
```

&nbsp;

```
> tic(); y <- cumsum(x); toc()
0.007 sec elapsed
```

# Comparing execution time: package `microbenchmark`

:::: {.columns}

::: {.column}

```r
mb <- microbenchmark(
	slow_cumsum={ slow_cumsum(x) },
	cumsum={ cumsum(x) },
	unit='s',
    times=100    # repeat each call 100 times
)
plot(mb)
```

:::

::: {.column}

![](figures/01_microbenchmark.png)

:::

::::


# 'Premature optimization is the root of all evil'

TODO: example of how optimization makes the code more complicated

$$
x = \frac{y}{z^2}
$$

# TODO Profiling with `Rprof`

TODO identifying bottlenecks in the code
