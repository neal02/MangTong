library(svDialogs)
options(scipen = 999) #⁠일반적 숫자 형식 표시, 지수형식 지양

GameComStock <- read.table("9주차망통한국게임사주가.txt",header = T,sep = " ")
GameComPer <- read.table("9주차망통한국게임사실적.txt",header = T,sep = " ")

colnames(GameComStock) <- gsub("^X", "", colnames(GameComStock)) #열이름에서 x빼기

rownames(GameComStock) <- GameComStock[,1]
GameComStock <- GameComStock[,-1]
GameComStock <- as.matrix(GameComStock)

rownames(GameComPer) <- GameComPer[,1]
GameComPer <- GameComPer[,-1]
GameComPer <- as.matrix(GameComPer)

want = dlgInput("원하는 정보를 입력하세요. 회사별 주가, 전체 주가, 실적")$res

if(want == "전체 주가"){
  par(mfrow = c(1,1), mar = c(5, 6, 5, 10))
  barplot(GameComStock, main = "한국 게임사 주가",
          ylab = "원", las = 0,
          col = rainbow(7), beside = T, 
          legend.text = T, args.legend = list(x='topright', bty = 'n', inset=c(0, -0.1)))
} else if(want == "실적") {
  perform = dlgInput("원하는 실적을 입력해주세요. (시가총액, 매출액, 영업이익, 당기순이익)")$res
  if(perform == "시가총액"){
    pie(GameComPer[,"시가총액"])
  } else if(perform == "매출액"){
    pie(GameComPer[,"매출액"])
  } else if(perform == "영업이익"){
    par(mfrow = c(1,1), mar = c(7, 6, 3, 10))
    barplot(GameComPer[,"영업이익"], ylab = "억원", las = 2, main = "2024년도 1분기 회사별 영업이익", col = "skyblue")
  } else if(perform == "당기순이익"){
    par(mfrow = c(1,1), mar = c(7, 6, 3, 10))
    barplot(GameComPer[,"당기순이익"],ylab = "억원",  las = 2, main = "2024년도 1분기 회사별 당기순이익", col = "skyblue")
  } else {
    cat("해당 정보는 없습니다.")
  }
} else if(want == "회사별 주가") {
  name = dlgInput("원하는 회사을 입력해주세요.
                  (PearlAbyss, NetMarble, Krafton, KakaoGames,NCsoft,NeoWiz,NexonGames)")$res
  if(name == "PearlAbyss"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "NetMarble"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "Krafton"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "KakaoGames"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "NCsoft"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "NeoWiz"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else if(name == "NexonGames"){
    barplot(GameComStock[name,],horiz = T, las = 1, main = paste(name,"주가"), col = "skyblue")
    
  } else {
    cat("해당 정보는 없습니다.")
  }
  
} else {
  cat("해당 정보는 없습니다.")
}

