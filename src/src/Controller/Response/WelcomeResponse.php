<?php

namespace App\Response;

use JMS\Serializer\Annotation as Serializer;
use Symfony\Component\HttpFoundation\Response;

class WelcomeResponse {
    /**
     * @Serializer\Expose()
     */
    private $name;

    public function __construct(string $name)
    {
        $this->name = $name;
    }
}