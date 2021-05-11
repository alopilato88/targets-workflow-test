library(targets)

# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(summary) to view the results.

source("R/functions.R")

# Set target-specific options such as packages.
tar_option_set(packages = c("dplyr", "magrittr", "tidyr"))

# End this file with a list of target objects.
list(
  tar_target(sim_data, create_data(5000, .50)),
  tar_target(sim_path, make_path(), format = "file"),
  tar_target(data, read.csv(sim_path)),
  tar_target(fit_mod, fit_lm(data))
)
