Docker images for Mail
----------------------

Docker images for sending or relaying email.

## Quick start

    # Start a mail server
    docker run --rm tencentafrica/mail:latest
    
    # Start a mail server that relays delivery.
    docker run --rm -e RELAY_ENABLED=true -e RELAY_HOST="1.2.3.4" -e RELAY_LOGIN="username" -e RELAY_PASSWORD="password" tencentafrica/mail:latest
    
    # Start a local debug version that relays to itself.
    docker run --rm tencentafrica/mail:debug

## Configuration

| Name                 	| Type    	| Default value 	| Comments                                                                                                                                                                                                                                                            	|
|----------------------	|---------	|---------------	|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| `DOMAIN`             	| string  	| `""`          	| *Required*. The domain that all outgoing email is considered to be from.                                                                                                                                                                                            	|
| `ALLOWED_SENDERS`    	| string  	| `""`          	| Comma-separated list of usernames of users that are allowed to send email (will be rewritten to `username@$DOMAIN`). Anyone _not_ in this list will be rewritten to appear to come from `no-reply@$DOMAIN`.                                                         	|
| `ALLOWED_RECIPIENTS` 	| string  	| `""`          	| Command-separated list of fully qualified email address that are allowed to receive email. All other emails will be dropped. This is most useful in a testing environment, when you want to ensure that only a limited range of email addresses can receive emails. 	|
| `SUBJECT_PREPEND`    	| string  	| `""`          	| Prepends the given value to the beginning of the subject line for every outbound email.                                                                                                                                                                             	|
| `SUBJECT_APPEND`     	| string  	| `""`          	| Appends the given value to the end of the subject line for every outbound email.                                                                                                                                                                                    	|
| `RELAY_ENABLED`      	| boolean 	| `false`       	| Delivers mail through the specified mail relay.                                                                                                                                                                                                                     	|
| `RELAY_HOST`         	| string  	| `""`          	| The host through which to relay mail.                                                                                                                                                                                                                               	|
| `RELAY_PORT`         	| number  	| `0`           	| The port over which to relay mail.                                                                                                                                                                                                                                  	|
| `RELAY_LOGIN`        	| string  	| `""`          	| The username to log in with when relaying mail.                                                                                                                                                                                                                     	|
| `RELAY_PASSWORD`     	| string  	| `""`          	| The password to log in with when relaying mail.                                                                                                                                                                                                                     	|

## Acknowledgements

* [Postfix](http://www.postfix.org/)
* [MailHog](https://github.com/mailhog/MailHog)
* [S6 Overlay](https://github.com/just-containers/s6-overlay)
