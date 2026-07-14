node("image-builder") {
  def dockerRepo = "docker.io/careromspersonal/clock-trigger:latest"

  container("podman") {
    stage("Prepare build environment") {
      sh '''
        mkdir -p "${HOME}/.config/containers"
        cat > "${HOME}/.config/containers/auth.json" <<< "$PODMAN_AUTH"
        chmod 600 "${HOME}/.config/containers/auth.json"

        cat > "${HOME}/.config/containers/registries.conf" <<EOF
unqualified-search-registries = ["docker.io"]
EOF

        export REGISTRY_AUTH_FILE="${HOME}/.config/containers/auth.json"
      '''
    }

    stage("Build docker image") {
      sh "podman build -t ${dockerRepo} ."
    }

    stage("Push docker image") {
      sh "podman push ${dockerRepo}"
    }
  }
}