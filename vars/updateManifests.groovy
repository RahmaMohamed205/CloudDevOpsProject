// =============================================================================
// Shared library step: updateManifests
// Updates the image reference of the microservice's Kubernetes Deployment
// manifest in the checked-out workspace. The change is committed and pushed
// by the pushManifests step; ArgoCD then syncs it into the cluster.
//
// config:
//   deploymentFile - path of the Deployment manifest, e.g. "Kubernetes/frontend/deployment.yaml"
//   imageName      - short image name used to match the image line
//   imageTag       - new image tag
//   registry       - ECR registry the image was pushed to
// =============================================================================
def call(Map config) {
    def newImage = "${config.registry}/${config.imageName}:${config.imageTag}"
    echo "Updating image in ${config.deploymentFile} to ${newImage}"
    sh "sed -i 's|image: .*${config.imageName}:.*|image: ${newImage}|' ${config.deploymentFile}"
    sh "grep -n 'image:' ${config.deploymentFile}"
}
