#!/bin/bash

# Define the path for the Ansible Vault password file
VAULT_PASS_FILE="$HOME/.ansible/.vaultpass"
VAULT_FILE="vars/secrets.yml"

# Prompt the user for sensitive values
read -sp 'Enter MySQL root password: ' mysql_root_password
echo
read -sp 'Enter MySQL password: ' mysql_password
echo
read -sp 'Enter Drupal admin user: ' drupal_admin_user
echo
read -sp 'Enter Drupal admin password: ' drupal_admin_password
echo

# Generate a random vault password and output it
VAULT_PASSWORD=$(openssl rand -base64 32)
echo "Your Ansible Vault password is: $VAULT_PASSWORD"

# Ensure the .ansible directory exists
mkdir -p "$(dirname "$VAULT_PASS_FILE")"

# Save the vault password to the vault password file
echo "$VAULT_PASSWORD" > "$VAULT_PASS_FILE"
echo "Vault password has been saved to $VAULT_PASS_FILE"

# Prepare the secrets content
SECRETS_CONTENT=$(cat <<-END
mysql_root_password: "$mysql_root_password"
mysql_password: "$mysql_password"
drupal_admin_user: "$drupal_admin_user"
drupal_admin_password: "$drupal_admin_password"
END
)

# Check if Ansible is installed and the ansible-vault command is available
if ! command -v ansible-vault &> /dev/null; then
    echo "ansible-vault could not be found. Please ensure Ansible is installed."
    exit 1
fi

# Create the vault file with secrets
echo "$SECRETS_CONTENT" | ansible-vault encrypt --vault-password-file "$VAULT_PASS_FILE" --stdin-name 'secrets' > "$VAULT_FILE"
echo "Secrets have been encrypted and saved to $VAULT_FILE"
