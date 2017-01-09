"""
Generate a raw stack with all actions.

To start with modify FROM_STACK_NAME and TO_STACK_NAME and ACTIONS
"""

import os
import glob
import json
from collections import OrderedDict

FROM_STACK_NAME = 'core'
TO_STACK_NAME = 's3'
ACTIONS = ['create', 'delete', 'update', 'describe']


def create_action_scripts():
    for file in glob.glob('./%s-*' % FROM_STACK_NAME):
        for action in ACTIONS:
            if '%s.sh' % action in file:
                new_file_name = '%s-%s.sh' % (TO_STACK_NAME.lower(), action)
                if os.path.exists(new_file_name):
                    print("%s exists, skip" % new_file_name)
                    continue
                with open(file) as f:
                    cnt = f.read()
                    new_cnt = cnt \
                        .replace('-%s' % FROM_STACK_NAME.title(), '-%s' % TO_STACK_NAME.title()) \
                        .replace('%s.json' % FROM_STACK_NAME, '%s.json' % TO_STACK_NAME) \
                        .replace('%s-parameters.json' % FROM_STACK_NAME, '%s-parameters.json' % TO_STACK_NAME)

                    with open(new_file_name, 'w') as fo:
                        fo.write(new_cnt)
                    print("created: %s" % new_file_name)


def create_basic_templates():
    def create_file(f, data):
        if os.path.exists(f):
            print("%s exist, skip." % f)
        with open(f, 'w') as f:
            f.write(json.dumps(data, indent=4))

    create_file('./%s-parameters.json' % TO_STACK_NAME, [{}])
    data = OrderedDict([
        ('AWSTemplateFormatVersion', '2010-09-09'),
        ('Description', ''),
        ('Resources', ''),
    ])
    create_file('./%s.json' % TO_STACK_NAME, data)


if __name__ == '__main__':
    create_action_scripts()
    create_basic_templates()
