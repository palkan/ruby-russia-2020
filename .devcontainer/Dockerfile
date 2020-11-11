# Note: You can use any Debian/Ubuntu based image you want.
ARG RUBY_VERSION
FROM mcr.microsoft.com/vscode/devcontainers/ruby:$RUBY_VERSION

ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

CMD [ "sleep", "infinity" ]
