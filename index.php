<?php
include 'lib/autoload.php';
Config::debug();
$asset = new BasicAssetic();
?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <!-- Place favicon.ico in the root directory -->
		<link href='http://fonts.googleapis.com/css?family=Josefin+Slab:700|Open+Sans:300italic,300|Raleway:400,100,300|Old+Standard+TT' rel='stylesheet' type='text/css'>
        <?php
        $asset->asset('css/font-awesome.min.css');
        $asset->asset('css/normalize.css');
        $asset->asset('js/vendor/hexList/hexList.css');
        $asset->asset('css/main.css');
        $asset->asset('js/vendor/modernizr-2.8.3.min.js');
        $asset->asset('http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js',[
                'internal' => false
        ]);
        ?>
        <script>window.jQuery || document.write('<?php $asset->asset('js/vendor/jquery-2.1.3.min.js'); ?>')</script>
        <?php
        $asset->asset('node_modules/masonry-layout/dist/masonry.pkgd.min.js');
        $asset->asset('js/vendor/jquery-ui.min.js');
        $asset->asset('js/vendor/jsrender.min.js');
        $asset->asset('js/vendor/jquery.backgroundpos.min.js');
        $asset->asset('js/plugins.js');
        $asset->asset('js/vendor/jquery.foggy.min.js');
        $asset->asset('js/shootingStar.js');
        $asset->asset('js/twinkleStars.js');
        $asset->asset('js/vendor/hexList/js/hexList.js');
        $asset->asset('js/vendor/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.min.css');
        $asset->asset('js/vendor/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js');
        $asset->asset('js/main.js');
        ?>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <div id="preloaderBackgroundContainer"></div>
        <div id="backgroundContainer"></div>
		<div id="bodyWrapper">
			<div id="bodyContainer"></div>
        </div>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
    </body>
</html>
