# ==================================== Functions ====================================
function ServiceIsRunning($ServiceName)
{
    [bool] $flag = $false

    if (Get-WmiObject -Class Win32_Service -Filter "Name='$ServiceName' and State='Running'") {
        $flag = $true
    }

    return $flag
}


function runMysql
{
    if (!$(ServiceIsRunning("mysql80")))
    {
        net start mysql80
    }
    & "$env:PROGRAMFILES\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
}


function runGource($path)
{
    & "$env:PROGRAMFILES\Gource\gource.exe" $path
}


# ==================================== UI ====================================
# TODO


# ==================================== Aliases ====================================
Set-Alias -Name mysql -Value runMysql
Set-Alias -Name visual-git -Value runGource
