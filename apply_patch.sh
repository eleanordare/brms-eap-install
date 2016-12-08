
JBOSS_HOME=./target/jboss-eap-7.0

# Update this with patch file.
BRMS_PATCH=jboss-brms-6.4.x-patch.zip
BRMS_PATCH_NAME=jboss-brms-6.4.x-patch

TRG_DIR=./target
SRC_DIR=./installs
SUPPORT_DIR=./configs

clear

echo "Install BRMS patch"

# Check to see if patch zip file is present.
if [ -r $SRC_DIR/$BRMS_PATCH ] || [ -L $SRC_DIR/$BRMS_PATCH ]; then
	echo Product patch is present.
	echo
else
	echo Need to download $BRMS_PATCH package from the Customer Portal
	echo and place it in the $SRC_DIR directory to proceed.
	echo
	exit
fi

echo
echo "Applying $BRMS_PATCH_NAME patch now..."
echo
unzip $SRC_DIR/$BRMS_PATCH
./$SRC_DIR/$BRMS_PATCH_NAME/apply-updates.sh $JBOSS_HOME eap7.0

if [ $? -ne 0 ]; then
	echo
	echo Error occurred during JBoss BRMS patching.
	exit
fi

echo "==============================================="
echo
echo "BRMS 6.4 patch installed."
echo
echo "==============================================="
