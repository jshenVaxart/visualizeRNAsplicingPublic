#!/bin/bash

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output quay.io/biocontainers/sniffles:1.0.12--h8b12597_1 sniffles \
-m /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-v /output/outputApril192023JS/sniffles/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.vcf 

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/sniffles \
sniffles \
--input /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
--vcf /output/outputApril192023JS/sniffles/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_2_sorted.vcf \
--non-germline

##sniffles2
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/sniffles \
sniffles --input /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam \
--vcf /output/sniffles/20230424_1632_MN38318_FAV69744_3a7ae622.vcf --non-germline --reference /output/reference/reference.fa

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx -L\
/input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_cs.bam

##different aligner
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS:/output quay.io/biocontainers/ngmlr:0.2.7--h9a82719_3 ngmlr \
-o /output/NGLMR/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam \
-q /input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa 
##need to supply reference to get deletions
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/sniffles \
sniffles --input /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
--vcf /output/sniffles/20230421_1447_MN38318_FAV67540_45e9a799.vcf \
--non-germline --reference /output/reference/reference.fa


