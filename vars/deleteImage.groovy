// =============================================================================
// Shared library step: deleteImage
// Deletes the local copies of the image (short name and ECR-tagged name) so
// the Jenkins agent does not fill its disk.
//
// config:
//   imageName - short image name
//   imageTag  - image tag
//   registry  - ECR registry the image was tagged for
// =============================================================================
def call(Map config) {
    echo "Deleting local image ${config.imageName}:${config.imageTag}"
    sh """
        docker rmi ${config.imageName}:${config.imageTag} || true
        docker rmi ${config.registry}/${config.imageName}:${config.imageTag} || true
    """
}
