if ("RSTUDIO" %in% names(Sys.getenv())){
options(max.print = 999)
options(prompt = "|> ")
options(continue = "...")
}

if (requireNamespace("rlang", quietly = TRUE)) {
	options(
   rlang_backtrace_on_error = "full",
   error = rlang::entrace
 )
}
