<?php

namespace Demo\Domain\Service;

use Doctrine\ORM\EntityManagerInterface;

class Demo
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