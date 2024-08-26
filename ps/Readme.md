### How to Run the Script

1. Open PowerShell.

2. Navigate to the directory where your `Change-Directory.ps1` script is saved using the `cd` command.

3. Execute the script by typing:

   ```powershell
   .\ChangeDirectory.ps1
   ```

   If you encounter execution policy restrictions, you might need to change the policy temporarily. For instance, you can set the policy to allow script execution using:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
   ```

   Then run your script again.
