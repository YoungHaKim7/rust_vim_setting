
# https://github.com/Canop/broot/issues/460#issuecomment-1303005689
Function br {
  $args = $args -join ' '
  $cmd_file = New-TemporaryFile

  $process = Start-Process -FilePath 'broot.exe' `
                           -ArgumentList "--outcmd $($cmd_file.FullName) $args" `
                           -NoNewWindow -PassThru -WorkingDirectory $PWD

  Wait-Process -InputObject $process #Faster than Start-Process -Wait
  If ($process.ExitCode -eq 0) {
    $cmd = Get-Content $cmd_file
    Remove-Item $cmd_file
    If ($cmd -ne $null) { Invoke-Expression -Command $cmd }
  } Else {
    Remove-Item $cmd_file
    Write-Host "`n" # Newline to tidy up broot unexpected termination
    Write-Error "broot.exe exited with error code $($process.ExitCode)"
  }
}
