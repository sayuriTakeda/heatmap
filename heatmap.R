library(dplyr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)
library(ggthemes)
mut<- replicate(20, sample(c(0,1), 10, replace=TRUE))
mut<- as.data.frame(mut)
colnames(mut)<- paste0("sample", 1:20)
mut<- mut %>% mutate(gene=paste0("gene", 1:10))
head(mut)
mut.tidy<- mut %>% tidyr::gather(sample, mutated, 1:20)
mut.tidy$gene<- factor(mut.tidy$gene, levels = paste0("gene", 1:10))
mut.tidy$sample<- factor(mut.tidy$sample, levels = paste0("sample", 1:20))
mut.tidy$mutated<- factor(mut.tidy$mutated)
gg <- ggplot(mut.tidy, aes(x=sample, y=gene, fill=mutated)) + geom_tile(color="white", size=0.5)
gg<- gg + scale_fill_brewer(palette = "Set1", direction = -1)

gg<- gg + coord_equal()
gg<- gg + labs(x=NULL, y=NULL, title="mutation spectrum of 20 breast cancers")
gg <- gg + theme_tufte(base_family="Helvetica")
gg <- gg + theme(axis.ticks=element_blank())
gg <- gg + theme(axis.text.x=element_text(angle = 45, hjust = 1))
gg

# fazer para minha base de dados
teste <- df_profundidade[1:10,1:ncol(df_profundidade)]
teste.tidy<- teste %>% tidyr::gather(sample, mutated, 2:ncol(teste))
teste.tidy$mutated %<>% as.factor()  
teste.tidy$NUM_CPF %<>% as.factor() 
teste.tidy$sample %<>% as.factor() 
gg_2 <- ggplot(teste.tidy, aes(x=sample, y=NUM_CPF, fill=mutated)) + geom_tile(color="white", size=0.5)
gg_2 <- gg_2 + scale_fill_brewer(palette = "Set1", direction = -1)

gg_2<- gg_2 + coord_equal()
gg_2<- gg_2 + labs(x=NULL, y=NULL, title="teste")
gg_2 <- gg_2 + theme_tufte(base_family="Helvetica")
gg_2 <- gg_2 + theme(axis.ticks=element_blank())
gg_2 <- gg_2 + theme(axis.text.x=element_text(angle = 45, hjust = 1))
gg_2
