#!/ bin/bash

#cp /root/vaxart-batch-output/outputApril192023JS/pass/* /vaxart-batch-input/outputApril192023JS/pass

docker run -v //vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -t 4 -ax map-ont \
--eqx /input/Reference_Transcriptome/Transcriptome_Jun162022.fa/transcriptome.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_1_0.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_1_0.bam

docker run -v //vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -t 4 -ax map-ont \
--eqx /input/Reference_Transcriptome/Transcriptome_Jun162022.fa/transcriptome.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.bam

docker run -v //vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -t 4 -ax map-ont \
--eqx /input/Reference_Transcriptome/Transcriptome_Jun162022.fa/transcriptome.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.bam
#--MD 
#-p 0 -N 10 \

docker run -v //vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx /input/Reference_Transcriptome/Transcriptome_Jun162022.fa/transcriptome.fa \
-i /input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_0_0.sam


###combined fastq
docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -t 4 -ax map-ont \
--eqx /input/Reference_Transcriptome/Transcriptome_Jun292022/transcriptome.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
sort /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam \
-o /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
index /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
/output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam.bai


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
view /output/outputApril192023JS/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \

##can't visualize that bam because the naming convention is wrong??
##can we visualize the part that's aligned to the transgene and virus then?
##no what we need to do is to 

##ermin has _transcriptome with no splicing call
##and _sorted.bam for just the construct
###combined fastq

cd /vaxart-batch-output/outputApril192023JS/minimap
mv fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_transcriptome.bam

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx \
/input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools sort /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.bam -o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
samtools index /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam.bai

docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx -L --cs='long'-c \
/input/Reference_genome/GD102_Ad-CMV-VP8_GS-S2_Cyto-T2A-VP6_GS-BGH-SV40-Luc-SPA.fa \
/input/outputApril192023JS/pass/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c.fastq \
-o /output/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_cs.bam


##should we use no secondary mapping also? it's kind of confusing
docker run -v /vaxart-batch-input:/input -v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 minimap2 \
--sam-hit-only --MD -ax splice -uf -k14 --eqx --secondary=no \
/output/reference/reference.fa \
/output/minimap/20230830_1145_MN40653_FAW69791_f5030989.fastq \
-o /output/minimap/20230830_1145_MN40653_FAW69791_f5030989_noSecondary.bam

#samtools sort

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
sort /output/minimap/20230830_1145_MN40653_FAW69791_f5030989_noSecondary.bam -o /output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_noSecondary_sorted.bam

docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230830_1145_MN40653_FAW69791_f5030989:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
index /output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_noSecondary_sorted.bam \
/output/samtools/reference/20230830_1145_MN40653_FAW69791_f5030989_noSecondary_sorted.bam.bai

##can we try to put the junctions back and then see if it improves the mapping score?
docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230419_1038_MN38318_FAV69906_9d58ac2e:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 samtools \
view /output/minimap/fastq_runid_987888c28bdbf219178d381fcc2a6fa077bd974c_sorted.bam \
-h -b -q 30 -U below_q30.bam aligned.bam

##minimap to map the fasta file back to the reference and see if it's any different?
##but we should also filter out some of the reads?
