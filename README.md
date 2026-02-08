
# 🔒 CyberSec Ops: Secure Vault Challenge

A comprehensive cybersecurity project demonstrating Linux security principles, access control, and secure file management through a command-line vault system.

## 📋 Project Overview

This project implements a **Secure Vault System** that safely stores secrets, controls file access, allows secure updates, and monitors security risks. It consists of four main components:

1. **Vault Setup** - Initialize the secure vault structure
2. **Permission Management** - Configure access controls
3. **Vault Operations** - Interactive secret and log management
4. **Security Monitoring** - Audit and report on vault security

## 🎯 Features

- ✅ Secure file structure with encryption keys, secrets, and logs
- ✅ Granular permission controls (600, 640, 644)
- ✅ Interactive menu-driven operations
- ✅ Timestamped logging
- ✅ Secret management with search and replace
- ✅ Security auditing and reporting
- ✅ Access denial for sensitive keys
- ✅ Color-coded terminal output

## 📁 Project Structure
```
cybersec-vault-project/
├── vault_setup.sh         # Step 1: Initialize vault
├── vault_permissions.sh   # Step 2: Configure permissions
├── vault_ops.sh          # Step 3: Manage vault operations
├── vault_monitor.sh      # Step 4: Security monitoring
├── vault_report.txt      # Generated security report
└── README.md             # Documentation
```

## 🚀 Usage

### Step 1: Setup
```bash
chmod +x *.sh
./vault_setup.sh
```

### Step 2: Configure Permissions
```bash
./vault_permissions.sh
```
Press Enter for defaults or customize permissions.

### Step 3: Vault Operations
```bash
./vault_ops.sh
```
Interactive menu with options to add/update secrets and logs.

### Step 4: Security Monitoring
```bash
./vault_monitor.sh
cat ~/secure_vault/vault_report.txt
```

## 🛡️ Security Features

### Permission Levels

| File | Permission | Octal | Meaning |
|------|-----------|-------|---------|
| keys.txt | rw------- | 600 | Most restrictive |
| secrets.txt | rw-r----- | 640 | Group readable |
| logs.txt | rw-r--r-- | 644 | World readable |

### Security Checks

- ✅ Automatic detection of overly permissive file permissions
- ✅ Access denial for encryption keys
- ✅ Timestamped audit logging
- ✅ Automated security reporting

## 📚 Learning Objectives

This project demonstrates:

- ✅ Linux file system operations
- ✅ Bash scripting fundamentals
- ✅ Permission management (chmod)
- ✅ I/O redirection and file operations
- ✅ Interactive menu systems
- ✅ String manipulation with sed
- ✅ File metadata extraction (stat)
- ✅ Security best practices
- ✅ Audit logging

## 👨‍💻 Author

CyberSec Ops Team - Junior Cybersecurity Training Program

## 📄 License

This project is created for educational purposes as part of the CyberSec Ops challenge.
```

5. Scroll down and click "Commit changes"

---

## ✅ After These Fixes:

Your repository should have:
- ✅ vault_setup.sh
- ✅ vault_permissions.sh
- ✅ vault_ops.sh
- ✅ vault_monitor.sh
- ✅ vault_report.txt
- ✅ README.md (with content!)
- ✅ .gitignore

And your homepage should show the nice README with the 🔒 title!

---

## 🎯 Then Submit:
```
https://github.com/mkaremera3-cell/cybersec-vault-challenge
