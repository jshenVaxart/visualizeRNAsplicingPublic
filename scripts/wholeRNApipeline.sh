#!/ bin/bash

docker run -it --gpus all -v /vaxart-batch-input/MinionData/D/APRIL192023/GD102/HIEC-6_GD102_48hpi/20230419_1038_MN38318_FAV69906_9d58ac2e/fast5:/input -v /root/vaxart-batch-output/outputApril192023JS/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/guppy guppy_basecaller -i /input -s /output -c dna_r9.4.1_450bps_sup.cfg -x "cuda:0"

search_dir="/root/vaxart-batch-output/outputApril192023JS/pass"
for entry in $search_dir/*
do 
echo $entry
swap='root/vaxart-batch-output/outputApril192023JS/pass'
input="input"
file="${entry/$swap/"$input"}"
echo $file
docker run -v /root/vaxart-batch-output/outputApril192023JS/pass:/input \
-v /vaxart-batch-output/outputApril192023JS_fastqc/:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/fastqc \
fastqc $file -o /output -dir /output 
done




Minimap:

  cat ${folder}/pass/*.fastq > ${id}/minimap/${id}.fastq
minimap2 --MD -a ${reference_genome}/${genome}.fa ${id}/minimap/${id}.fastq -o ${id}/minimap/${id}.
#--MD         output the MD tag
#    -a           output in the SAM format (PAF by default)
# -x STR      
##- map-pb/map-ont: PacBio/Nanopore vs reference mapping
###The MD tag is for SNP/indel calling without looking at the reference. 
##It does this by carrying information about the reference that the read does not carry, for a particular alignment. A SNP’s alternate base is carried in the read, but without the MD tag or use of the alignment reference, it’s impossible to know what the reference base was. Thus, this information is carried in the MD tag. A SNP looks like:


docker run -v /root/vaxart-batch-output/outputApril192023JS/pass:/input \
-v /vaxart-batch-output/outputApril192023JS/minimap:/output 620901718958.dkr.ecr.us-east-2.amazonaws.com/nanopanel2 \
minimap2 --help


 minimap2 -t 8 -a <reference> <fastq|fasta>
 #from the paper using nanosplicer
 
 “-ax splice -t 32 -k 15 -ub --eqx --secondary=no --sam-hit-only --splice-flank=no”

##from the nancount github
minimap2 -t 4 -ax map-ont -p 0 -N 10 transcriptome.fa.gz reads.fastq.gz

##We activated
#“--eqx” option in minimap2 to output the CIGAR string with mismatch information. By default, the CIGAR string in the output BAM file uses “M” to indicate a match or mismatch. With
#“--eqx”, the matches and mismatches are denoted as “=” and “X”, respectively. We used the
#mismatch information when calculating the junction alignment qualitiy (see supplementary section 2.6). We deactivated the “splice flank” sequence preference option (“--splice-flank=no”)
#as this preference is not present in sequins; see supplementary section 1.8 for details on the
-p <cpus
  minimap2 --sam-hit-only --MD -ax splice -uf -k14 --eqx ${genome}/reference.fa minimap/${params.runid}.fastq -o minimap/${params.runid}_reference.bam
  minimap2 -t 4 -ax map-ont -p 0 -N 10 --MD --eqx ${genome}/transcriptome_human.fa minimap/${params.runid}.fastq -o minimap/${params.runid}_transcriptome_human.bam
  minimap2 -t 4 -ax map-ont -p 0 -N 10 --MD --eqx ${genome}/transcriptome_ad.fa minimap/${params.runid}.fastq -o minimap/${params.runid}_transcriptome_ad.bam
    -f FLOAT     filter out top FLOAT fraction of repetitive minimizers [0.0002]
    -u CHAR      how to find GT-AG. f:transcript strand, b:both strands, n:don't match GT-AG [n]
##why sam instead of bam??? a gives sam right
    -t INT       number of threads [3]

###from stringtie2
-splice