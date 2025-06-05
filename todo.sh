# making folder : mkdir todo-project

_______________________________ bash script : 
cat << 'EOF' > todo.sh
#!/bin/bash

# Check if script is already running
if [ -f "/tmp/todo_script.lock" ]; then
    echo -e "\033[1;31mError: Script is already running. Please close the other instance.\033[0m"
    exit 1
fi
# Create lock file
touch /tmp/todo_script.lock

# File to store tasks
TODO_FILE="todo.txt"

# Create todo.txt if it doesn't exist
if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
fi

# Function to add a task
add_task() {
    echo "Enter the task:"
    read -r task
    if [ -z "$task" ]; then
        echo -e "\033[1;31mError: Task cannot be empty.\033[0m"
    else
        echo "$task" >> "$TODO_FILE"
        echo -e "\033[1;32mTask added: $task\033[0m"
    fi
}

# Function to view all tasks
view_tasks() {
    if [ ! -s "$TODO_FILE" ]; then
        echo -e "\033[1;31mNo tasks found.\033[0m"
    else
        echo "Your To-Do List:"
        nl -w2 -s'. ' "$TODO_FILE"
    fi
}

# Function to delete a task
delete_task() {
    view_tasks
    if [ -s "$TODO_FILE" ]; then
        echo "Enter the task number to delete:"
        read -r task_num
        if [[ "$task_num" =~ ^[0-9]+$ ]]; then
            if [ "$task_num" -gt 0 ] && [ "$task_num" -le "$(wc -l < "$TODO_FILE")" ]; then
                sed -i "${task_num}d" "$TODO_FILE"
                echo -e "\033[1;32mTask $task_num deleted.\033[0m"
            else
                echo -e "\033[1;31mError: Invalid task number.\033[0m"
            fi
        else
            echo -e "\033[1;31mError: Please enter a valid number.\033[0m"
        fi
    fi
}

# Function to clear all tasks
clear_tasks() {
    > "$TODO_FILE"
    echo -e "\033[1;32mAll tasks cleared.\033[0m"
}

# Clean up lock file on exit
trap 'rm -f /tmp/todo_script.lock' EXIT

# Main menu
while true; do
    clear
    echo -e "\n\033[1;34mTo-Do List Menu:\033[0m"
    echo "1. Add a task"
    echo "2. View all tasks"
    echo "3. Delete a task"
    echo "4. Clear all tasks"
    echo "5. Exit"
    echo "Choose an option (1-5):"
    read -r choice

    case "$choice" in
        1) add_task ;;
        2) view_tasks ;;
        3) delete_task ;;
        4) clear_tasks ;;
        5) echo -e "\033[1;32mGoodbye!\033[0m"; exit 0 ;;
        *) echo -e "\033[1;31mInvalid option. Please choose 1-5.\033[0m" ;;
    esac
    echo -e "\nPress Enter to continue..."
    read -r
done
EOF
_______________________


# Make it executable : chmod +x todo.sh
# run : ./todo.sh
.....
# see file : cat todo.txt
# deleting : rm todo.sh todo.txt
