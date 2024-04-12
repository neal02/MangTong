#install.packages('svDialogs') # 패키지 설치
library(svDialogs)

pc.23 <- read.table('23년 PC방 점유율.txt',header = T, sep = ' ')
pc.23

pc.game <- dlg_input('점유율을 알고 싶은 게임명을 입력해주세요')$res
check1 <- subset(pc.23,subset = 게임명 == pc.game)
check1

pc.genre <- dlg_input('점유율을 알고 싶은 장르를 입력해주세요')$res
check2 <- subset(pc.23,subset = 장르 == pc.genre)
check2

pc.componey <- dlg_input('점유율을 알고 싶은 유통사를 입력해주세요')$res
check3 <- subset(pc.23,subset = 유통사 == pc.componey)
check3

pc.month <- dlg_input('점유율을 알고 싶은 시기를 입력해주세요ex(3, 6, 9, 12)')$res
check4 <- subset(pc.23,subset = 시기 == pc.month)
check4

write.table(check1, 'pc방 점유율 게임별 데이터.txt', append = F, row.names=F, sep = '\t')
write.table(check2, 'pc방 점유율 장르별 데이터.txt', append = F, row.names=F, sep = '\t')
write.table(check3, 'pc방 점유율 유통사별 데이터.txt', append = F, row.names=F, sep = '\t')
write.table(check4, 'pc방 점유율 시기별 데이터.txt', append = F, row.names=F, sep = '\t')