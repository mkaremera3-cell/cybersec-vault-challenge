
#!/bin/bash

################################################################################
# Script Name: vault_ops.sh
# Description: Interactive menu-driven vault operations system
#              Handles secret management, logging, and access control
# Author: CyberSec Ops Team
# Date: 2026-02-08
################################################################################

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Define vault directory
VAULT_DIR="$HOME/secure_vault"

# Function to display menu
show_menu() {
    echo ""
    echo -e "${CYAN}╔════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║    SECURE VAULT OPERATIONS MENU    ║${NC}"
    echo -e "${CYAN}╔════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  1. Add Secret                     ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  2. Update Secret                  ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  3. Add Log Entry                  ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  4. Access Keys                    ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  5. Exit                           ${CYAN}║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════╝${NC}"
    echo ""
}

# Function to add a secret
add_secret() {
    echo ""
    echo -e "${BLUE}=== Add New Secret ===${NC}"
    read -p "Enter the secret to store: " secret
    
    if [ -z "$secret" ]; then
        echo -e "${YELLOW}⚠ No secret entered. Operation cancelled.${NC}"
        return
    fi
    
    # Append secret with timestamp
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $secret" >> "$VAULT_DIR/secrets.txt"
    echo -e "${GREEN}✓ Secret added successfully${NC}"
    
    # Log the operation
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ACTION: Secret added" >> "$VAULT_DIR/logs.txt"
}

# Function to update a secret
update_secret() {
    echo ""
    echo -e "${BLUE}=== Update Existing Secret ===${NC}"
    
    # Show current secrets (without showing the actual content for security)
    echo "Current secrets in vault:"
    echo ""
    grep -n "^\[" "$VAULT_DIR/secrets.txt" | tail -n +5
    echo ""
    
    read -p "Enter the text to search for: " search_text
    
    if [ -z "$search_text" ]; then
        echo -e "${YELLOW}⚠ No search text entered. Operation cancelled.${NC}"
        return
    fi
    
    read -p "Enter the replacement text: " replace_text
    
    if [ -z "$replace_text" ]; then
        echo -e "${YELLOW}⚠ No replacement text entered. Operation cancelled.${NC}"
        return
    fi
    
    # Check if pattern exists
    if grep -q "$search_text" "$VAULT_DIR/secrets.txt"; then
        # Perform replacement
        sed -i "s/$search_text/$replace_text/g" "$VAULT_DIR/secrets.txt"
        echo -e "${GREEN}✓ Secret updated successfully${NC}"
        
        # Log the operation
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ACTION: Secret updated (search: $search_text)" >> "$VAULT_DIR/logs.txt"
    else
        echo -e "${YELLOW}No match found.${NC}"
    fi
}

# Function to add log entry
add_log_entry() {
    echo ""
    echo -e "${BLUE}=== Add Log Entry ===${NC}"
    read -p "Enter log message: " log_message
    
    if [ -z "$log_message" ]; then
        echo -e "${YELLOW}⚠ No log message entered. Operation cancelled.${NC}"
        return
    fi
    
    # Add timestamped log entry
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $log_message" >> "$VAULT_DIR/logs.txt"
    echo -e "${GREEN}✓ Log entry added successfully${NC}"
}

# Function to access keys (always denied)
access_keys() {
    echo ""
    echo -e "${RED}ACCESS DENIED 🚫${NC}"
    echo -e "${RED}Encryption keys cannot be accessed through this interface.${NC}"
    
    # Log the attempted access
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SECURITY: Attempted key access (DENIED)" >> "$VAULT_DIR/logs.txt"
}

# Main script execution
clear
echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     SECURE VAULT OPERATIONS SYSTEM         ║${NC}"
echo -e "${BLUE}║           CyberSec Ops v1.0                ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo -e "${RED}ERROR: Vault not initialized!${NC}"
    echo "Please run vault_setup.sh first."
    exit 1
fi

echo -e "${GREEN}✓ Vault loaded successfully${NC}"
echo "Location: $VAULT_DIR"

# Main loop
while true; do
    show_menu
    read -p "Select an option (1-5): " choice
    
    case $choice in
        1)
            add_secret
            ;;
        2)
            update_secret
            ;;
        3)
            add_log_entry
            ;;
        4)
            access_keys
            ;;
        5)
            echo ""
            echo -e "${GREEN}Exiting Vault Operations System...${NC}"
            echo -e "${GREEN}Stay secure! 🔒${NC}"
            echo ""
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please select 1-5.${NC}"
            ;;
    esac
done
