<?php

namespace App\Controller;

use App\Entity\Produkty;
use App\Repository\ProduktyRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;


class ProduktyController extends AbstractController
{

  private $eM;
  private $pR;

    public function __construct(EntityManagerInterface $entityManager, ProduktyRepository $produktyRepository)
    {
        $this->eM = $entityManager;
        $this->pR = $produktyRepository;
    }


    private function serializujDane(Produkty $produkt): array
    {
        return [
            'id' => $produkt->getId(),
            'nazwa' => $produkt->getNazwa(),
            'cena' => $produkt->getCena(),
            'ilosc' => $produkt->getIlosc(),
        ];
    }

    public function showAll(): JsonResponse
    {
        $produkty = $this->pR->findAll();

        $produktyLista = [];
        foreach ($produkty as $produkt) {
            $produktyLista[] = $this->serializujDane($produkt);
        }

        return new JsonResponse($produktyLista);
    }


    public function showOne($id): JsonResponse
    {
        $produkt = $this->pR->find($id);

        if (!$produkt) {
            return new JsonResponse(['message' => 'Nie znaleziono'], JsonResponse::HTTP_NOT_FOUND);
        }

        return new JsonResponse($this->serializujDane($produkt));
    }

    public function create(Request $request): JsonResponse
    {
        $dane = json_decode($request->getContent(), true);
        $produkt = new Produkty();
        $produkt->setNazwa($dane['nazwa']);
        $produkt->setCena($dane['cena']);
        $produkt->setIlosc($dane['ilosc']);

        $this->eM->persist($produkt);
        $this->eM->flush();
        return new JsonResponse($this->serializujDane($produkt));
    }


    public function update($id, Request $request): JsonResponse
    {
        $produkt = $this->pR->find($id);

        if (!$produkt) {
            return new JsonResponse(['message' => 'Nie znaleziono'], JsonResponse::HTTP_NOT_FOUND);
        }

        $dane = json_decode($request->getContent(), true);
        $produkt->setNazwa($dane['nazwa'] ?? $produkt->getNazwa());
        $produkt->setCena($dane['cena'] ?? $produkt->getCena());
        $produkt->setIlosc($dane['ilosc'] ?? $produkt->getIlosc());

        $this->eM->flush();
        return new JsonResponse($this->serializujDane($produkt));
    }


    public function delete($id): JsonResponse
    {
        $produkt = $this->pR->find($id);
        if ($produkt == null) {
            return new JsonResponse(['message' => 'Nie znaleziono'], JsonResponse::HTTP_NOT_FOUND);
        }

        $this->eM->remove($produkt);
        $this->eM->flush();
        return new JsonResponse(['message' => 'Usunieto']);
    }


}