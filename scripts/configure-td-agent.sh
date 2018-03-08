#!/bin/bash
source /opt/rh/python27/enable

# Set the environment variables for the td-agent service
python azure_tags_env_variables.py
cat AzureTagsEnvVariables > /etc/sysconfig/td-agent

# Stop the td-agent
/etc/init.d/td-agent stop

# Create a backup of the td-agent.conf
mv -f /etc/td-agent/td-agent.conf /etc/td-agent/td-agent.conf.bak

# Append custom configs to existing td-agent.conf
if [[ $1 = "cm" ]]; then
    echo "Appending Clouder Manager and Metrics td-agent config..."
    cp in_clouderametrics.rb /etc/td-agent/plugin
    cat td-agent.cloudera.conf td-agent.metrics.conf /etc/td-agent/td-agent.conf.bak > /etc/td-agent/td-agent.conf
else
    echo "Appending Metrics td-agent config..."
    cat td-agent.metrics.conf /etc/td-agent/td-agent.conf.bak > /etc/td-agent/td-agent.conf
fi

# Restart the td-agent
/etc/init.d/td-agent restart