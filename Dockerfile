# https://github.com/sonatype/docker-nexus3
# https://hub.docker.com/r/sonatype/nexus3
FROM sonatype/nexus3:3.30.1

ENV NEXUS_PLUGINS ${NEXUS_HOME}/deploy

# https://github.com/flytreeleft/nexus3-keycloak-plugin
ENV KEYCLOAK_PLUGIN_VERSION 0.5.0
# The release name in the release page: https://github.com/flytreeleft/nexus3-keycloak-plugin/releases
ENV KEYCLOAK_PLUGIN_RELEASE_NAME v0.5.0

USER root

ADD https://github.com/flytreeleft/nexus3-keycloak-plugin/releases/download/${KEYCLOAK_PLUGIN_RELEASE_NAME}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar \
     ${NEXUS_PLUGINS}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar

RUN chmod 644 ${NEXUS_PLUGINS}/nexus3-keycloak-plugin-${KEYCLOAK_PLUGIN_VERSION}-bundle.kar

# setup permissions
RUN chown nexus:nexus -R /opt/sonatype/nexus

USER nexus
