Year <- c('2017', '2018', '2019', '2020', '2021', '2022', '2023')
TotalBorn <- c(357771	, 326822 , 302676	, 272337 , 260562	, 249186 , 230000)
Marry <- c(264455 , 257622 , 239159	, 213502 , 192507	, 191690 , 193657)
Dead<- c(280827, 285534, 298820, 295110, 304948, 317680, 372939, 352700)
names(TotalBorn) <- Year
names(Marry) <- Year
names(Dead) <- Year
WhenFrom <- '2017'  #시작년도
WhenUntil <- '2020' #비교년도
PercentBorn <-  (1-(TotalBorn[WhenFrom]) / (TotalBorn[WhenUntil])) * 100
PercentMarry <-  (1-(Marry[WhenFrom]) / (Marry[WhenUntil])) * 100
PercentDead <- (1-(Dead[WhenFrom]) / (Dead[WhenUntil])) * 100
paste(WhenFrom,'부터',WhenUntil,'까지 출생아수 증가율',PercentBorn,'%',sep=' ')
paste(WhenFrom,'부터',WhenUntil,'까지 결혼 증가율',PercentMarry,'%',sep=' ')
paste(WhenFrom,'부터',WhenUntil,'까지 사망자수 증가율',PercentDead,'%',sep=' ')