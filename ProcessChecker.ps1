# --- Global Scope ---
# This variable stays alive in your PowerShell window even after the script stops.
# It counts how many times you have run this specific script in this session.
write-host "`n Welcome To Our Process Checker`n" -ForegroundColor Yellow
$Global:globalCount++  

# --- Script Scope ---
# These variables belong to this .ps1 file. 
# They reset to 0 every time you start the script.
$RunningCount = 0
$NotRunningCount = 0

function ProcessCheCkerV2 {
    param (
        # --- Local Scope ---
        # $ProcessName only exists inside this function.
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
        [string]$ProcessName
    )

    Process {
        # Check if the process is running without showing red errors
        if (Get-Process -Name $ProcessName -ErrorAction SilentlyContinue) {
            Write-Host "$ProcessName is running" -ForegroundColor Blue
            
            # Use $script: to update the variable at the top of the file
            $script:RunningCount++
        }
        else {
            Write-Host "$ProcessName is Not Running" -ForegroundColor Magenta
            
            # Use $script: to update the variable at the top of the file
            $script:NotRunningCount++
        }
    }
}

# --- Execution ---
# We "pipe" the names into the function to test the Local Scope logic
"notepad", "chrome", "pwsh", "explorer" | ProcessCheCkerV2  

# --- Final Output ---
Write-Host "`n--- Summary ---"
Write-Host "RunningCount = $RunningCount"
Write-Host "NotRunningCount = $NotRunningCount"
Write-Host "The Script was Used For $Global:globalCount Times"