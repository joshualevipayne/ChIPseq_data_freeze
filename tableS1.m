function [] = tableS1(sig)
%To analyze and print out the data from the experiments listed as
%significant in Table S1, type tableS1(1). 
%To analyze and print out the data from the experiments listed as
%significant in Table S1, type tableS1(0). 

if sig
    fnames = fopen('filenames_significant.txt');
else
    fnames = fopen('filenames_insignificant.txt');
end

i = 1;
while ~feof(fnames)
   
   %extract file name
   line = strtok(fgets(fnames)); %strtok works like chomp
   
   %load file
   eval(['!cut -f 2-6 ' line ' > temp.txt']);
   data = load('temp.txt');
   
   %determine which sequences are bound, based on the in vitro data
   Escore = mean(data(:,1:2),2);
   bound = Escore > 0.35;
   
   %determine which sequences are enriched, based on the in vivo data
   enrichment = data(:,3) ./ data(:,4);
   enrichment_pval = data(:,5); 
   enriched = enrichment_pval < 1/32896;
   
   %determine the proportion of sequences that are bound in vitro that are
   %also enriched in vivo
   percentage = 100* (sum(bound & enriched) / sum(bound));
   
   %calculate Spearman's correlation between in vitro binding affinity and
   %in vivo enrichment
   if sum(bound & enriched) > 0
    [r p] = corr(Escore(bound & enriched),enrichment(bound & enriched),'type','spear');
   else
       r = nan;
       p = nan;
   end
   
   %display information
   fprintf('Experiment: %s\n',line);
   fprintf('%d out of %d bound sequences are enriched (%2.2f).\n',sum(bound & enriched),sum(bound),percentage);
   fprintf('Spearmans r = %f, p = %f between affinity and enrichment of bound sequences\n\n',r,p);
   
   !rm temp.txt 
   i = i+1;
   
end