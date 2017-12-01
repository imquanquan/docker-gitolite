FROM alpine:latest

RUN set -x && \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache gitolite openssh && \
	passwd -u git

ADD git.pub /tmp/git.pub

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["sshd"]
