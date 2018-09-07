New-Alias cur_l C:\curl\curl.exe
New-Alias react-native-app create-react-native-app

function touch ([string]$name) {
    
    if($name -match '[^\.]+\.[^$]+') {
        New-Item -ItemType File -Name $name
    } else {
        New-Item -ItemType Directory -Name $name
    }
}

function adb ([string] $command) {
    
    if($command -eq $null) { 
        & 'C:\Program Files (x86)\Android\android-sdk\platform-tools\adb.exe'
    } else {
        & 'C:\Program Files (x86)\Android\android-sdk\platform-tools\adb.exe' $($command)
    }
}

function vs($solution) {

    if($solution -eq $null) {
        & 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe'
    }
    else {
        & 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe' $($solution)
    }
}

function ssh($server) {
    & 'C:\Program Files\Git\usr\bin\ssh.exe' $($server)
}

function csc($param) {

    & 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe' $param

}

function sublime($param) {
    & 'C:\Program Files\Sublime Text 3\sublime_text.exe' $param
}
