#!/bin/bash
source /opt/rh/python27/enable

# Set the environment variables for the td-agent service
python azure_tags_env_variables.py
source AzureTagsEnvVariables

# Append custom configs to existing td-agent.conf
if [[ $1 = "cm" ]]; then
    echo "Appending Clouder Manager and Metrics fluentd plugin..."
    cat td-agent.cloudera.conf td-agent.metrics.conf > fluentd.conf
else
    echo "Appending Metrics fluentd config..."
    cat td-agent.metrics.conf > fluentd.conf
fi

# Run fluentd agent
/opt/td-agent/embedded/bin/fluentd -p /mnt/resource/td-agent-config -c fluentd.conf &