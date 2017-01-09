#!/usr/bin/env bash
aws ec2 stop-instances --instance-ids i-07416efa63e8fd8a7
aws ec2 wait instance-stopped --instance-ids i-07416efa63e8fd8a7
aws ec2 describe-instance-status --instance-id i-07416efa63e8fd8a7
aws ec2 modify-instance-attribute --instance-id i-07416efa63e8fd8a7 --instance-type "{\"Value\": \"m3.medium\"}"
aws ec2 start-instances --instance-ids i-07416efa63e8fd8a7
