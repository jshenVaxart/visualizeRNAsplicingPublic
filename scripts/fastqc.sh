#!/ bin/bash

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
