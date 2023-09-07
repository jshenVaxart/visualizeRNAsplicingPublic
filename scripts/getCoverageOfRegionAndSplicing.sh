#!/bin/bash

#using samtools to figure out how many splicing events are in the bam file
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools view -f  'cigar!~"N"' /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam \
-bo /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicing.bam


##bedtools coverage for the transgene
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam \
-counts -f 0.1 -bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sortedCoverage.txt 

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicing.bam \
-counts -f 0.1 -bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicingCoverage.txt 

#

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicing.bam \
-d  >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicingCoverage_d.txt 



docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools view -L -c 


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
intersect -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam -wo -bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_VP8VP6.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
intersect -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicing.bam -wo -bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicingVP8VP6.bed


docker run -v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
intersect -b /input/reference/VP8-VP6_transgene.bed \
-a /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam -wo -bed >/vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622/minimap/20230424_1632_MN38318_FAV69744_3a7ae622_VP8VP6.bed

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools view -f  'cigar!~"N"' /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam \
-bo /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted_spliced.bam

docker run -v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
intersect -b /input/reference/VP8-VP6_transgene.bed \
-a /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted_spliced.bam -wo -bed >/vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622/minimap/20230424_1632_MN38318_FAV69744_3a7ae622_sorted_spliced_VP8VP6.bed

docker run -v /vaxart-batch-input//:/input \
-v /vaxart-batch-output//:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
intersect -b /input/reference/VP8-VP6_transgene.bed \
-a /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam.bai.bam -wo -bed >/vaxart-batch-output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_spliced.bed



#do this for Apr19?
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools view -f  'cigar!~"N"' /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-bo /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted_splicing.bam

docker run -v /vaxart-batch-output/:/input \
-v /vaxart-batch-output/outputApril192023JS:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /input/20230421_1447_MN38318_FAV67540_45e9a799/reference/VP8-VP6_transgene.bed \
-a /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted_splicing.bam \
-counts -f 0.1 -bed |/output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.txt 


docker run -v /vaxart-batch-output/:/input \
-v /vaxart-batch-output/outputApril192023JS:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /input/20230421_1447_MN38318_FAV67540_45e9a799/reference/VP8-VP6_transgene.bed \
-a /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-counts -f 0.1 -bed |wc