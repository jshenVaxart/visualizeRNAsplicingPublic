#de novo to check how stringtie quantifies
#necat is the one that corrects error as it goes along https://github.com/xiaochuanle/NECAT
##change config file
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output quay.io/biocontainers/necat:0.0.1_update20200803--h43eeafb_4 \
necat necat.pl config /output/ECJ32config.txt

config ecoli_config.txt

necat.pl config ecoli_config.txt

##i guess I'll try consent if it's working better
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output quay.io/biocontainers/consent:2.2.2--h5b5514e_3 CONSENT-correct \
--in /output/minimap/20230830_1145_MN40653_FAW69791_f5030989.fastq --out /output/consent/result.fasta --type PB


docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx \
/output/reference/reference.fa \
/output/consent/result.fasta \
-o /output/consent/deNovoMappedBack.bam

##sort
##
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools index /output/consent/deNovoMappedBack_sorted.bam 

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/deNovoMappedBack_sorted.out.gtf /output/consent/deNovoMappedBack_sorted.bam \
--viral=TRUE


##de novo of apr 19
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e:/output quay.io/biocontainers/consent:2.2.2--h5b5514e_3 CONSENT-correct \
--in /output/minimap/20230419_1038_MN38318_FAV69906_9d58ac2e.fastq --out /output/consent/result.fasta --type PB

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output quay.io/biocontainers/consent:2.2.2--h5b5514e_3 CONSENT-correct \
--in /output/minimap/20230830_1145_MN40653_FAW69791_f5030989.fastq --out /output/consent/result.fasta --type PB