Project: PowerShell Process Checker & Scope Practice
What this script does (The Action)
This script is a tool that checks if specific programs (processes) are currently running on your computer.

It takes a list of names, such as Chrome, Notepad, or Explorer.

It checks the system for these names.

It uses Colors to show the result: Blue means the program is running, and Magenta means it is not running.

At the end, it shows a summary of how many programs were found.

Why I wrote this (The Scope Practice)
I wrote this script specifically to practice Variable Scope in PowerShell. It demonstrates how data is stored and shared in three different ways:

Global Scope ($Global:globalCount):

The Goal: To remember data even after the script finishes.

How it works: This variable tracks how many times the script has been run in the current PowerShell window. It does not reset to zero when the script ends.

Script Scope ($RunningCount & $NotRunningCount):

The Goal: To share data between a function and the main script.

How it works: These variables are created at the top of the file. Inside the function, I use the $script: prefix to update these totals so the final summary can display them.

Local Scope ($ProcessName):

The Goal: To keep data private and temporary.

How it works: This variable only lives inside the ProcessCheCkerV2 function. It is created when a process is checked and deleted immediately after.

Technical Features
Pipeline Input: You can "pipe" strings directly into the function.

Error Handling: It uses -ErrorAction SilentlyContinue to keep the output clean if a process is missing.

Visual Feedback: Uses Write-Host with colors for better readability.



