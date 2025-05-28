Assembly:

----------------------------------------------------------------------------------

#!/bin/bash
# LOAD MODULES HERE IF REQUIRED
ml StringTie/2.1.4
# START THE APPLICATION
stringtie --rf -G Genome/gencode.v42.primary_assembly.annotation.gtf/gencode.v42.primary_assembly.annotation.gtf Sorted_BAM_files/C/154_50_C_S154.sorted.bam -o Assembly/All/154_assembly.gtf -A Assembly/C/154_abun.tab -C Assembly/C/154_cvrg.gtf -l 154
stringtie --rf -G Genome/gencode.v42.primary_assembly.annotation.gtf/gencode.v42.primary_assembly.annotation.gtf Sorted_BAM_files/C/160_6_S160.sorted.bam -o Assembly/All/160_assembly.gtf -A Assembly/C/160_abun.tab -C Assembly/C/160_cvrg.gtf -l 160
stringtie --rf -G Genome/gencode.v42.primary_assembly.annotation.gtf/gencode.v42.primary_assembly.annotation.gtf Sorted_BAM_files/C/161_S161.sorted.bam -o Assembly/All/161_assembly.gtf -A Assembly/C/161_abun.tab -C Assembly/C/161_cvrg.gtf -l 161

Merging:
-------------------------------------------------------------------------------
#!/bin/bash
# LOAD MODULES HERE IF REQUIRED
ml StringTie/2.1.4
# START THE APPLICATION
stringtie --merge *_assembly.gtf -G gencode.v42.primary_assembly.annotation.gtf -o merged.gtf

# check out the transcripts
cat merged.gtf | head

# how many transcripts?
cat merged.gtf | grep -v "^#" | awk '$3=="transcript" {print}' | wc -l
    550453

Quantification 
-----------------------------------------------------------------------------

stringtie -eB -G Assembly/All/merged.gtf Sorted_BAM_files/B/109_S109.sorted.bam -o Quantification/109/S109.gtf
stringtie -eB -G Assembly/All/merged.gtf Sorted_BAM_files/B/111_S111.sorted.bam -o Quantification/111/S111.gtf
stringtie -eB -G Assembly/All/merged.gtf Sorted_BAM_files/B/115_S115.sorted.bam -o Quantification/115/S115.gtf
