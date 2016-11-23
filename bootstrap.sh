#!/bin/bash
NODE_VERSION=6.9.1
GITHUB_USER='revington'
GITHUB_REPO='emr-nodejs-article'

function install {
  # Installs the project with already built in dependencies
  local install_dir="/opt/$GITHUB_REPO"
  sudo mkdir -p "$install_dir"
  curl -vSL "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/tarball/master" | sudo tar xz -C $install_dir --strip-components=1
  pushd "$install_dir"
  /usr/local/bin/npm install -g .
  popd
}

# Install node
curl -SL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | sudo tar -xJ -C /usr/local --strip-components=1 

install
