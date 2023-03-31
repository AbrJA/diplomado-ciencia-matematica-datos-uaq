#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)

#* @apiTitle API test
#* @apiDescription Test para diplomado

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @get /plot
function() {
    rand <- rnorm(100)
    hist(rand)
}

#* Return the price of a house
#* @param no_banos Numero de baños
#* @param mts_cons Metros de construcción
#* @get /precio
function(no_banos, mts_cons) {
    list(precio_de_venta = 5e5 + 1e4 * as.numeric(no_banos) + 1000 * as.numeric(mts_cons))
}

#* Return the sum a prod of two numbers
#* @param a Number a
#* @param b Number b
#* @get /ops
function(a, b) {
    list(sum = as.numeric(a) + as.numeric(b),
         prod = as.numeric(a) * as.numeric(b))
}

# Programmatically alter your API
#* @plumber
function(pr) {
    pr %>%
        # Overwrite the default serializer to return unboxed JSON
        pr_set_serializer(serializer_unboxed_json())
}
