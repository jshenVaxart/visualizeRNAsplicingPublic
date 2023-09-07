##check the different coverage using bedtools
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools \
bedtools coverage -b /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
-a /output/coverageFirst4000.bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/coverage4000.txt

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools \
bedtools coverage -b /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
-a /output/coverageFirst4000Splicesites.bed -F 1 \
>/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/coverage4000Splice.txt

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools \
bedtools coverage -b /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
-a /output/coverageJust1279to4500.bed -F 1 \
>/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/coverageJust1279to4500.txt


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools \
bedtools coverage -b /output/samtools/reference/20230419_1038_MN38318_FAV69906_9d58ac2e_sorted.bam \
-a /output/coverageFirst4000Splicesites.bed -f 1 \
>/vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e/coverageFirst4000SplicesitesNoCounts_f1.txt

##running apr19 again but with the gtf file in
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -G /output/Nanosplice_apr19_toFeedIntoStringtie.gtf \
-o /output/stringtie/long_reads_withNanospliceInput.out.gtf \
/output/samtools/reference/20230419_1038_MN38318_FAV69906_9d58ac2e_sorted.bam \
--viral=TRUE


##running apr19 again but with the gtf file in
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -G /output/stringtie/ECJ32transcripts.gtf \
-o /output/stringtie/long_reads_withNanospliceInput.out.gtf \
/output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_sorted.bam \
--viral=TRUE

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -G /output/stringtie/ECJ32transcripts.gtf \
-o /output/stringtie/long_reads_withNanospliceInput_g0.out.gtf \
/output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_sorted.bam \
--viral=TRUE -g 0
#didn't seem to help...

##bedtools, find only reads that fall within 

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools \
bedtools coverage -b /output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_sorted.bam \
-a /output/stringtie/ECJ32transcript.bed -f 1 >/vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/stringtie/coverageFirstTranscript.txt

#only mapped reads
samtools view -c -F 260 SAMPLE.bam

##only single mapped reads
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -G /output/stringtie/ECJ32transcripts.gtf \
-o /output/stringtie/long_reads_NoSecondary.out.gtf \
/output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_noSecondary_sorted.bam \
--viral=TRUE




docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
view -c -F 1796 /output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_sorted.bam ECJ32-CA0409H1HA-T2A-CA0709M1_New_CO:1160-4048\



>/vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/stringtie/1160to4048Coverage.txt
