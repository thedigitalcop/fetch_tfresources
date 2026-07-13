        azureSubscription: 'Azure subscription 1'
        $ResourceGroupName = "newterra-rg", "terrabackup"
          Write-Host "Fetching resources from resource group: $ResourceGroupName"
          $resources = Get-AzResource -ResourceGroupName $ResourceGroupName
          if ($resources.Count -eq 0) {
              Write-Host "No resources found in the resource group."
          }
          else {
              $resources | Select-Object Name, ResourceType, Location | Format-Table -AutoSize
              $resources | Select-Object Name, ResourceType, Location |
                  Export-Csv -Path "$(Build.ArtifactStagingDirectory)/resources.csv" -NoTypeInformation
              Write-Host "Resource details exported to resources.csv"
          }
        azurePowerShellVersion: 'LatestVersion'
        pwsh: true
