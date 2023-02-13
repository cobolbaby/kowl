#! /bin/bash
cd `dirname $0`

PROXY=http://10.190.41.209:3389/
VERSION=v1.5.2

KOWL_GIT_SHA=905ce28
KOWL_GIT_REF=master
KOWL_TIMESTAMP=1667979813
BUILT_FROM_PUSH=release

docker build --rm -f Dockerfile \
            -t registry.inventec/infra/cloudhut/kowl:${VERSION} \
            --build-arg KOWL_GIT_SHA=${KOWL_GIT_SHA} \
            --build-arg KOWL_GIT_REF=${KOWL_GIT_REF} \
            --build-arg KOWL_TIMESTAMP=${KOWL_TIMESTAMP} \
            --build-arg BUILT_FROM_PUSH=${BUILT_FROM_PUSH} \
            --build-arg http_proxy=${PROXY} \
            --build-arg https_proxy=${PROXY} \
            --build-arg no_proxy=*.inventec.net,*.inventec \
            .

docker push registry.inventec/infra/cloudhut/kowl:${VERSION}
