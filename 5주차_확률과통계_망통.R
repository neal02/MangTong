price <- c(31870, 38880, 31830, 37860, 57000, 84300, 73800, 85100, 26990, 93900, 190000, 136000, 115250, 54990, 59900) #가격격
size <- c("mid", "midSUV", "mid", "midSUV", "mid", "midSUV", "mid", "midSUV", "compactSUV", "heavySUV", "heavy", "heavy", "heavy", "midSUV", "sports") #차종
fuel <- c("hybrid", "hybrid", "hybrid", "hybrid", "gasoline", "hybrid", "gasoline", "hybrid", "gasoline", "gasoline", "gasoline", "gasoline", "electric", "electric", "gasoline") #연료
fuelEf <- c(19.4, 15.5, 19.8, 15.7, 11.2, 9.6, 10.0, 9.4, 12.9, 6.4, 7.4, 8.9, 4.8, 5.1, 9.6) #연비
cc <- c(1999, 1598, 1999, 1598, 1998, 1998, 1991, 1991, 1341, 6162, 2979, 1995, 0, 0, 2261) #배기량
brand <- c("Hyundai", "Hyundai", "Kia", "Kia", "Bmw", "Bmw", "Benz", "Benz", "Chevrolet", "Chevrolet", "Maserati", "Maserati", "Tesla", "Tesla", "Ford") #브랜드

car.Info <- data.frame(price, fuelEf, cc, size, fuel, brand) #데이터프레임 생성

rownames(car.Info) <- c("Sonata", "Santafe", "K5", "Sorento", "3Series", "X3", "C-Class", "GLC-Class", "Trailblazer", "Tahoe", "Quattroporte", "Ghibli", "ModelS", "ModelY", "Mustang") #차 이름

car.Info #정리
str(car.Info)

car.price.order <- car.Info[order(price), ] #가격순 정렬
car.price.order
car.fuelEf.order <- car.Info[order(-fuelEf), ] #연비순 정렬
car.fuelEf.order

car.search <- subset(car.Info, 
                    price<=110000 &
                    #fuelEf >= 5 &
                    #cc >= 1600 &
                    #(brand == "Kia" | brand == "Hyundai") &
                    size == "midSUV"
                    ) #원하는 조건 검색

car.search

car.Info["Trailblazer", ] #원하는 차량 정보 검색