**WordPress Docker Script**
This script creates a WordPress site using the latest WordPress version and a MySql running inside containers (Docker). It also allows the user to provide the site name as a command-line argument.

**Installation**
Before running the script, make sure that Docker and Docker Compose are installed on your system. If they are not present, the script will attempt to install them automatically.
To run the script, simply execute the following command in your terminal:
./wp.sh example.com

**Enabling the Site**
You can Enable the site by running the script with the Enabling subcommand:
./wp.sh == enable

**Disabling the Site**
You can disable the site by running the script with the disable subcommand:
./wp.sh == disable 

**Deleting the Site**
You can delete the site by running the script with the delete subcommand:
./wp.sh == delete 

**Opening the Site**
If all goes well and the site is up and healthy, the script will prompt you to open your site in a browser:
WordPress site created successfully. Please open http://example.com in your browser.

**/etc/hosts Entry**
The script will automatically create a /etc/hosts entry for your site pointing to localhost. If you provided example.com as your site name, this entry will look like:
127.0.0.1 example.com

