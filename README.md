<?php
$fileget = file_get_contents('https://launchermeta.mojang.com/mc/game/version_manifest.json');
$array = json_decode($fileget, true);
$latest = $array['latest']['release'];

for($i = 0; $i < count($array['versions']); ++$i){
    if ($array['versions'][$i]['id']==$latest){
    $url = ($array['versions'][$i]['url']);
    $urlget = file_get_contents($url);
    $array2 = json_decode($urlget, true);
    $url2 = $array2['downloads']['server']['url'];
    }
}
echo $url2;
header("Location: $url2");
exit();
?>
Hi
