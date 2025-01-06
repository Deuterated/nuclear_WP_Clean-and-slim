#!/usr/bin/bash
echo -e "This dark sorcery uses the 'rm' command.\nRunning it outside a WP dcoroot likely won't do anything, but caution is advised.\nNEVER run this without a backup.\nI am not responsible for your poor decisions\n"
read -p "Capisce?(Y/N)"
if [[ $REPLY =~ ^[Yy]$ ]]
then
# remove files that don't belong
for file in $(wp core verify-checksums 2>&1 | grep 'File should not exist:' | grep -v error_log | awk '{print $6}'); do yes | rm -f ./$file; done
for pluginfile in $(wp plugin verify-checksums --skip-{plugins,themes} --all | grep "File was added" | awk '{print $1 "/" $2}'); do yes | rm -f "./wp-content/plugins/$pluginfile"; done
# remove inactive plugins+themes, sparing default themes for testing
for plugin in $(wp plugin list --skip-{plugins,themes} | grep inactive | awk '{print $1}'); do rm -rf ./wp-content/plugins/$plugin; done
for theme in $(wp theme list --skip-{plugins,themes} | grep inactive | grep -v 'twentytwenty' | awk '{print $1}'); do rm -rf ./wp-content/themes/$theme; done
# update everything
wp core download --force
wp plugin update --all --skip-{plugins,themes}
wp theme update --all --skip-{plugins,themes}
fi
