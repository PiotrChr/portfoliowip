<?php

class BasicAssetic {

    private $paths = ['lib','fonts','gfx','doc','img','css','js','tmp'];
    private $comments = [
        'js' => ["/*","*/"],
        'css' => ["/*","*/"],
        'html' => ["<!--","-->"]
    ];
    private $insertTag = [
        'js' => ['<script src="','"></script>'],
        'css' => ['<link rel="stylesheet" href="','" />']
    ];
    private $wrapTag = [
        'js' => ['<script>','</script>'],
        'css' => ['<style>','</style>']
    ];
    private $knownTypes = [
        'js','css'
    ];

    public function __construct() {
        $this->paths['lib'] = Config::$mainPath.'/lib/';
        $this->paths['fonts'] = Config::$mainPath.'/fonts/';
        $this->paths['gfx'] = Config::$mainPath.'/gfx/';
        $this->paths['doc'] = Config::$mainPath.'/doc/';
        $this->paths['img'] = Config::$mainPath.'/img/';
        $this->paths['css'] = Config::$mainPath.'/css/';
        $this->paths['js'] = Config::$mainPath.'/js/';
        $this->paths['tmp'] = Config::$mainPath.'/tmp/';
    }

    public function asset($file, $config = []) {
        $defaults = [
            'internal' => true,
            'returnPath' => true,
            'addTags' => true,
            'leaveNotice' => true,
            'addVersion' => false
        ];

        $keysIntersect = array_intersect_key($config, $defaults);
        $config = array_merge($defaults, $keysIntersect);
        extract($config);

        $fileType = strtolower(pathinfo($file, PATHINFO_EXTENSION));
        if (!in_array($fileType,$this->knownTypes)) {
            echo 'Unknown file type.';
            return;
        }

        /**
         * @var $internal
         * @var $returnPath
         * @var $addTags
         * @var $leaveNotice
         */
        $exists = ($internal) ? file_exists($file) : $this->checkRemote($file);
        if ($exists) {
            if ($returnPath) {
                echo $this->insertTag[$fileType][0].$file.$this->insertTag[$fileType][1];
            } else {
                echo ($addTags) ? $this->wrapTag[$fileType][0].file_get_contents($file).$this->wrapTag[$fileType][1] : file_get_contents($file);
            }
        } else if ($leaveNotice){
            echo ($returnPath) ? $this->comments['html'][0].' Unable to load file: '.$file.' '.$this->comments['html'][1] : $this->comments[$fileType][0].' Unable to load file: '.$file.' '.$this->comments[$fileType][1];
        }

    }

    private function checkRemote($url,$accepted = [200]) {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_NOBODY, true);
        curl_exec($ch);
        $retCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return in_array($retCode,$accepted);
    }
}
