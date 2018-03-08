This folder is temporary and is used by package-tar-file.sh to tar the td-agent conf files

##### Apply Configuration Steps
1. Download the tar onto a VM
2. tar -xvf td-agent.tar.gz
3. pushd .
4. cd td-agent-config
5. chmod 744 configure-td-agent.sh
6. ./configure-td-agent.sh or ./configure-td-agent.sh cm
7. popd