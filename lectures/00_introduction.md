---
title: Course introduction
event: High Performance R
author: ["Heli Juottonen", "Maciej Janicki"]
---

# High Performance R is about...

1.  Writing performant R code
    -   optimization
    -   profiling
2.  Running R code on HPC systems
    -   leveraging multi-core and multi-node computations
    -   avoiding waste of resources

# Optimization and profiling: How?

R is a **high-level** programming language.

* you are not *implementing* algorithms, you are *calling* algorithms,
* implementation often done in C++ or Fortran,
* memory and CPU usage often governed by the specific package.

Basic rules:

* use built-in functions and existing packages whenever possible,
* check for performance-related settings in your packages,
* performance problems? -> profile!

# Schedule

::::: columns
::: {.column style="font-size: 30px;"}
| DAY 1       | Profiling & optimization      |
|:------------|:------------------------------|
| 9:15–9:20   | Introduction                  |
| 09:20–09:45 | Lecture                       |
| 09:45–10:00 | Break                         |
| 10:00–10:45 | Hands on & discussions        |
| 10:45–11:00 | Break                         |
| 11:00–11:30 | Lecture                       |
| 11:30–12:30 | Lunch                         |
| 12:30–13:15 | Hands on & discussions        |
| 13:15–13:30 | Break                         |
| 13:30–14:00 | Lecture                       |
| 14:00–14:15 | Break with offerings          |
| 14:15–15:00 | Hands on & discussions, recap |
:::

::: {.column style="font-size: 30px;"}
| DAY 2       | Parallelization and HPC       |
|:------------|:------------------------------|
| 9:15–9:20   | Recap                         |
| 09:20–09:45 | Lecture                       |
| 09:45–10:00 | Break                         |
| 10:00–10:45 | Hands on & discussions        |
| 10:45–11:00 | Break                         |
| 11:00–11:30 | Lecture                       |
| 11:30–12:30 | Lunch                         |
| 12:30–13:15 | Hands on & discussions        |
| 13:15–13:30 | Break                         |
| 13:30–14:00 | Lecture                       |
| 14:00–14:15 | Break with offerings          |
| 14:15–15:00 | Hands on & discussions, recap |
:::
:::::

# Course topics overview

