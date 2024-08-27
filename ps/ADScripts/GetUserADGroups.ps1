# Filename: Get-UserGroups.ps1

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
