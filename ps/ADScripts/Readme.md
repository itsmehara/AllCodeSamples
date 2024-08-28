### Summary of the Script

**Purpose:**
The script retrieves and displays the list of Active Directory groups that a specific user belongs to.

**Output:**
The script outputs the names of the Active Directory groups that the user is a member of. It extracts and formats these names from the user's `MemberOf` property, which contains the Distinguished Names (DNs) of the groups.

**Overall Output:**
- A list of group names (not their Distinguished Names) to which the specified user belongs.

For example, if the user `harag22` is a member of the groups "Sales" and "Marketing", the output will be:

```
Sales
Marketing
```

You need to import the Active Directory module. Use the following command:

```powershell
Import-Module ActiveDirectory
```


The one-line PowerShell command and a `.ps1` script file with detailed comments and proper indentation. 

### One-Liner Command

Here's the one-liner PowerShell command that retrieves the groups that the user `harag22` is a member of:

```powershell
Import-Module ActiveDirectory
Get-ADUser -Identity harag22 -Properties MemberOf | Select-Object -ExpandProperty MemberOf
```

### PowerShell Script (.ps1)

Below is a PowerShell script file that performs the same task. Save this script as `Get-UserGroups.ps1`:

```powershell
# Filename: Get-UserGroups.ps1
Import-Module ActiveDirectory
<#
.SYNOPSIS
    Retrieves the Active Directory groups that a specific user is a member of.

.DESCRIPTION
    This script fetches the 'MemberOf' property for a specified Active Directory user
    and displays the list of groups the user belongs to.

.PARAMETER UserIdentity
    The identity of the Active Directory user whose group memberships are to be retrieved.
    Default is 'harag22'.

.EXAMPLE
    .\Get-UserGroups.ps1 -UserIdentity 'harag22'
    Retrieves the group memberships for the user 'harag22'.

#>

param (
    [string]$UserIdentity = 'harag22'  # Default user identity
)

# Import the Active Directory module if it is not already imported
if (-not (Get-Module -Name ActiveDirectory)) {
    Import-Module ActiveDirectory
}

# Retrieve the user object and its 'MemberOf' property
$user = Get-ADUser -Identity $UserIdentity -Properties MemberOf

# Check if the user object was successfully retrieved
if ($null -eq $user) {
    Write-Error "User with identity '$UserIdentity' not found."
    exit 1
}

# Output the list of groups the user is a member of
$user.MemberOf | ForEach-Object {
    # Extract and format the group name from the distinguished name
    $groupName = $_ -replace '^CN=.*?,', ''
    Write-Output $groupName
}
```

### Explanation:

#### One-Liner Command:
- **`Get-ADUser -Identity harag22 -Properties MemberOf`**: Retrieves the Active Directory user with the specified identity and includes the `MemberOf` property.
- **`| Select-Object -ExpandProperty MemberOf`**: Expands the `MemberOf` property to list the groups directly.

#### PowerShell Script:
- **`param` Block**: Defines a parameter for the user identity, defaulting to `harag22`.
- **Module Check**: Ensures the Active Directory module is loaded.
- **`Get-ADUser` Command**: Retrieves the user and their `MemberOf` property.
- **Error Handling**: Checks if the user object is null and reports an error if not found.
- **Output Formatting**: Processes each group’s distinguished name to extract and display the group names.

### Usage:

- **One-Liner Command**: Run directly in the PowerShell prompt.
- **Script File**: Save the code as `Get-UserGroups.ps1` and run it with:
  ```powershell
  .\Get-UserGroups.ps1 -UserIdentity 'harag22'
  ```

You can now use both the one-liner command and the `.ps1` script for retrieving Active Directory user group memberships as needed!

----------------------

## SAMPLE 2


### PowerShell Script:

```powershell
# Filename: Get-UserADGroups.ps1
Import-Module ActiveDirectory

param (
    [string]$UserIdentity = 'harag22'  # Default user identity
)

if (-not (Get-Module -Name ActiveDirectory)) {
    Import-Module ActiveDirectory
}

$user = Get-ADUser -Identity $UserIdentity -Properties MemberOf

if ($null -eq $user) {
    Write-Error "User with identity '$UserIdentity' not found."
    exit 1
}

$user.MemberOf | ForEach-Object {
    $_ -replace '^CN=.*?,', ''
}
```

### One-Liner Command:

```powershell
Import-Module ActiveDirectory

Get-ADUser -Identity harag22 -Properties MemberOf | Select-Object -ExpandProperty MemberOf | ForEach-Object { $_ -replace '^CN=.*?,', '' }
```

### Two-Liner Command:

```powershell
Import-Module ActiveDirectory

$user = Get-ADUser -Identity harag22 -Properties MemberOf
$user.MemberOf | ForEach-Object { $_ -replace '^CN=.*?,', '' }
```

Here’s the revised two-liner command that excludes the `CN=` part and retains only the group names:

```powershell
Import-Module ActiveDirectory

$user = Get-ADUser -Identity harag22 -Properties MemberOf
$user.MemberOf | ForEach-Object { $_ -replace '^CN=([^,]+).+', '$1' }
```

### Explanation of the Updated Regex:
- **`^CN=`**: Matches the start of the string with `CN=`.
- **`([^,]+)`**: Captures one or more characters that are not commas (this is the group name).
- **`.+`**: Matches the rest of the string after the group name.
- **`'$1'`**: Replaces the entire string with just the captured group name.

This will effectively extract and display only the group names.


