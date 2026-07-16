# Fetch all Resource Groups
Write-Host "===== Resource Groups ====="
$resourceGroups = Get-AzResourceGroup

$resourceGroups | Select-Object ResourceGroupName, Location |
    Format-Table -AutoSize


# Fetch all Storage Accounts
Write-Host "`n===== Storage Accounts ====="
$storageAccounts = Get-AzStorageAccount

$storageAccounts | Select-Object StorageAccountName, ResourceGroupName, Location |
    Format-Table -AutoSize


# Fetch Storage Containers from each Storage Account
Write-Host "`n===== Storage Containers ====="

foreach ($storage in $storageAccounts)
{
    Write-Host "`nStorage Account: $($storage.StorageAccountName)"

    $ctx = $storage.Context

    $containers = Get-AzStorageContainer -Context $ctx

    if ($containers.Count -eq 0)
    {
        Write-Host "No containers found."
    }
    else
    {
        $containers | Select-Object Name, PublicAccess |
            Format-Table -AutoSize
    }
}

