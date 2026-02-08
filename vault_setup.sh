
#!/bin/bash

################################################################################
# Script Name: vault_setup.sh
# Description: Initializes the Secure Vault System with required directories
#              and files for storing secrets, keys, and logs
# Author: CyberSec Ops Team
# Date: 2026-02-08
################################################################################

# Color codes for better output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Secure Vault Setup Utility${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Define vault directory path
VAULT_DIR="$HOME/secure_vault"

# Create the secure_vault directory
echo "Creating secure vault directory..."
mkdir -p "$VAULT_DIR"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Directory created: $VAULT_DIR"
else
    echo "✗ Failed to create directory"
    exit 1
fi

echo ""
echo "Initializing vault files..."

# Create keys.txt with welcome message
echo "=== ENCRYPTION KEYS STORAGE ===" > "$VAULT_DIR/keys.txt"
echo "This file contains sensitive encryption keys." >> "$VAULT_DIR/keys.txt"
echo "Access is restricted and monitored." >> "$VAULT_DIR/keys.txt"
echo "Initialized on: $(date)" >> "$VAULT_DIR/keys.txt"
echo -e "${GREEN}✓${NC} Created: keys.txt"

# Create secrets.txt with welcome message
echo "=== CONFIDENTIAL SECRETS VAULT ===" > "$VAULT_DIR/secrets.txt"
echo "This file stores confidential data and sensitive information." >> "$VAULT_DIR/secrets.txt"
echo "All access is logged and audited." >> "$VAULT_DIR/secrets.txt"
echo "Initialized on: $(date)" >> "$VAULT_DIR/secrets.txt"
echo -e "${GREEN}✓${NC} Created: secrets.txt"

# Create logs.txt with welcome message
echo "=== SYSTEM SECURITY LOGS ===" > "$VAULT_DIR/logs.txt"
echo "This file tracks all vault operations and security events." >> "$VAULT_DIR/logs.txt"
echo "Log retention policy: 90 days" >> "$VAULT_DIR/logs.txt"
echo "Initialized on: $(date)" >> "$VAULT_DIR/logs.txt"
echo -e "${GREEN}✓${NC} Created: logs.txt"

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Vault Setup Complete! ✓${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "Vault contents:"
echo ""

# Display all files in long format
ls -l "$VAULT_DIR"

echo ""
echo "Next step: Run vault_permissions.sh to configure access controls"
