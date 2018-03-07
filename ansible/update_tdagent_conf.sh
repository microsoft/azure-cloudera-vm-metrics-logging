#!/bin/bash
mv -f /etc/td-agent/td-agent.conf /etc/td-agent/td-agent.conf.bak
cat $1 /etc/td-agent/td-agent.conf.bak > /etc/td-agent/td-agent.conf