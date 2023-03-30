R: Fundamentos
================
Abraham Jaimes

## Variables

``` r
x <- 5
2 * x + 3
#> [1] 13
```

``` r
pais <- "Colombia"
nchar(pais)
#> [1] 8
```

``` r
# Limpieza de texto
library(stringi)

tolower(pais)
#> [1] "colombia"
stri_trans_tolower(pais)
#> [1] "colombia"
```

## Vectores

``` r
edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, 'Superman', 'Batman', NA, 'Batman')
```

``` r
edad
#> [1] 15 19 13 NA 20
```

``` r
deporte
#> [1]  TRUE  TRUE    NA FALSE  TRUE
```

``` r
comic_fav
#> [1] NA         "Superman" "Batman"   NA         "Batman"
```

``` r
edad[3]
#> [1] 13
```

``` r
comic_fav[c(2, 5)]
#> [1] "Superman" "Batman"
```

``` r
deporte[-3]
#> [1]  TRUE  TRUE FALSE  TRUE
```

``` r
deporte[1, 2, 3] # ERROR
deporte[c(1, 2, 3)]
```

## Matrices

``` r
mimatriz <- matrix(data = 1:20, nrow = 4, ncol = 5, byrow = FALSE)
```

``` r
mimatriz
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    1    5    9   13   17
#> [2,]    2    6   10   14   18
#> [3,]    3    7   11   15   19
#> [4,]    4    8   12   16   20
```

``` r
mimatriz[3, 4]
#> [1] 15
```

``` r
mimatriz[, 5]  # No se escribe nada antes de la coma
#> [1] 17 18 19 20
```

``` r
mimatriz[, -c(2, 4)]  # Las columnas como vector
#>      [,1] [,2] [,3]
#> [1,]    1    9   17
#> [2,]    2   10   18
#> [3,]    3   11   19
#> [4,]    4   12   20
```

``` r
mimatriz[-1, -3]  # Signo de menos para eliminar
#>      [,1] [,2] [,3] [,4]
#> [1,]    2    6   14   18
#> [2,]    3    7   15   19
#> [3,]    4    8   16   20
```

## Arrays

``` r
miarray <- array(data = letters[1:24], dim = c(3, 4, 2))
```

``` r
miarray
#> , , 1
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,] "a"  "d"  "g"  "j" 
#> [2,] "b"  "e"  "h"  "k" 
#> [3,] "c"  "f"  "i"  "l" 
#> 
#> , , 2
#> 
#>      [,1] [,2] [,3] [,4]
#> [1,] "m"  "p"  "s"  "v" 
#> [2,] "n"  "q"  "t"  "w" 
#> [3,] "o"  "r"  "u"  "x"
```

``` r
miarray[1, 3, 2]  # El orden es importante
#> [1] "s"
```

``` r
miarray[, , 2]  # No se coloca nada en las primeras posiciones
#>      [,1] [,2] [,3] [,4]
#> [1,] "m"  "p"  "s"  "v" 
#> [2,] "n"  "q"  "t"  "w" 
#> [3,] "o"  "r"  "u"  "x"
```

``` r
miarray[, 3, ]  # No se coloca nada en las primeras posiciones
#>      [,1] [,2]
#> [1,] "g"  "s" 
#> [2,] "h"  "t" 
#> [3,] "i"  "u"
```

## Data frame

``` r
mimarco <- data.frame(edad, deporte, comic_fav)
```

``` r
mimarco
#>   edad deporte comic_fav
#> 1   15    TRUE      <NA>
#> 2   19    TRUE  Superman
#> 3   13      NA    Batman
#> 4   NA   FALSE      <NA>
#> 5   20    TRUE    Batman
```

``` r
mimarco$deporte  # Se recomienda si el nombre es corto
#> [1]  TRUE  TRUE    NA FALSE  TRUE
```

``` r
mimarco[, "deporte"]
#> [1]  TRUE  TRUE    NA FALSE  TRUE
```

``` r
mimarco[["deporte"]]
#> [1]  TRUE  TRUE    NA FALSE  TRUE
```

``` r
mimarco["deporte"]
#>   deporte
#> 1    TRUE
#> 2    TRUE
#> 3      NA
#> 4   FALSE
#> 5    TRUE
```

``` r
mimarco[, "deporte", drop = FALSE]
#>   deporte
#> 1    TRUE
#> 2    TRUE
#> 3      NA
#> 4   FALSE
#> 5    TRUE
```

``` r
mimarco$deporte == mimarco[, "deporte"]
#> [1] TRUE TRUE   NA TRUE TRUE
```

``` r
mimarco[c("deporte", "edad")]
#>   deporte edad
#> 1    TRUE   15
#> 2    TRUE   19
#> 3      NA   13
#> 4   FALSE   NA
#> 5    TRUE   20
```

``` r
mimarco[, 1:2]
#>   edad deporte
#> 1   15    TRUE
#> 2   19    TRUE
#> 3   13      NA
#> 4   NA   FALSE
#> 5   20    TRUE
```

``` r
identical(mimarco$deporte, mimarco[, "deporte"])
#> [1] TRUE
```

``` r
mimarco[2:4, 1]
#> [1] 19 13 NA
```

``` r
subset(mimarco, subset = deporte == TRUE)
#>   edad deporte comic_fav
#> 1   15    TRUE      <NA>
#> 2   19    TRUE  Superman
#> 5   20    TRUE    Batman
```

