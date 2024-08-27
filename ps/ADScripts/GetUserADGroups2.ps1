# Filename: Get-UserADGroups.ps1

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
