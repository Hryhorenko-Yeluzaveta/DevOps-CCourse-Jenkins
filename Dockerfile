FROM jenkins/jenkins:lts

USER root
RUN apt remove $(dpkg --get-selections docker.io docker-compose docker-doc docker-buildx podman-docker containerd runc | cut -f1)
RUN apt update && \
	apt install ca-certificates curl && \
	install -m 0755 -d /etc/apt/keyrings && \
	curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
	chmod a+r /etc/apt/keyrings/docker.asc
RUN tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo trixie)
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
RUN apt update && apt install -y docker-ce-cli docker-compose-plugin && \
	rm -rf /var/lib/apt/lists/*

COPY jenkins.yml /var/jenkins_config/jenkins.yml

USER jenkins

COPY plagins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
