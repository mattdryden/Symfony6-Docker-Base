<?php

namespace App\Controller;

use App\Entity\User;
use App\Service\Demo as DemoService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class DemoController extends AbstractController
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
