# allows us to run commands in a subprocess, and pipe the results of those processes into python at run time.
from subprocess import Popen, PIPE
import json

raw_response = Popen(["curl", "-H", "Metadata:true", "http://169.254.169.254/metadata/instance?api-version=2017-08-01"], stdout=PIPE)
res = raw_response.stdout.read()

res_json = json.loads(res)
res_tags = res_json['compute']['tags']

with open("AzureTagsEnvVariables", "w") as file_obj:
  for pair in res_tags.split(';'):
    pair = pair.encode('ascii', 'ignore').upper()
    key_value = pair.split(':')
    print "key='{0}', value='{1}'\n".format(key_value[0], key_value[1])
    file_obj.write("export AZ_{0}=\"{1}\"\n".format(key_value[0], key_value[1]))