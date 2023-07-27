#!/bin/bash

docker run -v /vaxart-batch-output/outputApril192023JS/minimap/:/input \
-v /vaxart-batch-output/outputApril192023JS/NanoSplicer-output/:/output -it 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanosplicer bash


conda activate NanoSplicer
python /app/NanoSplicer/bin/JWR_checker.py

python /app/NanoSplicer/bin/JWR_checker.py \
--output_csv /input/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.h5
 
 
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS/:/output -it 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanosplicer bash

python3 /app/NanoSplicer/bin/NanoSplicer.py -i /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-f /input/MinionData/D/APRIL192023/GD102/HIEC-6_GD102_48hpi/20230419_1038_MN38318_FAV69906_9d58ac2e/fast5/ \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
-o /output/NanoSplicer-output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c /output/NanoSplicer-output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.h5

python3 /app/splice.py ${nano_splicer}/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.h5.csv
conda run -n NanoSplicer --live-stream python3 /app/splice.py ${nano_splicer}/${params.runid}.h5.csv
  
  
  