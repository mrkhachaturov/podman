export HOSTNAME=$(hostname)
envsubst < traefik.container.template > traefik.container