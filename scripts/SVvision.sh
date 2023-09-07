SVision
docker run -v /vaxart-batch-input/:/input -v /vaxart-batch-output/:/output \
620901718958.dkr.ecr.us-east-2.amazonaws.com/svision:latest Svision -h


jiadongxjtu/svision:latest


docker run -v /vaxart-batch-input/:/input \
-v /vaxart-batch-output/20230421_1447_MN38318_FAV67540_45e9a799:/output \
620901718958.dkr.ecr.us-east-2.amazonaws.com/stringtie stringtie \

DeBreak
docker run -v /vaxart-batch-input/:/input -v /vaxart-batch-output/:/output //quay.io/biocontainers/debreak:1.3--h9ee0642_0 debreak -v

Cue
docker run -v /vaxart-batch-input/:/input -v /vaxart-batch-output/:/output //620901718958.dkr.ecr.us-east-2.amazonaws.com/cue python /cue/engine/call.py