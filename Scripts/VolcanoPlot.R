# read data

deg.data <- read_delim("limma-voom_luminalpregnant-luminallactate.txt",delim = "\t",show_col_types = FALSE,col_types = cols(ENTREZID = col_character()))

# col change

deg.data <- deg.data %>%
  mutate(change = case_when(
    adj.P.Val < 0.05 & logFC > 1 ~ "Up2",
    adj.P.Val < 0.05 & logFC < -1 ~ "Down2",
    adj.P.Val < 0.05 & logFC > 0 ~ "Up",
    adj.P.Val < 0.05 & logFC < 0 ~ "Down",
    P.Value < 0.05 & logFC > 1 ~ "Up2noFDR",
    P.Value < 0.05 & logFC < -1 ~ "Down2noFDR",
    P.Value < 0.05 & logFC > 0 ~ "UpNoFDR",
    P.Value < 0.05 & logFC < 0 ~ "DownNoFDR",
    abs(logFC) <= log2(1.05) & P.Value > 0.5 ~ "Control",
    TRUE ~ "Other"
  ))

change.lvs = c("Other","Down2","Down2noFDR","Down","DownNoFDR","Control","UpNoFDR","Up","Up2noFDR","Up2")
deg.data$change = factor(deg.data$change,
                         levels = change.lvs)

# get label data frame

up2.top5 <- deg.data %>% 
  filter(change == "Up2") %>% 
  slice_min(adj.P.Val,n = 5) %>% 
  arrange(adj.P.Val)
down2.top5 <- deg.data %>% 
  filter(change == "Down2") %>% 
  slice_min(adj.P.Val,n = 5) %>% 
  arrange(adj.P.Val)

top10.sig = rbind(up2.top5,down2.top5)

# dont align label

p = ggplot(deg.data,
           aes(x = logFC,y = -log10(adj.P.Val)
               )) +
  geom_point(aes(color = change),size = 1)  +
  scale_color_manual(values = p.cols,na.value = "black")+
  geom_hline(yintercept = -log10(0.05),linetype = "dashed") +
  geom_vline(xintercept = c(-1,1),linetype = "dashed",alpha = 0.2) +
  scale_x_continuous(breaks = c(seq(-10,10,2)),limits = c(-10,10)) +
  labs(x = "Log2 FoldChange", y ="-log10 Adjusted P value",
       title = "Trt vs Ctrl",color = "expression change") +
  theme_base() +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_text_repel(data = top10.sig,  
                   aes(label = SYMBOL),
                   size = 3,
                   min.segment.length = 0,
                   #label.size = 0.5,
                   force = 2,
                   nudge_y = 0.5,
                   nudge_x = 1,
                   show.legend = F,
                   max.overlaps = 10
                   ) + 
  annotate("text", x = 9, y = 0.6,
           label = "981 genes\n Up2", color = "firebrick") +
  annotate("text", x = -9, y = 0.6,
           label = "1245 genes\n Down2", color = "blue")
  
p 

# or align label

## nudge-x rely on min max logFC

# > min(deg.data$logFC)
# [1] -9.314159
# > max(deg.data$logFC)
# [1] 7.440954

p = ggplot(deg.data,
           aes(x = logFC,y = -log10(adj.P.Val)
               )) +
  geom_point(aes(color = change),size = 1)  +
  scale_color_manual(values = p.cols,na.value = "black")+
  geom_hline(yintercept = -log10(0.05),linetype = "dashed") +
  geom_vline(xintercept = c(-1,1),linetype = "dashed",alpha = 0.2) +
  scale_x_continuous(breaks = c(seq(-10,10,2)),limits = c(-10,10)) +
  labs(x = "Log2 FoldChange", y ="-log10 Adjusted P value",
       title = "Trt vs Ctrl",color = "expression change") +
  theme_base() +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_text_repel(data = up2.top5,  
                   aes(label = SYMBOL),
                   size = 4,
                   segment.size = 0.5,
                   min.segment.length = 0,
                   #label.size = 0.5,
                   force = 0.5,
                   nudge_x = 8 - up2.top5$logFC,
                   direction = "y",
                   hjust = 0 
                   ) + 
  geom_text_repel(data = down2.top5,  
                   aes(label = SYMBOL),
                   size = 4,
                   segment.size = 0.5,
                   min.segment.length = 0,
                   #label.size = 0.5,
                   force = 0.5,
                   nudge_x = -abs(-9 - down2.top5$logFC),
                   direction = "y",
                   hjust = 1
                   ) + 
  annotate("text", x = 9, y = 0.6,
           label = "981 genes\n Up2", color = "firebrick") +
  annotate("text", x = -9, y = 0.6,
           label = "1245 genes\n Down2", color = "blue")
  
p 

# save

pdf("VolcanoPlot.pdf",width = 12,height = 12)
p
dev.off()

