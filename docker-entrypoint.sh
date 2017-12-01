#!/bin/sh -

if [ "${1}" = 'sshd' ]; then
	ssh-keygen -A
	set -- /usr/sbin/sshd -D
fi

chown git:git /tmp/git.pub
su - git -c "gitolite setup -pk /tmp/git.pub"

exec "$@"
