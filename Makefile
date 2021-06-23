ENV = $1
TARGET = $2
ARGS = $3
CD = cd terraform/${TARGET}
BUCKET_NAME = ${ENV}-iam-state
VARS = ${ENV}.tfvars
AWS = $(shell ls -a ~/ | grep .aws)

backend:
ifeq ($(AWS),.aws)
	aws s3api create-bucket --bucket ${BUCKET_NAME} --create-bucket-configuration LocationConstraint=ap-northeast-1 --profile ${ENV}
else
	aws s3api create-bucket --bucket ${BUCKET_NAME} --create-bucket-configuration LocationConstraint=ap-northeast-1
endif

remote-enable:
	@${CD} && \
		terraform init \
		-input=true \
		-reconfigure \
		-backend-config "bucket=${BUCKET_NAME}" \
		-backend-config "profile=${ENV}"

create-env:
	@${CD} && \
		terraform workspace new ${ENV}

tf:
	@${CD} && \
		terraform workspace select ${ENV} && \
		terraform ${ARGS} \
		-var-file=${VARS}

import:
	@${CD} && \
		terraform workspace select ${ENV} && \
		terraform import  \
		-var-file=${VARS} \
		${ARGS}

plan:
	@${CD} && \
		terraform workspace select ${ENV} && \
		terraform plan ${ARGS} \
		-var-file=${VARS}

apply:
	@${CD} && \
		terraform workspace select ${ENV} && \
		terraform apply -auto-approve ${ARGS} \
		-var-file=${VARS}