``` r
mimarco[mimarco$deporte == TRUE, ]
#>    edad deporte comic_fav
#> 1    15    TRUE      <NA>
#> 2    19    TRUE  Superman
#> NA   NA      NA      <NA>
#> 5    20    TRUE    Batman
```

``` r
subset(mimarco, subset = edad >= 17)
#>   edad deporte comic_fav
#> 2   19    TRUE  Superman
#> 5   20    TRUE    Batman
```

``` r
subset(mimarco, subset = edad < 20, select = c('deporte', 'comic_fav'))
#>   deporte comic_fav
#> 1    TRUE      <NA>
#> 2    TRUE  Superman
#> 3      NA    Batman
```

``` r
subset(mimarco, subset = edad < 20 & deporte == TRUE)
#>   edad deporte comic_fav
#> 1   15    TRUE      <NA>
#> 2   19    TRUE  Superman
```

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(data.table)
#> 
#> Attaching package: 'data.table'
#> The following objects are masked from 'package:dplyr':
#> 
#>     between, first, last
```

## Listas

``` r
set.seed(12345)
mivector <- runif(n = 5)
matriz2 <- matrix(data = 1:12, ncol = 6)
milista <- list(E1 = mivector, E2 = matriz2, E3 = mimarco)
```

``` r
milista
#> $E1
#> [1] 0.7209039 0.8757732 0.7609823 0.8861246 0.4564810
#> 
#> $E2
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12
#> 
#> $E3
#>   edad deporte comic_fav
#> 1   15    TRUE      <NA>
#> 2   19    TRUE  Superman
#> 3   13      NA    Batman
#> 4   NA   FALSE      <NA>
#> 5   20    TRUE    Batman
```

``` r
milista$E2
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12
```

``` r
milista[[2]]
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12
```

``` r
milista[2]
#> $E2
#>      [,1] [,2] [,3] [,4] [,5] [,6]
#> [1,]    1    3    5    7    9   11
#> [2,]    2    4    6    8   10   12
```

``` r
class(milista$E2)
#> [1] "matrix" "array"
```

## Funciones

``` r
test <- function(x) {
  if (!is.numeric(x)) return(0)
  return(2 * x)
}
```

``` r
test("Hola")
#> [1] 0
```

``` r
test(1)
#> [1] 2
```

``` r
test <- function(x) {
  stopifnot(is.numeric(x))
  return(x)
}
```

``` r
x <- 1
modify <- function(x) {
  x <- 2
  return(x)
}
modify(x)
#> [1] 2
x
#> [1] 1
```

``` r
x <- 1
modify <- function(x, ...) {
  args <- list(...)
  return(args)
}
modify(x)
#> list()
x
#> [1] 1
```

``` r
testI <- function(x) {
  invisible(x)
}
testI("Hola")
x <- testI("Hola")
x
#> [1] "Hola"
```

``` r
a <- c(1, 3, 2)
b <- c(2, 0, 1)  # a y b de la misma dimensión
a + b  # Para sumar los vectores a y b miembro a miembro
#> [1] 3 3 3
```

``` r
library(microbenchmark)
```

``` r
microbenchmark(
suma_vect = a + b, 
suma_for = {
  c <- NULL
  for (i in 1:length(a)) c <- c(c, a[i] + b[i]) }, times = 100)
#> Unit: nanoseconds
#>       expr     min        lq       mean  median        uq     max neval
#>  suma_vect      71      97.5     317.06     350     482.5    1433   100
#>   suma_for 1227764 1244452.5 1336922.56 1259300 1278115.0 3072317   100
```

``` r
a <- c(1, 3, 2)
b <- c(2, 0, 1)
a > b
#> [1] FALSE  TRUE  TRUE
```

``` r
x <- c(0, 1, 2, 0)
if (x == 0) {
  print("Es cero")
} else {
  print("No es cero")
}
```

``` r
ifelse(x == 0, "A", "B")
#> [1] "B"
```

## FOR

``` r
a <- c(1, 2, 3)
b <- c(0, 1, 2)
for (i in 1:length(a)) {
  print(a[i] + b[i] )
  }
#> [1] 1
#> [1] 3
#> [1] 5
```

## WHILE

``` r
counter <- 1
while (counter < 5) {
  print(counter)
  counter <- counter + 1
}
#> [1] 1
#> [1] 2
#> [1] 3
#> [1] 4

for (counter in 1:4) {
  print(counter)
}
#> [1] 1
#> [1] 2
#> [1] 3
#> [1] 4

number <- 2
while (number %% 2 == 0) {
  number <- floor(runif(1, 0, 10))
  print(number)
}
#> [1] 7
```

``` r
while (TRUE) { 
  print(Sys.time())
  Sys.sleep(5)
}
```

``` r
repeat {
  print(Sys.time())
  Sys.sleep(5)
}
```

``` r
library(microbenchmark)

microbenchmark( augusto = {
  if (4560 %% 3 == 0) {
  print(TRUE)
  }
  },
  beto = 4560 %% 3 == 0)
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> [1] TRUE
#> Unit: nanoseconds
#>     expr  min     lq    mean median     uq   max neval
#>  augusto 5231 5462.5 6021.86   5554 5680.5 36941   100
#>     beto  108  140.0  157.21    152  163.5   335   100
```
