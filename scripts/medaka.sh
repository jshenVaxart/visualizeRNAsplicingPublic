docker run -v /vaxart-batch-input/:/input -v /vaxart-batch-output/:/output \
--gpus 0 ontresearch/medaka:latest medaka_haploid_variant -i /output/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq  \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
-o /output/outputApril192023JS/medaka


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230424_1632_MN38318_FAV69744_3a7ae622:/output \
--gpus 0 ontresearch/medaka:v1.8.0 medaka_haploid_variant \
-i /output/minimap/20230424_1632_MN38318_FAV69744_3a7ae622.fastq  \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa -o /output/medaka

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output \
--gpus 0 ontresearch/medaka:v1.8.0 medaka_haploid_variant \
-i /output/minimap/20230421_1447_MN38318_FAV67540_45e9a799.fastq  \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa -o /output/medaka

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230420_1004_MN38318_FAV71153_97bafe88:/output \
--gpus 0 ontresearch/medaka:v1.8.0 medaka_haploid_variant \
-i /output/minimap/20230420_1004_MN38318_FAV71153_97bafe88.fastq  \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa -o /output/medaka

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS:/output \
--gpus 0 ontresearch/medaka:v1.8.0 medaka_haploid_variant 
-i /output/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974cminimap/20230420_1004_MN38318_FAV71153_97bafe88.fastq  \
-r /input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa -o /output/medaka

