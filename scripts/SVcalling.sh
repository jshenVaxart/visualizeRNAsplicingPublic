##trying different SV calling programs on these runs to see if we can see
##any duplication, inversion or other SVs in the transgene region
##and if any splice sites show up as SVs

#SV vision
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output jiadongxjtu/svision:latest SVision -h

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230510_1320_X1_FAV63576_9e3eccf3:/output quay.io/biocontainers/debreak:1.3--h9ee0642_0 debreak \
--bam /output/samtools/reference/20230510_1320_X1_FAV63576_9e3eccf3_sorted.bam \
-o /output/debreak_out/ \
--depth 80 \
--poa --ref /output/reference/reference.fa

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230510_1320_X1_FAV63576_9e3eccf3:/output quay.io/biocontainers/debreak:1.3--h9ee0642_0 debreak \
--bam DeBreak/testdata/test_read.bam -o test_out/ --poa --rescue_large_ins \
--rescue_dup --ref DeBreak/testdata/test_ref.fa