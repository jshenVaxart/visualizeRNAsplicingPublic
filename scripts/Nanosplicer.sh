#!/bin/bash

docker run -v /vaxart-batch-output/outputApril192023JS/minimap/:/input \
-v /vaxart-batch-output/outputApril192023JS/NanoSplicer-output/:/output -it 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanosplicer bash


conda activate NanoSplicer
python /app/NanoSplicer/bin/JWR_checker.py

python /app/NanoSplicer/bin/JWR_checker.py \
--output_csv /input/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.h5
 
python3 /app/NanoSplicer/bin/NanoSplicer.py -i /input/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-f /output/pass/ -r /vaxart-batch-input//Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
a -o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.h5
 



  cd ${nano_splicer}
  conda run -n NanoSplicer --live-stream python3 /app/splice.py ${nano_splicer}/${params.runid}.h5.csv
