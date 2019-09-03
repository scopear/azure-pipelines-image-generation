$secSerial = ConvertTo-SecureString $ENV:UNITY_SERIAL -AsPlainText -Force
$secPasswd = ConvertTo-SecureString $ENV:UNITY_PASSWORD -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($ENV:UNITY_USER, $secPasswd)
Start-UnityEditor -Credential $mycreds -Serial $secSerial -Wait