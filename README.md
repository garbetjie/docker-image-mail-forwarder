Docker images for Mail
----------------------

Docker image for sending or relaying email.

## Quick start

    # Start a mail server
    docker run --rm garbetjie/mail-forwarder:latest
    
    # Start a mail server that relays delivery.
    docker run --rm -e RELAY=true -e RELAY_HOST="1.2.3.4" -e RELAY_PORT=25 -e RELAY_LOGIN="username" -e RELAY_PASSWORD="password" garbetjie/mail-forwarder:latest
    
*Useful hint:* When developing locally, it's useful to combine the mail relay capabilities of this image with the mail interface of
[MailHog](https://github.com/mailhog/MailHog), to ensure that no email is delivered outside of your development server.

## Configuration

| Name                 	| Type    	| Default value     | Comments                                                                                                                                                                                                                                                            	|
|----------------------	|---------	|---------------    |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| `DEFAULT_DOMAIN`     	| string  	|                   | **Required.** The domain that all outgoing email is considered to be from.                                                                                                                                                                                            |
| `ALLOWED_SENDERS`    	| string  	| `""`              | Space-separated list of usernames of users that are allowed to send email (will be rewritten to `username@$DEFAULT_DOMAIN`). Anyone _not_ in this list will be rewritten to appear to come from `no-reply@$DEFAULT_DOMAIN`.                                           |
| `ALLOWED_RECIPIENTS` 	| string  	| `""`              | Space-separated list of fully qualified email address that are allowed to receive email. All other emails will be dropped. This is most useful in a testing environment, when you want to ensure that only a limited range of email addresses can receive emails. 	|
| `RELAY`         	    | boolean  	| `false`           | Boolean flag indicating whether email should be relayed. Set to `true` to relay email through `$RELAY_HOST`, and `false` to delivery mail directly.                                                                                                                   |
| `RELAY_HOST`         	| string  	| `""`              | The host through which to relay mail.                                                                                                                                                                                                                                 |
| `RELAY_PORT`         	| number  	| `0`               | The port over which to relay mail.                                                                                                                                                                                                                                    |
| `RELAY_USERNAME`    	| string  	| `""`              | The username to log in with when relaying mail.                                                                                                                                                                                                                     	|
| `RELAY_PASSWORD`     	| string  	| `""`              | The password to log in with when relaying mail.                                                                                                                                                                                                                     	|


## Acknowledgements

* [Postfix](http://www.postfix.org/)
* [MailHog](https://github.com/mailhog/MailHog)
* [dumb-init](https://github.com/Yelp/dumb-init)
