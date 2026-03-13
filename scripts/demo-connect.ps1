$PublicIp = Read-Host "Enter the EC2 public IP"
$PemPath = Read-Host "Enter the path of your private key file"

Write-Host ""
Write-Host "Opening SSH session..." -ForegroundColor Cyan
ssh -i $PemPath ec2-user@$PublicIp
