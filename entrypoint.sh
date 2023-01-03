#!/bin/bash -xe

pwd
ls

j2 template.sh.j2 data.yaml > dns-lookup-tests.bats
# cat data.yaml
# cat dns-lookup-tests.bats

bats dns-lookup-tests.bats
rm -rvf dns-lookup-tests.bats