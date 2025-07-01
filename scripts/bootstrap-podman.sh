#!/usr/bin/env bash
set -Eeuo pipefail

source "$(dirname "${0}")/lib/common.sh"

export LOG_LEVEL="debug"
export ROOT_DIR="$(git rev-parse --show-toplevel)"

function main() {
    check_env PODMAN_VERSION
    check_cli jq minijinja-cli op

    if ! op whoami --format=json &>/dev/null; then
        log error "Failed to authenticate with 1Password CLI"
    fi

    # Bootstrap the Podman node configuration
    apply_podman_config
    bootstrap_podman

    log info "Congrats! Podman is bootstrapped"
}

main "$@"
