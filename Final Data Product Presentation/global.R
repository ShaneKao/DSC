train_data=readLines("traindata.txt")
pred=function(input,n){
        input<-tolower(input)
        input<-gsub("[^0-9a-z\ ]","",input)
        pattern=paste(paste(rev(rev(strsplit(input," ")[[1]])[1:n]),collapse = " "),".",sep=" ")
        x=train_data[grep(pattern,train_data)]
        if(length(x)!=0){
                word=c()
                for(i in 1:length(x)){
                        seg=paste0(paste(rev(rev(strsplit(input," ")[[1]])[1:n]),collapse = " ")," ")
                        word=append(word,strsplit(strsplit(x[i],seg)[[1]][2]," ")[[1]][1])                   
                }
                word<-gsub("\"","",word)
                output=as.data.frame(table(word)) 
                output$probability<-output$Freq/length(x)
                head(output[order(output$probability,decreasing=TRUE),c("word","probability")],10)
        }else{
                data.frame("word"="","probability"="")
        }
}