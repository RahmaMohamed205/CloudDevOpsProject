// =============================================================================
// Shared library step: pushManifests
// Commits the updated Kubernetes manifest and pushes it back to the GitHub
// repository so ArgoCD picks up the new image tag.
//
// config:
//   deploymentFile    - path of the manifest that was updated
//   serviceName       - microservice name (used in the commit message)
//   imageTag          - new image tag (used in the commit message)
//   branch            - branch to push to, e.g. "main"
//   repoOwner         - GitHub user/organization that owns the repository
//   repoName          - repository name, e.g. "CloudDevOpsProject"
//   gitCredentialsId  - Jenkins username/password credential (GitHub user + PAT)
// =============================================================================
def call(Map config) {
    withCredentials([usernamePassword(credentialsId: config.gitCredentialsId,
                                      usernameVariable: 'GIT_USER',
                                      passwordVariable: 'GIT_TOKEN')]) {
        sh """
            git config user.email "jenkins-ci@ivolve.local"
            git config user.name "Jenkins CI"
            git add ${config.deploymentFile}
            git commit -m "ci: deploy ${config.serviceName}:${config.imageTag} [skip ci]" || echo "No manifest changes to commit"
            git push https://\${GIT_USER}:\${GIT_TOKEN}@github.com/${config.repoOwner}/${config.repoName}.git HEAD:${config.branch}
        """
    }
    echo "Pushed updated manifests for ${config.serviceName}:${config.imageTag} to ${config.branch}"
}
