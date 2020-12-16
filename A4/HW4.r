# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW4

# Download the file "mus.trans.txt". This file contains 1000 transcripts from the mouse genome.
# Make me a new output file that has the following columns in it
mydata<-read.table('mus.trans.txt', header=FALSE, stringsAsFactors = FALSE)


# 1. Column 1 - the name of the transcript (The "ENSMUST" thing, without the ">" or "|"). 
ensmust<-sapply(strsplit(x=mydata[,1], split='|', fixed=TRUE), FUN=function(x){x[1]})
ensmust<-gsub(x=ensmust, pattern='>', replacement='')
new_datafile<-data.frame(ENSMUST=ensmust)

# 2. Columns 2 through 5: the numbers of A's, C's, G's, and T's in each transcript.
sequences_vector = sapply(strsplit(x=mydata[,1], split='|', fixed=TRUE), FUN=function(x){x[2]})
sequences_list = strsplit(x=sequences_vector, split='')

for (base in c('A', 'C', 'G', 'T')) {
  count_list = sapply(sequences_list, FUN=function(x){x==base})
  count = sapply(count_list, FUN=function(x){sum(x)})
  new_datafile[paste('NUM_', base)] = count
}

# 3. Column 6: the number of letters that are NOT A, C, G, or T in each transcript
count_list = sapply(sequences_list, FUN=function(x){x!='A' & x!='C' & x!='G' & x!='T'})
count = sapply(count_list, FUN=function(x){sum(x)})
new_datafile[paste('NUM_NOT_BASE')] = count

# 4. Columns 7 through 10: the proportion of A's, C's, G's, and T's in each transcript.
for (base in c('A', 'C', 'G', 'T')) {
  count = new_datafile[paste('NUM_', base)][,1]
  total = sapply(sequences_list, FUN=function(x){length(x)})
  new_datafile[paste('PROPORTION_', base)] = count / total
}

# 5. Column 11: a logical TRUE/FALSE telling me whether that transcript starts with the canonical start codon, 'ATG'
starts_with_ATG = sapply(sequences_list, FUN=function(x){paste(x[1:3], collapse='') == 'ATG'})
new_datafile['STARTS_WITH_START_CODON'] = starts_with_ATG

# 6. Column 12: a logical TRUE/FALSE telling me whether that transcript ends with an acceptable stop codon ('TAA', 'TGA', or 'TAG')
checkCodon = function(x) {
  start = length(x)-2
  stop = length(x)
  codon = paste(x[start:stop], collapse='')
  return(codon == 'TAA' | codon == 'TGA' | codon == 'TAG')
}
ends_with_stop_codon = sapply(sequences_list, FUN=checkCodon)
new_datafile['ENDS_WITH_STOP_CODON'] = ends_with_stop_codon
