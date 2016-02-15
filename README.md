# ImgStore Rails App

Okay so here's how it goes when you want to set up this rails application in a production environment!

There's a couple things that go in the .env file for dotenv:

### Twilio Credentials
* TWILIO_ACCOUNT_SID
* TWILIO_AUTH_TOKEN 

### Secrets
* HASH_SECRET (for paperclip filename obsfucation)
* SECRET_KEY_BASE
* IMAGESTORE_DATABASE_PASSWORD

### Running
Remember to uh, rake db:create db:migrate assets:precompile when you first start up!
