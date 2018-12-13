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
    param($message)
    git clone https://github.com/toeb/dotfiles.git tmprepo
    pushd tmprepo
    cp $profile .
    git add .
    git commit -m "updated profile $message"
    git push
    popd
    rm -r tmprepo


}