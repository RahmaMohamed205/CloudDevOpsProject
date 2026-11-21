// =============================================================================
// Shared library step: buildImage
// Builds the Docker image of a microservice.
//
// config:
//   imageName - short image name, e.g. "ivolve/frontend"
//   imageTag  - image tag, typically the Jenkins build number
//   context   - Docker build context directory relative to the workspace root
// =============================================================================
def call(Map config) {
    echo "Building Docker image ${config.imageName}:${config.imageTag} from ${config.context}"
    sh "docker build -t ${config.imageName}:${config.imageTag} ${config.context}"
}
