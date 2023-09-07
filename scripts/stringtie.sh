##stringtie trials



docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
--viral=TRUE

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
--viral=TRUE

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam \
--viral=TRUE

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230420_1004_MN38318_FAV71153_97bafe88:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/samtools/reference/20230420_1004_MN38318_FAV71153_97bafe88_sorted.bam \
--viral=TRUE


##apr19
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_Ad.out.gtf /output/samtools/transcriptome_ad/20230419_1038_MN38318_FAV69906_9d58ac2e_sorted.bam \
--viral=TRUE

#apr20
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230420_1004_MN38318_FAV71153_97bafe88/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_Ad.out.gtf /output/samtools/transcriptome_ad/20230420_1004_MN38318_FAV71153_97bafe88_sorted.bam \
--viral=TRUE

#APR 21
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_Ad.out.gtf /output/samtools/transcriptome_ad/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam \
--viral=TRUE

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_Ad.out.gtf /output/samtools/transcriptome_ad/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
--viral=TRUE

##ED11
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230510_1320_X1_FAV63576_9e3eccf3//:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads.out.gtf /output/samtools/reference/20230510_1320_X1_FAV63576_9e3eccf3_sorted.bam \
--viral=TRUE

##
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_sorted.bam \
--viral=TRUE

##
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230828_1415_MN38318_FAW59700_efb92062:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \
-L -o /output/stringtie/long_reads_viral.out.gtf /output/samtools/reference/20230828_1415_MN38318_FAW59700_efb92062_sorted.bam \
--viral=TRUE

