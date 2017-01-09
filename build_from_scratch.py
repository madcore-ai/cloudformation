"""
Script to create madcore cluster from scratch
"""

import subprocess
import json
import os
from collections import OrderedDict

INSTANCE_TYPE = 'm3.medium'
SPOT_PRICE = '0.02'
SUBDOMAIN = 'chirgeo'


def run_cmd(cmd, to_json=True):
    print("RUN CMD: %s..." % cmd)
    cwd = os.path.dirname(os.path.abspath(__file__))
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, cwd=cwd, shell=True)
    out, err = process.communicate()

    try:
        if to_json:
            o = json.loads(out)
            if 'describe' in cmd:
                o = output_to_dict(o)
            return o
    except:
        print("Continue")


def output_to_dict(output):
    d = {}
    for item in output['Stacks'][0]['Outputs']:
        d[item['OutputKey']] = item['OutputValue']

    output['Stacks'][0]['Outputs'] = d

    return output


def wait_until_stack_completed(stack_name):
    run_cmd('aws cloudformation wait stack-create-complete --stack-name MADCORE-%s' % stack_name, to_json=False)


def change_params(stack_type, replacer):
    with open('%s-parameters.json' % stack_type, 'r') as f:
        data = json.load(f, object_pairs_hook=OrderedDict)
        for item in data:
            if item['ParameterKey'] in replacer:
                if item['ParameterValue'] != replacer[item['ParameterKey']]:
                    item['ParameterValue'] = replacer[item['ParameterKey']]

    with open('%s-parameters.json' % stack_type, 'w') as f:
        f.write(json.dumps(data, indent=2, sort_keys=False) + '\n')


if __name__ == '__main__':
    run_cmd('./network-create.sh')
    wait_until_stack_completed("Net")
    net_output = run_cmd('./network-describe.sh')['Stacks'][0]['Outputs']
    print(net_output)

    run_cmd('./s3-create.sh')
    wait_until_stack_completed("S3")
    s3_output = run_cmd('./s3-describe.sh')['Stacks'][0]['Outputs']
    print(s3_output)

    change_params('sgfm', {'VpcId': net_output['VpcId']})
    run_cmd('./sgfm-create.sh')
    wait_until_stack_completed("FollowMe")
    sgfm_output = run_cmd('./sgfm-describe.sh')['Stacks'][0]['Outputs']
    print(sgfm_output)

    change_params('core', {'FollowmeSecurityGroup': sgfm_output['FollowmeSgId'],
                           'PublicNetZoneA': net_output['PublicNetZoneA'], 'S3BucketName': s3_output['S3BucketName'],
                           'InstanceType': INSTANCE_TYPE})
    run_cmd('./core-create.sh')
    wait_until_stack_completed("Core")
    core_output = run_cmd('./core-describe.sh')['Stacks'][0]['Outputs']
    print(core_output)

    change_params('cluster', {'VpcId': net_output['VpcId'], 'MasterIP': core_output['MadCorePrivateIp'],
                              'PublicNetZoneA': net_output['PublicNetZoneA'], 'S3BucketName': s3_output['S3BucketName'],
                              'InstanceType': INSTANCE_TYPE, 'SpotPrice': SPOT_PRICE})

    run_cmd('./cluster-create.sh')
    wait_until_stack_completed("Cluster")
    cluster_output = run_cmd('./cluster-describe.sh')['Stacks'][0]['Outputs']
    print(cluster_output)

    change_params('dns', {'SubDomainName': SUBDOMAIN, 'EC2PublicIP': core_output['MadCorePublicIp']})
    run_cmd('./dns-create.sh')
    wait_until_stack_completed("Dns")
    dns_output = run_cmd('./dns-describe.sh')['Stacks'][0]['Outputs']
    print(dns_output)

