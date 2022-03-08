rmarkdown::render("impaired_for_TMDL.Rmd")

onion<-read.csv("C:/Users/leneo/Dropbox/Alene/Rscripts/Modeling_Workgroup/2022_stayCALM_ponded_internal-draft-assessments.csv")
onion<-onion %>% 
  select(seg_id:parameter) %>% 
  distinct() %>% 
  rename(LOCATION_PWL_ID=seg_id) %>% 
  mutate(value=1) %>% 
  filter(grepl("chloride",parameter)) %>% 
  mutate(basin=substr(LOCATION_PWL_ID,1,2)) 
onion %>% group_by(basin) %>% summarize(n=n())
