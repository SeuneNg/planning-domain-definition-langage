(define (problem LOGISTIK)
  (:domain LOGISTIK)
  (:objects 
	camion - truck
	avion - airplane
        Aeroport2 - location
	Aeroport1 - location
	entrepot3 - location
	entrepot - warehouse
	colis - ob)
  (:init (and
    (atA avion Aeroport1)
    (atO colis Aeroport1)
    (atW entrepot entrepot3 ) 
    (atT camion Aeroport2)))
  (:goal (and (atO colis entrepot3 ) (not (inT colis camion)))))

