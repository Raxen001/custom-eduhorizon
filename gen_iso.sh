docker run --rm --privileged \
	--volume .:/build-container-installer/build  \
	--volume ./installer/lorax_templates:/additional_lorax_templates \
	ghcr.io/jasonn3/build-container-installer:latest \
	ADDITIONAL_TEMPLATES="/additional_lorax_templates/remove_root_password_prompt.tmpl" \
	VERSION=40 \
	IMAGE_REPO="ghcr.io/raxen001" \
	IMAGE_NAME="custom-eduhorizon"\
	IMAGE_TAG="latest"\
	VARIANT=Silverblue
sudo chown raxen:raxen deploy.iso
chmod +x deploy.iso
