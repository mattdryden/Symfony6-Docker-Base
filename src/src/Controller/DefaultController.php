<?php

namespace App\Controller;

use App\Service\DemoService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
* @Route("/")
*/
class DefaultController extends AbstractController
{
    private DemoService $demoService;

    public function __construct(DemoService $demoService)
    {
        $this->demoService = $demoService;
    }

    /**
    * @Route("/", methods={"GET"})
    */
    public function index(): Response
    {
        $message = $this->demoService->welcomeMessage();
        return $this->render('welcome/welcome.html.twig', [
            "message" => $message
        ]);
    }
}
