#install.packages("svDialogs")
library("svDialogs")

notebook <- read.table("notebooks.txt", header = T, sep = " ")

row.note <- nrow(notebook)
user.out = ""

while(T){
  user.pick1 <- dlgInput("원하는 노트북의 최대 가격을 입력해주세요. (ex/2000000)")$res
  user.pick1 <- as.numeric(user.pick1)
  user.pick2 <- dlgInput("원하는 노트북의 최대 화면 크기를 입력해주세요. (ex/14)")$res
  user.pick2 <- as.numeric(user.pick2)
  user.pick3 <- dlgInput("원하는 노트북의 최대 무게를 입력해주세요. (ex/2.5)")$res
  user.pick3 <- as.numeric(user.pick3)
  user.pick4 <- dlgInput("원하는 노트북의 최소 메모리 용량을 입력해주세요. (ex/16)")$res
  user.pick4 <- as.numeric(user.pick4)
  user.pick5 <- dlgInput("원하는 노트북의 최소 저장공간 용량을 입력해주세요. (ex/1024)")$res
  
  user.pick5 <- as.numeric(user.pick5)
  
  for(i in 1:row.note){
    if(i %% 2 == 1){
      cat(notebook[i, 'NAME'], "/", notebook[i, 'BRAND'], "|", notebook[i+1, 'NAME'], "/", notebook[i+1, 'BRAND'], "\n")
    }
  }
  
  user.pick <- dlgInput("콘솔창의 노트북 목록 중에서 원하는 노트북을 입력해주세요. (ex/OMEN_17)")$res
  
  while(1){
    idx <- which(notebook[, 'NAME'] == user.pick)
    if(length(idx)!=0){
      break
    }
    user.pick <- dlgInput("일치하는 이름이 없습니다. 제발 똑바로 입력해주세요. (ex/OMEN_17)")$res
  }
  
  if(notebook[idx, 'PRICE'] > user.pick1){
    cat(user.pick, "의 가격이", format(user.pick1, scientific = FALSE), "원 보다 비쌉니다.", "\n")
  }
  if(notebook[idx, 'INCH'] > user.pick2){
    cat(user.pick, "의 크기가", user.pick2, "인치보다 큽니다.", "\n")
  }
  if(notebook[idx, 'WEIGHT'] > user.pick3){
    cat(user.pick, "의 무게가", user.pick3, "KG 보다 무겁습니다.", "\n")
  }
  if(notebook[idx, 'MEMORY'] < user.pick4){
    cat(user.pick, "의 메모리가", user.pick4, "GB 보다 적습니다.", "\n")
  }
  if(notebook[idx, 'STORAGE'] < user.pick5){
    cat(user.pick, "의 저장공간이", user.pick5, "GB 보다 부족합니다.", "\n")
  }
  

  idx <- which((notebook[, 'PRICE'] <= user.pick1) & (notebook[, 'INCH'] <= user.pick2) & 
                 (notebook[idx, 'WEIGHT'] <= user.pick3) & (notebook[idx, 'MEMORY'] >= user.pick4) &
                 (notebook[idx, 'STORAGE'] >= user.pick5))
  
  if(length(idx)==0){
    cat("조건에 맞는 노트북이 없습니다.")
  } else {
    print(notebook[idx,])
  }

  user.out <- dlgInput("노트북을 재검색합니다.  프로그램 종료를 원하시면 (종료)를 입력해주세요. (종료가 아닌 다른 단어 또는 문장을 입력할 시 프로그램이 계속 반복됩니다.)")$res
  if(user.out == "종료"){
    break
  }
}