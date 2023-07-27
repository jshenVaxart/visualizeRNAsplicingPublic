#!/bin/bash

##nanocount

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanocount \
NanoCount -i /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \