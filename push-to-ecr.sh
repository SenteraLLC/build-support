# Login to AWS ECR (uses AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
pip install awscli
export PATH=$PATH:$HOME/.local/bin
eval $(aws ecr get-login --no-include-email --region us-east-1)

# Push tagged images
ECR_IMAGE_PREFIX="${ECR_BASE}/${SERVICE_NAME}"
ECR_IMAGE="${ECR_IMAGE_PREFIX}:${VERSION_TAG}"
echo "Pushing ${ECR_IMAGE}"
docker tag $VERSION_TAG $ECR_IMAGE
docker push $ECR_IMAGE
env_tags=$(wget -O - https://github.com/SenteraLLC/build-support/raw/master/env-tags.sh | bash)
for env_tag in $env_tags; do
  full_tag="${ECR_IMAGE_PREFIX}:${env_tag}"
  echo "Pushing ${full_tag}"
  docker tag $VERSION_TAG $full_tag
  docker push $full_tag
done
