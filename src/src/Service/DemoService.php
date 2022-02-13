<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;

class DemoService
{
    private EntityManagerInterface $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function welcomeMessage()
    {
        return "This is just an example service!";
    }
}