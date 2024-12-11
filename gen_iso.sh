docker run --rm --privileged --volume .:/build-container-installer/build  ghcr.io/jasonn3/build-container-installer:latest VERSION=40 IMAGE_REPO="ghcr.io/raxen001" IMAGE_NAME="custom-eduhorizon" IMAGE_TAG="latest" VARIANT=Silverblue
sudo chown raxen:raxen deploy.iso
chmod +x deploy.iso
