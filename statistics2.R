require(gdata)
df = read.xls("Assignment_2_Data.xlsx" ,sheet ="Lottery_Data",header=TRUE)

result <- apply(X = df,MARGIN=1, FUN= chisq.test)

str(chisq.test(df[1, ]))

plot(unlist(lapply(result, "[", "p.value"), use.names = FALSE))
