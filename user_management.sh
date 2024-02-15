#!/bin/bash


# Function to display usage information and available options
Display_Usage() {

    echo "Usage: $0 [OPTIONS]"
    echo " Select Below Options:"
    echo "  -c, --create       Create a new user account."
    echo "  -d, --delete       Delete an existing user account."
    echo "  -r, --reset        Reset password for an existing user account."
    echo "  -l, --list         List all user accounts on the system."
    echo "  -h, --help         Display this help and exit."
    echo "  -b, --backup       Take backup of important files."
}



# Function to create a new user account
Create_User()  {
	read -p "Please Enter Username: " username

	# Check if the username already exists
	if id $username &>/dev/null  #/dev/null is use to discard output and rediret to it, it is a virtual null device
	then
		echo "User $username Already Exist"
	else
		# Prompt for password (Note: You might want to use 'read -s' to hide the password input)
		read -p "Enter Password for $username: " password
		sudo useradd -m -p $password $username
		echo "User $username created successfully" 
	fi
}


# Function to delete an existing user account
Remove_User() {
	read -p "Please Enter User: " username

# Check if the username exists
	if id $username &>/dev/null #/dev/null is use to discard output and rediret to it, it is a virtual null device
	then
		sudo userdel -r $username # -r flag removes the user's home directory
		echo "User Account $username Deleted Successfully"
	else
		echo "User $username does not exist"
	fi

}




# Function to reset the password for an existing user account
Reset_Password() {
	read -p "Please Enter User: " username
# Check if the username exists
	if id $username &>/dev/null
	then
		# Prompt for password (Note: You might want to use 'read -s' to hide the password input)
		read -p "Please Enter password for $username: " password
		echo "$username:$password" | sudo chpasswd
		echo "Password reset succesfully"
	
	else
		echo "User $username Does Not Exist"
	fi
}




# Function to list all user accounts on the system
List_Users() {
    echo "User accounts on the system:"
    awk -F':' '{ print $1 "(UID: " $3")" } ' /etc/passwd
}


#Function to create backup
Create_Backup() {

read -p "Please Enter Source Directory: " src
read -p "Please Enter Destination Directory: " dst

#Create Variable to give Current Date/Time
curr_date=$(date "+%Y-%m-%d-%H-%M-%S")

 
bkp_file="$dst"/backup_"$curr_date".tar.gz

#Creating Backup file in destination directory
tar -czf $bkp_file -P $src 

echo "Backup Created Succesfully"

}


# Check if no arguments are provided or if the -h or --help option is given
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    Display_Usage
    exit 0
fi

# Command-line argument parsing
while [ $# -gt 0 ]; do
    case "$1" in
        -c|--create)
            Create_User
            ;;
        -d|--delete)
            Remove_User
            ;;
        -r|--reset)
            Reset_Password
            ;;
        -l|--list)
            List_Users
            ;;
	-b|--backup)
	    Create_Backup
            ;; 	    
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
    shift
done
