#!/bin/bash

#using samtools to figure out how many splicing events are in the bam file
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools view -e  'cigar!~"N"' /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam \
-bo /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted_splicing.bam


##bedtools coverage for the transgene
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/bedtools bedtools \
coverage -b /output/reference/VP8-VP6_transgene.bed \
-a /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sorted.bam \
-counts -f 0.1 -bed >/vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/minimap/20230421_1447_MN38318_FAV67540_45e9a799_manual_sortedCoverage.txt 