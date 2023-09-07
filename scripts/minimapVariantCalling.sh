##variant calling minimap

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--cs -cx asm10 \
/input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_csShort.bam \
> /vaxart-batch-output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_csShort.paf


sort 

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx -L --cs -c \
/input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_csShort.bam \
> /vaxart-batch-output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_csShort.paf


minimap2 -cx asm5 -t8 --cs ref.fa asm.fa > asm.paf  # keeping this file is recommended; --cs required!
sort -k6,6 -k8,8n asm.paf > asm.srt.paf             # sort by reference start coordinate
k8 paftools.js call asm.srt.paf > asm.var.txt