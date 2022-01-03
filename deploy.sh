#!/usr/bin/env bash

yarn && yarn build
terraform -chdir=terraform apply -auto-approve
