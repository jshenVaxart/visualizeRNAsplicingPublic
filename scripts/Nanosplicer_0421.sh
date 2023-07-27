#!/bin/bash

##rerun the nanosplicer 0421 that timed out
##by first subsetting the h5 file?
##and then 
##or maybe we need to think about the minimap files that we're mapping?
##minimap

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx \
/output/reference/reference.fa \
/output/minimap/20230421_1447_MN38318_FAV67540_45e9a799.fastq \
-o /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual.fastq.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools sort /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual.fastq.bam -o /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools index /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam.bai

