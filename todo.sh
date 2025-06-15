# making folder : mkdir todo-project

_______________________________ bash script : 
# cat << 'EOF' > todo.sh
#!/bin/bash

# File to store tasks
TODO_FILE="todo.txt"

# Create todo.txt if it doesn't exist
touch "$TODO_FILE"

# Function to add a task
add_task() {
    echo "Enter the task:"
    read task
    if [ -z "$task" ]; then
        echo "Error: Task cannot be empty."
    else
        echo "[✘] $task" >> "$TODO_FILE"
        echo "Task added: $task"
    fi
}


# Function to view all tasks
view_tasks() {
    if [ -s "$TODO_FILE" ]; then
        echo "Your To-Do List:"
        nl "$TODO_FILE"
    else
        echo "No tasks found."
    fi
}


# Function to delete a task
delete_task() {
    view_tasks
    total_tasks=$(wc -l < "$TODO_FILE")

    echo "Enter task number to delete:"
    read task_num

    if [ "$total_tasks" -ge 1 ] && [ "$task_num" -ge 1 ] && [ "$task_num" -le "$total_tasks" ]; then
        sed "${task_num}d" "$TODO_FILE" > tmp
        mv tmp "$TODO_FILE"
        echo "Deleted task $task_num"
    else
        echo "Error: invalid choice"
    fi
}


# Function to mark task as done
mark_done() {
    view_tasks
    total_tasks=$(wc -l < "$TODO_FILE")

    echo "Enter the task number to mark as done:"
    read task_num

    if [ "$task_num" -ge 1 ] && [ "$task_num" -le "$total_tasks" ]; then
        count=0
        > tmp
        while read -r line; do
            count=$((count + 1))
            if [ "$count" -eq "$task_num" ]; then
                # Mark task done by replacing first 4 chars with [✔]
                echo "[✔] ${line:4}" >> tmp
            else
                echo "$line" >> tmp
            fi
        done < "$TODO_FILE"

        mv tmp "$TODO_FILE"
        echo "Task $task_num marked as done."
    else
        echo "Error: Invalid task number."
    fi
}



# Function to clear all tasks
clear_tasks() {
    > "$TODO_FILE"
    echo "All tasks cleared."
}


# Main menu
while true; do
    clear
    echo
    echo "To-Do List Menu:"
    echo "1. Add a task"
    echo "2. View all tasks"
    echo "3. Delete a task"
    echo "4. Mark Done"
    echo "5. Clear all tasks"
    echo "6. Exit"
    echo "Choose an option (1-6):"
    read choice

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
    read
done

# chmod +x todo.sh
# ./todo.sh

# EOF
# _______________________

# Make it executable : chmod +x todo.sh
# run : ./todo.sh
.....
# see file : cat todo.txt
# deleting : rm todo.sh todo.txt
