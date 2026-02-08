
#!/bin/bash

################################################################################
# Script Name: vault_permissions.sh
# Description: Manages and updates file permissions for the secure vault
#              Implements security best practices for access control
# Author: CyberSec Ops Team
# Date: 2026-02-08
################################################################################

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Define vault directory
VAULT_DIR="$HOME/secure_vault"

# Function to update file permissions
update_permissions() {
    local file="$1"
    local default_perm="$2"
    local filepath="$VAULT_DIR/$file"
    
    echo ""
    echo -e "${BLUE}--- Processing: $file ---${NC}"
    
    # Display current permissions
    echo "Current permissions:"
    ls -l "$filepath" | awk '{print $1, $9}'
    
    # Ask user if they want to update
    echo ""
    read -p "Update permissions for $file? (y/n or press Enter for default): " choice
    
    case "$choice" in
        [Yy]*)
            # User wants to update - prompt for new permission
            read -p "Enter new permission (e.g., 600, 640, 644): " new_perm
            
            # Validate input (basic check for 3-digit octal)
            if [[ "$new_perm" =~ ^[0-7]{3}$ ]]; then
                chmod "$new_perm" "$filepath"
                echo -e "${GREEN}✓${NC} Permissions updated to $new_perm"
            else
                echo -e "${RED}✗${NC} Invalid permission format. Skipping..."
            fi
            ;;
        [Nn]*)
            # User doesn't want to update
            echo "Keeping current permissions"
            ;;
        *)
            # User pressed Enter - apply default
            chmod "$default_perm" "$filepath"
            echo -e "${GREEN}✓${NC} Default permissions applied: $default_perm"
            ;;
    esac
}

# Main script execution
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Vault Permissions Management Tool${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo -e "${RED}ERROR: secure_vault directory not found!${NC}"
    echo "Please run vault_setup.sh first."
    exit 1
fi

echo "Vault directory found: $VAULT_DIR"
echo ""
echo -e "${YELLOW}Permission Guide:${NC}"
echo "  600 = rw------- (Owner read/write only - MOST SECURE)"
echo "  640 = rw-r----- (Owner read/write, group read)"
echo "  644 = rw-r--r-- (Owner read/write, others read)"
echo ""
echo "Default permissions will be:"
echo "  • keys.txt    → 600 (most restrictive)"
echo "  • secrets.txt → 640 (group readable)"
echo "  • logs.txt    → 644 (world readable)"
echo ""

# Update permissions for each file
update_permissions "keys.txt" "600"
update_permissions "secrets.txt" "640"
update_permissions "logs.txt" "644"

# Display final permissions summary
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Permission Configuration Complete${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Final file permissions:"
echo ""
ls -l "$VAULT_DIR"

echo ""
echo "Next step: Run vault_ops.sh to manage vault contents"
