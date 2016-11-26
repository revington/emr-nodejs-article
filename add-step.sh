#!/bin/bash
CLUSTER_ID=$1
BUCKET='pngr-emr-demo'
OUTPUT='output/1'

aws emr add-steps \
 --cluster-id $CLUSTER_ID \
 --steps Name=CountWords,Type=Streaming,Args=[-input,s3://$BUCKET/input,-output,s3://$BUCKET/$OUTPUT,-mapper,mapper,-reducer,reducer] 
