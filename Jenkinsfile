node("image-builder") {
  container("kaniko") {
    stage("Prepare build environment") {
      sh '''
        mkdir -p /kaniko/.docker
        printf '%s' "$PODMAN_AUTH" > /kaniko/.docker/config.json
      '''
    }

    stage("checkout") {
      checkout scm
    }

    stage("Build docker image") {
      sh '''
        /kaniko/executor \
          --context=`pwd` \
          --dockerfile=Dockerfile \
          --destination=careromspersonal/clock-trigger:latest
      '''
    }
  }
}

node("helm-deploy") {
  container("helm") {
    stage("Deploy with Helm") {
      sh "helm upgrade --namespace default --install schw ./"
    }
  }
}