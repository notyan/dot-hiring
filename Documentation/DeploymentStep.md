# Langkah deployment aplikasi a dan b

## Application A
This Aplication A deployment are using ansible to deploy the application

1. Get domain and configure the domain `A Record` To point into vm ip
2. Run `cd ansible` to move current directory into ansible
3. Configure the `app.yml` variable into specific configuration needed
    
    - `mysql_root_password` Password for mysql root password
    - `sql_admin_user` User for laravel mysql database
    - `sql_admin_password` password for laravel mysql database
    - `app_domain` domain for the laravel application
    - `certbot_email` email for the ssl expiration notification
4. Configure the inventory.yml and change the `ansible_port` to ssh port, `ansible_user` to ssh user, and `ansible_host` into domain from the first step
5. Run `ansible-playbook -i inventory.yml app.yml` to start the Aplication A deployment, and wait until the process finished

## Application B
The second application deployment are directly via the gitlab-ci/cd

1. Clone this repository into your local folder  `https://github.com/vercel/next.js/tree/canary/examples/cms-contentful` using 

    ```
    git clone --branch canary  --depth 10 https://github.com/vercel/next.js.git
    ```

    `--branch canary` option are used to only clone the canary branch
    `--depth 10` option used to make the clone faster and only get last 10 commit since there is many commit on the server

2. Run `cp  next.js/examples/cms-contentful/ ./ ` to copy the cms-contentful folder into current directory
3. Run `cd cms-contentful` to change current directory into cms-contentful folder
4. Create new repository on gitlab than upload the cms-contentful into newly-created gitlab repository
5. 