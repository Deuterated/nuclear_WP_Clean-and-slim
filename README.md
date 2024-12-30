# nuclear_WP_Clean-and-slim
a cursed bash script for cleaning up and updating WordPress sites

The interactivity added by the wrapper adds only a tiny amount of safety. You probably already know this, but it's generally considered unwise to automate rm in ways that remove followup intervention opportunities, particularly in production environments. This is verbose on the removal of files that aren't supposed to be there, but proceeds silently on the removal of inactive plugins and themes.

I've always been fascinated by things that are technically functional, but unwise to use; I find such things hilarious, and am glad to have contributed something to this field

Depends only on bash built-ins and wp-cli
