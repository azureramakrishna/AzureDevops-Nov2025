$connectTestResult = Test-NetConnection -ComputerName ramakrishna21102025.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"ramakrishna21102025.file.core.windows.net`" /user:`"localhost\ramakrishna21102025`" /pass:`"FGMK6Hcio2/yPnWKEECxkNrMY9rE7KjYFnAboEQw9TXtcHmW3rH1GmPPUu12mZ6Ksvj7y7DLSRzQ+AStD3jTXg==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\ramakrishna21102025.file.core.windows.net\volvo-fs" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}