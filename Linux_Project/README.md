## Challenge: User Account Management

Bash script that provides options for managing user accounts on the system. The script should allow users to perform various user account-related tasks based on command-line arguments.

### Part 1: Account Creation

1. Implementeded an option `-c` or `--create` that allows the script to create a new user account. The script prompts the user to enter the new username and password.

2. Script checks whether the username is available before creating the account. If the username already exists, it displays an appropriate message and exit gracefully.

3. After creating the account, it displays a success message with the newly created username.

### Part 2: Account Deletion

1. Implemented an option `-d` or `--delete` that allows the script to delete an existing user account. The script prompts the user to enter the username of the account to be deleted.

2. Script checks whether the username exists before attempting to delete the account. If the username does not exist, it displays an appropriate message and exit gracefully.

3. After successfully deleting the account, it displays a confirmation message with the deleted username.

### Part 3: Password Reset

1. Implemented an option `-r` or `--reset` that allows the script to reset the password of an existing user account. The script prompts the user to enter the username and the new password.

2. Script checks whether the username exists before attempting to reset the password. If the username does not exist, it displays an appropriate message and exit gracefully.

3. After resetting the password, it displays a success message with the username and the updated password.

### Part 4: List User Accounts

1. Implemented an option `-l` or `--list` that allows the script to list all user accounts on the system. The script displays the usernames and their corresponding user IDs (UID).

### Part 5: Help and Usage Information

1. Implemented an option `-h` or `--help` that displays usage information and the available command-line options for the script.

### Part 6: Take Backup of Directory

1. Implemented an option `-b` or `--backup` that takes backup of Directory.

