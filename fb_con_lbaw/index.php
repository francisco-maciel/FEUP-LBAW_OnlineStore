<?php
$title = isset($_GET['title']) ? $_GET['title'] : "Default title";
$url = isset($_GET['url']) ? $_GET['url'] : "http://gnomo.fe.up.pt/~lbaw1324/final";
$description = isset($_GET['description']) ? $_GET['description'] : "Default description";

?>
<!DOCTYPE html>
<html>
    <head>
        <meta property="og:title" content="<?php echo $title; ?>"/>
        <meta property="og:image" content="http://i.imgur.com/EWRf50D"/>
        <meta property="og:url" content="<?php echo $url; ?>"/>
        <meta property="og:description" content="<?php echo $description; ?>"/>
        <meta http-equiv="refresh" content="0; URL=<?php echo $url; ?>">

        
    </head>
    <body>
    </body>
</html>




