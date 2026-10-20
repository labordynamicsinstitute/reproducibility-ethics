# Install the packages recorded in renv.lock into the site library.
# Idempotent: packages already present at the recorded version are skipped.
# Uses the base image's configured repository (rocker: dated P3M binaries),
# which matches the snapshot date recorded in renv.lock.

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

options(renv.config.repos.override = getOption("repos"))
renv::restore(
  lockfile = "renv.lock",
  library  = .libPaths()[1],
  prompt   = FALSE
)
