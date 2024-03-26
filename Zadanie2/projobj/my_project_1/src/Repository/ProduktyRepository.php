<?php

namespace App\Repository;

use App\Entity\Produkty;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Produkty>
 *
 * @method Produkty|null find($id, $lockMode = null, $lockVersion = null)
 * @method Produkty|null findOneBy(array $criteria, array $orderBy = null)
 * @method Produkty[]    findAll()
 * @method Produkty[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProduktyRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Produkty::class);
    }

//    /**
//     * @return Produkty[] Returns an array of Produkty objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Produkty
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
