cp ../FluentD/td-agent.metrics.conf td-agent-config/
cp ../FluentD/td-agent.cloudera.conf td-agent-config/
cp configure-td-agent.sh td-agent-config/
cp azure_tags_env_variables.py td-agent-config/
tar -cvzf td-agent.tar.gz td-agent-config 