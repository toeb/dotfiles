Write-Host "**** Import Tobias Preferences ****"


function profile
{
    return "$PSCommandPath"
}

$profile = $(profile);



function gitpkg
{    
    param($repositoryDir, $targetDir)
    if($repositoryDir -eq $null)
    {
        $repositoryDir = "$PWD"
    }    

    if($targetDir -eq $null)
    {
        $targetDir = ".."    
    }
    pushd $repositoryDir
    $dir = $(git rev-parse --show-toplevel)
    pushd $dir
    try{
        $repositoryDir = gi $dir;
        $name = $repositoryDir.Name;
        $filename = "$name.git"
        $targetPath = "$targetDir/$filename"

        git bundle create $targetPath --all

    }catch{

    }
    popd
    popd
}



function saveprofile
{





}