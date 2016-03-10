<?php

class ContactController extends AbstractController {

    private $model;
    public $resource;

    public function __construct() {
        $this->resource = 'contact';
        $this->model = new ContactModel();
    }

    public function getAction($request) {
        $this->setResult(true);
        return $this->getResult();
    }
}