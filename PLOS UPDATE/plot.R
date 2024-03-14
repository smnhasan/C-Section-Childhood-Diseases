#C-section

require(ggplot2)
tiff("barChart.tif", units="in", width=8, height=5, res=600)
df2 <- data.frame(CSection=rep(c("Yes", "No"), each=4),
                  dose=rep(c("BDHS (2011)", "MICS (2012)", "BDHS (2014)", "MICS (2019)"),2),
                  len=c(17.1,19.1, 23.3, 36.0, 82.9, 80.9, 76.7, 64.0))


# Change the colors manually
p <- ggplot(data=df2, aes(x=reorder(dose, sort(len)), y=len, fill=CSection)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()+ xlab("C-section") + ylab("Percentage of children")

# Use brewer color palettes
p + geom_text(aes(label=len), vjust=-0.7, color="Black",
              position = position_dodge(1), size=4)+ scale_fill_brewer(palette="Dark2")+labs(fill = "C-section")
dev.off()


#disease count

require(ggplot2)
tiff("barChart.tif", units="in", width=20, height=16, res=600)
df2 <- data.frame(CSection=c("0", "1","2","3","4",
                             "0","1","2","3","4","5",
                                 "0", "1","2","3","4",
                                 "0","1","2","3","4","5"),
                  dose=c("BDHS (2011)","BDHS (2011)","BDHS (2011)","BDHS (2011)","BDHS (2011)",
                         "MICS (2012)","MICS (2012)","MICS (2012)","MICS (2012)","MICS (2012)","MICS (2012)",
                             "BDHS (2014)","BDHS (2014)","BDHS (2014)","BDHS (2014)","BDHS (2014)",
                             "MICS (2019)","MICS (2019)","MICS (2019)","MICS (2019)","MICS (2019)","MICS (2019)"),
                  len=c(1805,1058,911,719,255,
                        100, 1116, 2939, 2738, 696, 244,
                        2331,852,697,615,62,
                        52,916,4309,3143,598,60))
head(df2)

# Change the colors manually
p <- ggplot(data=df2, aes(x=reorder(dose, sort(len)), y=len, fill=CSection)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  theme_minimal()+ xlab("Suevey Years") + ylab("Number of children")+ ylim(0, 4500)

# Use brewer color palettes
p + geom_text(aes(label=len), vjust=0.4,hjust=-0.2, angle = 90,color="Black", size=4,
              position = position_dodge(1), size=4)+ scale_fill_brewer(palette="Dark2") +labs(fill = "Disease") + theme(axis.text=element_text(size=15),
                                axis.title=element_text(size=20)) 
dev.off()


