#!/bin/bash
MACHINE_TYPE='c1.medium'
BUCKET='pngr-emr-demo'
REGION='eu-west-1'
KEY_NAME='pedro@triffid'

aws emr create-cluster --release-label 'emr-4.0.0' --enable-debugging --visible-to-all-users --name PNGRDemo \
  --instance-groups  InstanceCount=1,InstanceGroupType=CORE,InstanceType=$MACHINE_TYPE InstanceCount=1,InstanceGroupType=MASTER,InstanceType=$MACHINE_TYPE \
  --no-auto-terminate --enable-debugging --log-uri s3://$BUCKET/EMR/logs \
  --bootstrap-actions Path=s3://$BUCKET/bootstrap/bootstrap.sh,Name=Install \
  --ec2-attributes KeyName=$KEY_NAME,InstanceProfile=EMR_EC2_DefaultRole \
  --service-role EMR_DefaultRole --region $REGION

