# gitlab-runner-windows Container

_WARNING_: this container is under development and should not be considered stable.

There is a [known issue with MSYS2-based programs](https://github.com/docker/for-win/issues/262) that prevents certain git related tools from running. This issue may prevent some usage of this container.

[![Docker Version](https://images.microbadger.com/badges/version/patsissons/gitlab-runner-windows.svg)](https://microbadger.com/images/patsissons/gitlab-runner-windows) [![Docker Image](https://images.microbadger.com/badges/image/patsissons/gitlab-runner-windows.svg)](https://microbadger.com/images/patsissons/gitlab-runner-windows) [![Docker Pulls](https://img.shields.io/docker/pulls/patsissons/gitlab-runner-windows.svg)](https://hub.docker.com/r/patsissons/gitlab-runner-windows/) [![Docker Stars](https://img.shields.io/docker/stars/patsissons/gitlab-runner-windows.svg)](https://hub.docker.com/r/patsissons/gitlab-runner-windows/) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`gitlab-runner` running in a windows container.

## Usage

Start the docker container with your public key:

```sh
docker run -d -e REGISTRATION_TOKEN=xxx -e CI_SERVER_URL='http://localhost/ci' -e RUNNER_NAME=gitlab-agent-1 -e RUNNER_TAG_LIST='WINDOWS,DOCKER' patsissons/gitlab-runner-windows
```

### Environment Variables

* REGISTRATION_TOKEN - token can be found at `http://.../admin/runners`
* CI_SERVER_URL - url is in the form `http://.../ci`
* RUNNER_TAG_LIST - comma separated list of tags to register with
* RUNNER_NAME - name to register the runner with
* RUNNER_EXECUTOR - see [docs](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/executors/README.md) for executors (defaults to `shell`)
* RUNNER_SHELL - executor shell to use, see [docs](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/executors/shell.md) for options (default to `cmd`)
* CONFIG_FILE - config path override (generally not used)
* REGISTER_RUN_UNTAGGED - *TBD*
* RUNNER_REQUEST_CONCURRENCY - *TBD*
* RUNNER_BUILDS_DIR - override the build path
* RUNNER_CACHE_DIR - override the cache path

See the [official gitlab-runner usage docs](https://github.com/bobey/docker-gitlab-ci-runner/blob/master/README.md#usage) for more information on supported enviornment variables