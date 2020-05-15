# This script will change the Integrated Webcam frequency from 60Hz (110v - American) to 50Hz (220v - Rest of World)

$integratedWebcam = (Get-CimInstance Win32_PnPEntity | where caption -Match 'Integrated Webcam').pnpDeviceID
$WebcamPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$integratedWebcam\Device Parameters"
$Name = "PowerlineFrequency"
$Value = 1 # 1 for 50Hz , 2 for 60Hz

# This command will tell you what PowerlineFreqency is set
# (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\$integratedWebcam\Device Parameters" -Name PowerlineFrequency).PowerlineFrequency

Set-ItemProperty -Path $WebcamPath -Name $Name -Value $Value
