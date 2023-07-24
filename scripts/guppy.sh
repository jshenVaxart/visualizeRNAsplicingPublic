#!/bin/bash

docker run -it --gpus all \
-v /vaxart-batch-input/MinionData/D/APRIL192023/GD102/HIEC-6_GD102_48hpi/20230419_1038_MN38318_FAV69906_9d58ac2e/fast5:/input \
-v /vaxart-batch-output/outputApril192023JS/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/guppy guppy_basecaller \
-i /input -s /output -c rna_r9.4.1_70bps_hac.cfg -x "cuda:0"


##and then we need to like combine all the fastq files right?
cd /vaxart-batch-output/outputApril192023JS/pass
cat *.fastq > fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq

docker run -v /vaxart-batch-input/:/input -v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools --help