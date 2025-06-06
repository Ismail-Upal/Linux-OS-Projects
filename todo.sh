# making folder : mkdir todo-project

_______________________________ bash script : 
cat << 'EOF' > todo.sh
#!/bin/bash

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
        echo "Error: Task cannot be empty."
    else
        echo "[✘] $task" >> "$TODO_FILE"
        echo "Task added: $task"
    fi
}

# Function to view all tasks
view_tasks() {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
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
                echo "Task $task_num deleted."
            else
                echo "Error: Invalid task number."
            fi
        else
            echo "Error: Please enter a valid number."
        fi
    fi
}

# Function to mark task as done
mark_done() {
    view_tasks
    if [ -s "$TODO_FILE" ]; then
        echo "Enter the task number to mark as done:"
        read -r task_num
        if [[ "$task_num" =~ ^[0-9]+$ ]]; then
            if [ "$task_num" -gt 0 ] && [ "$task_num" -le "$(wc -l < "$TODO_FILE")" ]; then
                task_text=$(sed -n "${task_num}p" "$TODO_FILE" | sed 's/^\[.\] //')
                sed -i "${task_num}s/.*/[✔] $task_text/" "$TODO_FILE"
                echo "Task $task_num marked as done."
            else
                echo "Error: Invalid task number."
            fi
        else
            echo "Error: Please enter a valid number."
        fi
    fi
}

# Function to clear all tasks
clear_tasks() {
    > "$TODO_FILE"
    echo "All tasks cleared."
}


# Main menu
while true; do
    # clear
    echo
    echo "To-Do List Menu:"
    echo "1. Add a task"
    echo "2. View all tasks"
    echo "3. Delete a task"
    echo "4. Mark Done"
    echo "5. Clear all tasks"
    echo "6. Exit"
    echo "Choose an option (1-6):"
    read -r choice

    case "$choice" in
        1) add_task ;;
        2) view_tasks ;;
        3) delete_task ;;
        4) mark_done ;;
        5) clear_tasks ;;
        6) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please choose 1-6." ;;
    esac
    echo
    echo "Press Enter to continue..."
    read -r
done

# chmod +x todo.sh
# ./todo.sh

EOF
_______________________

# Make it executable : chmod +x todo.sh
# run : ./todo.sh
.....
# see file : cat todo.txt
# deleting : rm todo.sh todo.txt
