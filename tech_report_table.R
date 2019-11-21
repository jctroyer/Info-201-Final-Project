library(kableExtra)
library(knitr)

variable_names <- c("country_txt", "attacktype1_txt", "nkill", "nwound")
description <- c("The name of the country where an attack occured", "The type of terror attack ex: Chemical, explosion, firearms", "Number killed in the attack", "Number wounded in the attack")
data_type <- c("String", "String", "int", "int")
measurement_type <- c("Categorical", "Categorical", "Ratio", "Ratio")
df <- do.call(rbind, Map(data.frame, A=variable_names, B=description, C=data_type, D=measurement_type))

table <- kable(df, col.names = c("Variable Name",
                                    "Description",
                                    "Data Type",
                                     "Measurement Type")) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))


