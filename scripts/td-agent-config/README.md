This folder is temporary and is used by package-tar-file.sh to tar the td-agent conf files

### Apply Configuration Steps

#### Appending to an existing configuration of the the td-agent
1. Download the tar onto a VM
2. tar -xvf td-agent.tar.gz
3. pushd .
4. cd td-agent-config
5. chmod 744 configure-td-agent.sh
6. ./configure-td-agent.sh or ./configure-td-agent.sh cm
7. popd

#### Running an instance of fluentd
1. Download the tar onto a VM
2. tar -xvf td-agent.tar.gz
3. pushd .
4. cd td-agent-config
5. chmod 744 start-fluentd-agent.sh
6. ./start-fluentd-agent.sh or ./start-fluentd-agent.sh cm
7. popd