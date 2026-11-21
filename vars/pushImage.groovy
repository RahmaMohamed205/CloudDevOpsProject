// =============================================================================
// Shared library step: pushImage
// Authenticates Docker against Amazon ECR, tags the image with the full
// registry URL and pushes it.
//
// config:
//   imageName        - short image name, e.g. "ivolve/frontend"
//   imageTag         - image tag
//   registry         - ECR registry, e.g. "123456789012.dkr.ecr.us-east-1.amazonaws.com"
//   region           - AWS region of the registry
//   awsCredentialsId - Jenkins username/password credential holding the AWS
//                      access key ID (username) and secret access key (password)
// =============================================================================
def call(Map config) {
    withCredentials([usernamePassword(credentialsId: config.awsCredentialsId,
                                      usernameVariable: 'AWS_ACCESS_KEY_ID',
                                      passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh """
            aws ecr get-login-password --region ${config.region} | docker login --username AWS --password-stdin ${config.registry}
            docker tag ${config.imageName}:${config.imageTag} ${config.registry}/${config.imageName}:${config.imageTag}
            docker push ${config.registry}/${config.imageName}:${config.imageTag}
        """
    }
    echo "Pushed ${config.registry}/${config.imageName}:${config.imageTag}"
}
