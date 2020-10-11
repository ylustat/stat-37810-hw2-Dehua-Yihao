# Paired homework 2
## Dehua and Yihao did this together
## Question 1

Dehua Bi and Yihao Lu

In R

```R
> source('~/Desktop/UChicago/2020-2021/2020Fall/Computing/HW2-PAIR.R')
Please enter four numbers ranging from 1 to 10: > 1 2 3 4
[1] "You have guessed  0  bulls, and  1  cows, you have  9  times left."
Please enter four numbers ranging from 1 to 10: > 1 2 3 4
[1] "You have guessed  0  bulls, and  1  cows, you have  8  times left."
...
Please enter four numbers ranging from 1 to 10: > 1 2 3 4
[1] "You have guessed  0  bulls, and  1  cows, you have  1  times left."
Please enter four numbers ranging from 1 to 10: > 1 2 3 4
[1] "You have lost, the number computer guessed is "
[1] 10  8  7  3
```

In terminal (here the user need to specify parameter 1 when using command lines ):

```sh
(base) Yihao-Lus-MacBook-Pro:Computing luyihao$ Rscript ~/Desktop/UChicago/2020-2021/2020Fall/Computing/HW2-PAIR.R 1
Please enter four numbers ranging from 1 to 10: > 1 2 3 4
[1] "You have guessed  0  bulls, and  1  cows, you have  9  times left."
Please enter four numbers ranging from 1 to 10: > 2 1 3 4
[1] "You have guessed  0  bulls, and  1  cows, you have  8  times left."
...
Please enter four numbers ranging from 1 to 10: > 5 1 6 3
[1] "You have guessed  2  bulls, and  0  cows, you have  1  times left."
Please enter four numbers ranging from 1 to 10: > 5 8 7 3
[1] "You have lost, the number computer guessed is "
[1] 5 7 8 3
```

