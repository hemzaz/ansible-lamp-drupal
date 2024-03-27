# Drupal Installation with Ansible

This Ansible project automates the setup of a Drupal website on RHEL servers, including LAMP stack installation, Drupal CMS setup, and optional SSL configuration using Let's Encrypt certificates.

## Project Structure

```
.
|-- ./gen_secrets.sh
|-- ./roles
|   |-- ./roles/drupal_install
|   |-- ./roles/lamp_install
|   |-- ./roles/user_setup
|   `-- ./roles/ansible-role-certbot
|-- ./main.yml
|-- ./vars
|   |-- ./vars/ssl_vars.yml
|   `-- ./vars/main.yml
|-- ./LICENSE
|-- ./local.main.yml
|-- ./inventory
|   `-- ./inventory/hosts.ini
`-- ./README.md
```

### Roles

- **ansible-role-certbot**: Configures SSL certificates using Certbot.
- **drupal_install**: Handles downloading, installing, and configuring Drupal, including database setup.
- **lamp_install**: Installs and configures the Linux, Apache, MySQL, and PHP (LAMP) stack.
- **user_setup**: Sets up initial server users and configurations.

## Prerequisites

- Ansible installed on the control machine.
- RHEL-based server for the target host.
- Sudo access on the target server.
- SSH Enabled + Key based authentication

## Usage  
**Clone the Repository**: Clone this repository to your local machine or Ansible control node.

**Configure Inventory**: Edit the `inventory/hosts.ini` file to include your server(s).

**Set Up Variables**:  
    - Edit `vars/main.yml` and `vars/ssl_vars.yml` to match your specific configuration needs.
    - Use `gen_secrets.sh` to generate and securely store necessary secrets.
 

 **Run the Playbook**:  
```shell
ansible-playbook -i inventory/hosts.ini main.yml
```

 **For LocalHost Running**:
   ```shell
   ansible-playbook -i inventory/hosts.ini local.main.yml
   ```

### Customizing Your Installation

- **Drupal Configuration**: Modify `vars/main.yml` to set Drupal-specific options such as domain and site name.
- **SSL Configuration**: Enable or disable SSL certificate configuration through `vars/main.yml` and detail settings in `vars/ssl_vars.yml`.
- **LAMP Stack Configuration**: Adjust PHP, Apache, and MySQL settings in `roles/lamp_install/defaults/main.yml` or `vars/main.yml` as necessary.

## Contributing

Contributions to this project are welcome. Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the `LICENSE` file in the `ansible-role-certbot` directory for details.

---

### Final Notes

- **Adapt and Extend**: This README is a starting point. Adjust and extend it as your project evolves, especially if you add new roles, features, or change how configurations are managed.
- **Documentation Best Practices**: Keep your documentation up-to-date with your code. Clear, concise, and current documentation is crucial for effective collaboration and project use.
- **Markdown Formatting**: Use Markdown formatting to enhance readability. GitHub and most Git platforms render `README.md` files using Markdown, allowing for structured, easily navigable documentation.
