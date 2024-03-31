Netmarble <- list(Revenue = c(6026,6033,6306,6656),
  OperatingProfit = c(-282,-372,-219,188),
  NetIncom = c(-458,-441,-285,-1856),
  QuaterPeriod = c('2023.03','2023.06','2023.09','2023.12'))

Netmarble$QuaterPeriod <- factor(Netmarble$QuaterPeriod)

names(Netmarble$Revenue) <- Netmarble$QuaterPeriod

RatioOperatingProfit <-  (Netmarble$OperatingProfit/Netmarble$Revenue)*100
RatioNetIncom <- (Netmarble$NetIncom/Netmarble$Revenue)*100

paste("2023 총 매출액 : ",sum(Netmarble$Revenue))
paste("2023 총 영업 이익 : ",sum(Netmarble$OperatingProfit))
paste("2023 총 당기순이익 : ",sum(Netmarble$NetIncom))

names(RatioOperatingProfit) <- Netmarble$QuaterPeriod
names(RatioNetIncom) <- Netmarble$QuaterPeriod

RatioOperatingProfit
RatioNetIncom

RevenueMean <- mean(Netmarble$Revenue)
paste("2023 평균 매출액 : ",RevenueMean)
Netmarble$Revenue[Netmarble$Revenue>RevenueMean]