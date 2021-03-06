#!/bin/sh -l

# Copy the matcher to a shared volume with the host; otherwise "add-matcher"
# can't find it.
cp /problem-matcher.json ${HOME}/
echo "::add-matcher::${HOME}/problem-matcher.json"

cd $GITHUB_WORKSPACE
test -z "${INPUT_PHPCS_STANDARD}" && INPUT_PHPCS_STANDARD=Magento2
sh -c "/root/.composer/vendor/bin/phpcs --report=checkstyle --standard=$INPUT_PHPCS_STANDARD $GITHUB_WORKSPACE/$1 -s $*"
