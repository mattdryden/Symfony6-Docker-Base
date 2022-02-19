<?php

namespace App\Controller;

use App\Service\DemoService;
use JMS\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\View\View;
use FOS\RestBundle\Controller\AbstractFOSRestController;
use App\Response\WelcomeResponse;
use FOS\RestBundle\Controller\Annotations as Rest;

/**
* @Route("/")
*/
class DefaultController extends AbstractFOSRestController
{
    private DemoService $demoService;
    private SerializerInterface $serializer;

    public function __construct(DemoService $demoService, SerializerInterface $serializer)
    {
        $this->demoService = $demoService;
        $this->serializer = $serializer;
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

    /**
    * @Route("/api/json", methods={"GET"})
    */
    public function welcome(): View
    {
        return View::create(new WelcomeResponse('fred'), Response::HTTP_OK);
    }
}
