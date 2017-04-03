# MongoDB

MongoDB running on alpine edge.  

### Recommendations:
##### Persist data dir.
The data directory might be something you wish to persist.  
The dir is located `/data/db`, so just add that as a volume.  

##### Persist and change the conf file.
The configuration file is located at `/config/mongd.conf`.
  
##### For production.
If you for some reason wish to use this image for production there are some things you should do:  
The `--auth` flag is off by default. For security reasons I would recommend adding it in the config file.  
This can be done by adding the `/config` directory as a local volume and then editing the `mongod.conf` file, changing [`security.authorization`](https://docs.mongodb.com/manual/reference/configuration-options/#security.authorization) to `enabled`.  
After changing the file, the container need to be restarted.  
  
*OBSERVE*  
If you enable auth a user is required to login, create the user before enabling auth (or through the container even after auth is on):  
  
```
mongo --port 27017
// If not running on localhost:
mongo domain.or.ip.tdl:27017

use admin
db.createUser(
  {
    user: "UserAdmin",
    pwd: "super-secret-password",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
```
Now the database should only be accessable by a real user!