$ProcessName = "BackgroundTransferHost"
$State = "CloseWait "
while ($true) {

    sleep -Seconds 20
    $id = (Get-Process $ProcessName).Id

    Get-NetTCPConnection -OwningProcess $id -State $State | % {

        .\cports.exe /close * * $_.RemoteAddress $_.RemotePort

    }

}
