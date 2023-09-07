#!/bin/bash


python3 /app/NanoSplicer/bin/NanoSplicer.py \
-i /output/samtools/reference/20230424_1632_MN38318_FAV69744_3a7ae622_sorted.bam \
-f /input/MinionData/D/APR242023/GD102_HEK293_RNA_48hrs_pi//no_sample/20230424_1632_MN38318_FAV69744_3a7ae622/fast5 -r /output/reference/reference.fa \
-o /output/nano_splicer/20230424_1632_MN38318_FAV69744_3a7ae622 /output/nano_splicer/20230424_1632_MN38318_FAV69744_3a7ae622.h5

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799/:/output -it 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanosplicer bash
conda activate NanoSplicer
nohup python3 /app/NanoSplicer/bin/NanoSplicer.py \
-i /output/samtools/reference/20230421_1447_MN38318_FAV67540_45e9a799_sorted.bam \
-f /input/MinionData/D/APR212023/ED102_HEK293_RNA_48hrs_pi/no_sample/20230421_1447_MN38318_FAV67540_45e9a799//fast5 \
-r /output/reference/reference.fa \
-o /output/nano_splicer/20230421_1447_MN38318_FAV67540_45e9a799 \
/output/nano_splicer/20230421_1447_MN38318_FAV67540_45e9a799.h5 &


nohup python3 /app/NanoSplicer/bin/NanoSplicer.py \
-i /output/samtools/reference/20230420_1004_MN38318_FAV71153_97bafe88.bam \
-f /input/MinionData/D/APR202023//no_sample/20230420_1004_MN38318_FAV71153_97bafe88/fast5/pass \
-r /output/reference/reference.fa \
-o /output/nano_splicer/20230420_1004_MN38318_FAV71153_97bafe88 \
/output/nano_splicer/20230420_1004_MN38318_FAV71153_97bafe88.h5 &

