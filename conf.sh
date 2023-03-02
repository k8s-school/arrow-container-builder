# Build parameters
# ----------------
readonly REPO="gitlab-registry.in2p3.fr/lsst/arrow-container-builder"
# Tag to apply to the built image, or to identify the image to be pushed
GIT_HASH="$(git -C $DIR describe --dirty --always)"
readonly IMAGE_TAG="$GIT_HASH"
# WARNING "spark-py" is hard-coded in spark build script
readonly IMAGE="$REPO/arrow:$IMAGE_TAG"

