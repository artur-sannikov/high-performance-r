---
title: Essentials of functional programming
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

# Imperative vs Functional programming

:::: {.columns}

::: {.column }

### Imperative

* program = description what the computer should do
  * fine-grained control
  * in R: usually slow and clumsy

```r
count_ones <- function(x) {
  result <- 0
  for (i in 1:length(x)) {
    if (x[i] == 1) {
      result <- result + 1
    }
  }
  result
}
```

:::

::: {.column }

### Functional

* program = formula for output depending on input
  * enforces consiseness
  * in R: uses the available **efficient** implementations

```r
count_ones <- function(x) sum(x == 1)
```

:::

::::


# The Map-Reduce paradigm

Many computations follow this pattern:

* **map** each element of a sequence with a function,
* **reduce** the sequence to one element.

**Example**: Sum-of-squares

&nbsp;

:::: {.columns}

::: {.column width="70%" }

|   |   |     |     |     |     |     |     |
|:---|--:|----:|----:|----:|----:|----:|----:|
| | $x$ |  1  |  -2  |  3  |   -4 |  5 |  |
| MAP | $x^2$ |  1  |  4  |  9  |   16 | 25 |  |
| REDUCE | $y =$ | 1 |   + 4 | + 9 | + 16 | + 25 | = 55 | 

:::

::: {.column width="30%" }

```r
x <- c(1, -2, 3, -4, 5)
y <- sum(x^2)
```

:::

::::

# Mapping

Simple operations written directly:
* arithmetics
* built-in functions.

# Mapping

More complex operations can be done using `*apply()` functions.

# Mapping matrices row- or column-wise

TODO

# Reducing

TODO built-in functions: sum etc.

# Reducing

sapply()

# Map-Reduce: a more complex example

:::: { .columns }

::: { .column }

Let's simulate a simple game:

One player has two dice, the other one has three.

What is each player's probability of winning (getting higher combined
score than the other)?

(Normal six-sided dice. In case of equal score, the player with two dice wins.)

:::

::: { .column }

![](figures/03_dice_game.png)

<p align="right"><small>image by Copilot</small></p>

:::

::::

# Map-Reduce: a more complex example

:::: { .columns }

::: { .column }

Breaking down the problem:

* we simulate many rounds <br/> (e.g. `n = 100`),
* in each round we calculate the combined score for each player,
* we compare the scores pairwise.

:::

::: { .column }

```r
multi_dice <- function(n, dice)
  apply(
    matrix(
      sample(6, n*dice, replace=T),
      nrow=n, ncol=dice),
    1, sum)

dice_game <- function(n)
  mean(multi_dice(n, 3) > multi_dice(n, 2))
```

:::

::::

# Map-Reduce: a more complex example

:::: { .columns }

::: { .column .small }

TODO show where is map and where reduce

|   |   |   |   |   |   |
|---|---|---|---|---|---|
|   | 6 | 1 | 4 | 2 | 2 |
|   | 4 | 4 | 6 | 5 | 3 |
|   | 3 | 2 | 4 | 4 | 1 |
|   | 1 | 1 | 3 | 4 | 4 |
|   | 2 | 2 | 4 | 5 | 4 |

:::

::: { .column }

:::

::::

# The Map-Reduce paradigm

Benefits:

* parallelization: the MAP step can be performed independently for each element,
* clear and concise description,
* operations on entire sequences whenever possible.
* maximize the number of simultaneous operations (e.g. sampling)!
