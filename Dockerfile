FROM registry.redhat.io/rhdm-7/rhdm-decisioncentral-rhel8
ENV HOME /opt
ENV KIE_HOME $HOME/kie
ENV KIE_DATA $KIE_HOME/data
ENV JBOSS_HOME $HOME/eap
ENV JBOSS_CONFIG /opt/eap/standalone/configuration
ENV JBOSS_BIN $JBOSS_HOME/bin
# default workbench git repository set to /opt/kie/data/.niogit
ENV GIT $KIE_DATA/git
ENV GITHOOKS $GIT/hooks
RUN mkdir $KIE_DATA
RUN mkdir $GIT
RUN mkdir $GITHOOKS
# default local maven repository set to /opt/.m2/repository
# default workbench maven repository set to /opt/kie/data/maven_repo
ENV KIE_ADMIN_USER=dmAdmin
ENV KIE_ADMIN_PWD=redhatdm1!
ENV MAVEN_REPO_ID=io.cloudrepo
ENV MAVEN_REPO_URL=https://maucar.mycloudrepo.io/repositories/pocrepo
ENV MAVEN_REPO_USERNAME=mcarioli@redhat.com
ENV MAVEN_REPO_PASSWORD=redhatdm1!
ENV GIT_HOOKS_DIR=$GITHOOKS
ENV DECISION_CENTRAL_MEMORY_LIMIT=2Gi
USER jboss
EXPOSE 8080 8001
ENTRYPOINT ["/opt/eap/bin/openshift-launch.sh"]
CMD ["-c","standalone-openshift.xml","-b","0.0.0.0"]