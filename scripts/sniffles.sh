#!/bin/bash

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output quay.io/biocontainers/sniffles:1.0.12--h8b12597_1 sniffles \
-m /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-v /output/outputApril192023JS/sniffles/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.vcf 

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/sniffles \
sniffles \
--input /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
--vcf /output/outputApril192023JS/sniffles/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_2_sorted.vcf 
