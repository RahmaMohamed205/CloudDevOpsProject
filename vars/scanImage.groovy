// =============================================================================
// Shared library step: scanImage
// Scans the freshly built image with Trivy. The pipeline fails when a
// vulnerability at (or above) the configured severity is found.
//
// config:
//   imageName - short image name, e.g. "ivolve/frontend"
//   imageTag  - image tag
//   severity  - optional, comma separated severities (default "CRITICAL")
//   exitCode  - optional, Trivy --exit-code value (default "1" = fail the build)
// =============================================================================
def call(Map config) {
    def severity = config.severity ?: 'CRITICAL'
    def exitCode = config.exitCode ?: '1'
    echo "Scanning image ${config.imageName}:${config.imageTag} with Trivy (severity: ${severity}, exit-code: ${exitCode})"
    sh "trivy image --no-progress --severity ${severity} --exit-code ${exitCode} ${config.imageName}:${config.imageTag}"
}
