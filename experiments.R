experi6_1 <- list()
IR <- 1.25
Sys.time()
id <- 1
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_1 <- list(org, ros, rus, nea, smo)
write_rds(experi6_1, "experi6_1.rds")
rm(experi6_1)
Sys.time()
##################################################
experi6_2 <- list()
IR <- 1.25
Sys.time()
id <- 2
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_2 <- list(org, ros, rus, nea, smo)
write_rds(experi6_2, "experi6_2.rds")
rm(experi6_2)
Sys.time()
##################################################
experi6_3 <- list()
IR <- 1.25
Sys.time()
id <- 3
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_3 <- list(org, ros, rus, nea, smo)
write_rds(experi6_3, "experi6_3.rds")
rm(experi6_3)
Sys.time()
##################################################
experi6_4 <- list()
IR <- 1.25
Sys.time()
id <- 4
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_4 <- list(org, ros, rus, nea, smo)
write_rds(experi6_4, "experi6_4.rds")
rm(experi6_4)
Sys.time()
##################################################
experi6_5 <- list()
IR <- 1.25
Sys.time()
id <- 5
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_5 <- list(org, ros, rus, nea, smo)
write_rds(experi6_5, "experi6_5.rds")
rm(experi6_5)
Sys.time()
##################################################
experi6_6 <- list()
IR <- 1.25
Sys.time()
id <- 6
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_6 <- list(org, ros, rus, nea, smo)
write_rds(experi6_6, "experi6_6.rds")
rm(experi6_6)
Sys.time()
##################################################
experi6_7 <- list()
IR <- 1.25
Sys.time()
id <- 7
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_7 <- list(org, ros, rus, nea, smo)
write_rds(experi6_7, "experi6_7.rds")
rm(experi6_7)
Sys.time()
##################################################
experi6_8 <- list()
IR <- 1.25
Sys.time()
id <- 8
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_8 <- list(org, ros, rus, nea, smo)
write_rds(experi6_8, "experi6_8.rds")
rm(experi6_8)
Sys.time()
##################################################
experi6_9 <- list()
IR <- 1.25
Sys.time()
id <- 9
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_9 <- list(org, ros, rus, nea, smo)
write_rds(experi6_9, "experi6_9.rds")
rm(experi6_9)
Sys.time()
##################################################
experi6_10 <- list()
IR <- 1.25
Sys.time()
id <- 10
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_10 <- list(org, ros, rus, nea, smo)
write_rds(experi6_10, "experi6_10.rds")
rm(experi6_10)
Sys.time()
##################################################
experi6_11 <- list()
IR <- 1.25
Sys.time()
id <- 11
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_11 <- list(org, ros, rus, nea, smo)
write_rds(experi6_11, "experi6_11.rds")
rm(experi6_11)
Sys.time()
##################################################
experi6_12 <- list()
IR <- 1.25
Sys.time()
id <- 12
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_12 <- list(org, ros, rus, nea, smo)
write_rds(experi6_12, "experi6_12.rds")
rm(experi6_12)
Sys.time()
##################################################
experi6_13 <- list()
IR <- 1.25
Sys.time()
id <- 13
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_13 <- list(org, ros, rus, nea, smo)
write_rds(experi6_13, "experi6_13.rds")
rm(experi6_13)
Sys.time()
##################################################
experi6_14 <- list()
IR <- 1.25
Sys.time()
id <- 14
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_14 <- list(org, ros, rus, nea, smo)
write_rds(experi6_14, "experi6_14.rds")
rm(experi6_14)
Sys.time()
##################################################
experi6_15 <- list()
IR <- 1.25
Sys.time()
id <- 15
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_15 <- list(org, ros, rus, nea, smo)
write_rds(experi6_15, "experi6_15.rds")
rm(experi6_15)
Sys.time()
##################################################
experi6_16 <- list()
IR <- 1.25
Sys.time()
id <- 16
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_16 <- list(org, ros, rus, nea, smo)
write_rds(experi6_16, "experi6_16.rds")
rm(experi6_16)
Sys.time()
##################################################
experi6_17 <- list()
IR <- 1.25
Sys.time()
id <- 17
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_17 <- list(org, ros, rus, nea, smo)
write_rds(experi6_17, "experi6_17.rds")
rm(experi6_17)
Sys.time()
##################################################
experi6_18 <- list()
IR <- 1.25
Sys.time()
id <- 18
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_18 <- list(org, ros, rus, nea, smo)
write_rds(experi6_18, "experi6_18.rds")
rm(experi6_18)
Sys.time()
##################################################
experi6_19 <- list()
IR <- 1.25
Sys.time()
id <- 19
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_19 <- list(org, ros, rus, nea, smo)
write_rds(experi6_19, "experi6_19.rds")
rm(experi6_19)
Sys.time()
##################################################
experi6_20 <- list()
IR <- 1.25
Sys.time()
id <- 20
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_20 <- list(org, ros, rus, nea, smo)
write_rds(experi6_20, "experi6_20.rds")
rm(experi6_20)
Sys.time()
##################################################
experi6_21 <- list()
IR <- 1.25
Sys.time()
id <- 21
data     <- datasets[[id]]
data_ros <- balance(data, method = "ros")
data_rus <- balance(data, method = "rus")
data_nea <- balance(data, method = "Near miss")
data_smo <- balance(data, method = "SMOTE")

org = rashomon_set(data); Sys.time()
ros = rashomon_set(data_ros); Sys.time()
rus = rashomon_set(data_rus); Sys.time()
nea = rashomon_set(data_nea); Sys.time()
smo = rashomon_set(data_smo); Sys.time()

experi6_21 <- list(org, ros, rus, nea, smo)
write_rds(experi6_21, "experi6_21.rds")
rm(experi6_21)
Sys.time()
