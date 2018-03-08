# Installing Fluentd on CentOS RHEL 7.4
1. Install the TD Fluentd agent
```
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh
```

2. Install plugins
```
td-agent-gem install fluent-plugin-azurestorage
```

3. (Optional) Install Ruby for native plugins
```
sudo yum install ruby
sudo yum install gcc-c++
sudo td-agent-gem install fluent-plugin-clouderametrics
sudo td-agent-gem install fluent-plugin-azurestorage
```

2. Basic commands
```
/etc/init.d/td-agent start
/etc/init.d/td-agent restart
/etc/init.d/td-agent stop
```
3. Test
```
curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test
```
4. View Logs
```
tail -f /var/log/td-agent/td-agent.log
```
4. Edit Config
```
vi /etc/td-agent/td-agent.conf
```

# Run Ansible playbook to configure td-agent
1. Install Ansible (MacOS X)
```
pip install ansible
```
2. Ping test
```
ansible all -m ping -u <username> -i hosts --ask-pass
```
3. Run Ansible playbook
```
ansible-playbook playbook.setup.yml -i ansible_inventory --ask-pass --ask-pass --ask-become-pass
```

# Splunk
1. Install Splunk
2. Setup Splunk paths and config
```
export SPLUNK_HOME=/Applications/Splunk
export PATH=$SPLUNK_HOME/bin:$PATH
```
2. Run the Splunk Little Helper application to start Splunk. You will need to update /Applications/Splunk/etc/splunk-launch.conf on MacOS X.
```
OPTIMISTIC_ABOUT_FILE_LOCKING = 1
```

## Splunk Commands
1. Remove all of the data
```
splunk clean eventdata
```