#!/bin/bash
if [[ -f .trivyignores ]];
then
    sudo rm .trivyignores
fi
if ! command -v trivy &> /dev/null
then
    echo "Error: Trivy could not be found. Please install it to continue."
    echo "https://github.com/aquasecurity/trivy#quick-start"
    exit 1
fi
cat ./.trivyignore.yaml
cat ./.trivyignore.yaml >> ./.trivyignores

trivy fs --ignorefile ./.trivyignores --format table --exit-code 1 --ignore-unfixed --scanners vuln,secret,config --severity CRITICAL,HIGH --no-progress ./
