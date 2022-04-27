# Get latest Jenkins weekly from offical jenkins docker
FROM jenkins/jenkins:2.332.2-lts-jdk11

USER root

# Install Google Cloud SDK

RUN apt-get update && apt-get install -y -qq --no-install-recommends wget unzip python openssh-client && apt-get clean
RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --disable-installation-options
RUN yes | google-cloud-sdk/bin/gcloud components update preview pkg-go pkg-python pkg-java
RUN mkdir /.ssh
ENV PATH /google-cloud-sdk/bin:$PATH
# VOLUME ["/.config"]

USER jenkins

# If you like to provide feedback on how to improve this image,
# please open an issue or a pull request for discussion!
