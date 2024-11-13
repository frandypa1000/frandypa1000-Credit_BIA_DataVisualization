# Loading csv file from GitHub ----
url <- "https://raw.githubusercontent.com/frandypa1000/Machine-Learning-with-R-datasets/refs/heads/master/credit.csv"

data <- read.csv(url)

# view the first few rows of the data 
head (data)

install.packages(ggplot2)

data(CreditBIA)
View(CreditBIA)

library(ggplot2)
data(CreditBIA)

ggplot(data = CreditBIA)

# Load necessary libraries
library(ggplot2)

# Load the CSV file from GitHub
url <- "https://raw.githubusercontent.com/frandypa1000/Machine-Learning-with-R-datasets/refs/heads/master/credit.csv"
data <- read.csv(url)

# View the first few rows of the data
head(data)

# View the dataset in a spreadsheet-like viewer (optional)
View(data)

# Loan Amount Distribution ----
ggplot(data, aes(x = amount)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Loan Amounts", x = "Loan Amount", y = "Count")

# Loan Duration and Lound Amount Relationship ----
ggplot(data, aes(x = months_loan_duration, y = amount)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Loan Amount and Loan Duration with Regression Line", 
       x = "Loan Duration (Months)", 
       y = "Loan Amount") +
  theme_minimal()
# Loan Purpose and Loan Amount Relationship ----
ggplot(data, aes(x = purpose, y = amount)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Loan Amount by Purpose", x = "Purpose", y = "Loan Amount") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# Default Rates by Credit History ----
ggplot(data, aes(x = credit_history, fill = factor(default))) +
  geom_bar(position = "fill") +
  labs(title = "Default Rates by Credit History", x = "Credit History", y = "Proportion", fill = "Default")

# Default rates by credit history, with purpose as the fill color (advanced version) ----
ggplot(data, aes(x = credit_history, fill = purpose)) +
  geom_bar(position = "fill") +
  labs(title = "Default Rates by Credit History and Purpose",
       x = "Credit History", y = "Purpose") +
  scale_fill_manual(values = c("business" = "lightgreen", "car (new)" = "lightblue", "car (used)" = "gold", "domestic appliances" = "red", "education" = "pink", "furniture"="antiquewhite", "others"="gray", "radio/tv"="orange", "repairs"="aquamarine", "retraining"="brown")) +
  theme_minimal()
# Loan Amount and Age for Different Default ----
# Base ggplot setup
plot <- ggplot(data, aes(x = age, y = amount, color = factor(default))) +
  labs(
    title = "Loan Amount vs. Age by Default Status",
    subtitle = "Comparing loan amount and age for different default types",
    x = "Age (Years)",
    y = "Loan Amount",
    color = "Default Status"
  )

# Statistic Layer
plot <- plot +
  geom_point(alpha = 0.6, size = 2) +  # Scatter plot points
  geom_smooth(method = "lm", se = TRUE) +  # Continuous smoothing line
  scale_color_manual(values = c("1" = "blue", "2" = "red"))

# Coordinate Layer
plot <- plot +
  facet_wrap(~ default, labeller = as_labeller(c("1" = "Bad Credit", "2" = "Collateral Problem")))

# Theme Layer
plot <- plot +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5, color = "gray50"),
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "gray40"),
    strip.text = element_text(face = "bold", size = 14, color = "white"),
    strip.background = element_rect(fill = "darkblue"),
    panel.grid.major = element_line(color = "gray85"),
    panel.grid.minor = element_blank(),
    legend.position = "top",
    legend.title = element_text(face = "bold"),
    legend.text = element_text(color = "gray30")
  )

# Display the plot
plot
# Default Status by Housing Status ----
ggplot(data, aes(x = factor(default), fill = factor(default))) +
  geom_bar() +
  facet_wrap(~ housing) +
  labs(title = "Default Status by Housing Status", 
       x = "Default Status", 
       y = "Count") +
  scale_fill_manual(values = c("1" = "blue", "2" = "red"), labels = c("No Default", "Default")) +
  theme_minimal()
