FROM bats/bats:1.8.2

RUN apk add --no-cache python3==3.9.16-r0 py3-pip==20.3.4-r1 \
&& pip install --no-cache-dir j2cli[yaml]==0.3.10

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/bash", "/entrypoint.sh" ]