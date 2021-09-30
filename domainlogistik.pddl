(define (domain LOGISTIK)
  (:requirements :strips :typing)
  (:types ob airplane truck warehouse location)
  (:predicates
    (inA ?t - truck ?a - airplane)
    (atA ?a - airplane ?loc - location)
    (atO ?o - ob ?loc - location)
    (atW ?w - warehouse ?loc - location) 
    (atT ?t - truck ?loc - location)
    (inT ?o - ob ?t - truck))
  (:action LOAD 
    :parameters (?o - ob ?loc - location ?t - truck))
    :precondition (and (atO ?o - ob ?loc - location) (atT ?t - truck ?loc - location))
    :effect (and (inT ?o - ob ?t - truck) (not (atO ?o - ob ?loc - location))))
  (:action LOAD-AIRPLANE
    :parameters (?o ?loc ?t  ?a)
    :precondition (and (inT ?o - objet ?t - truck) (atA ?a - airplane ?loc - location) (atT ?t - truck ?loc - location))
    :effect (and (inA ?t - truck ?a - airplane)
            (not (atT ?t - truck ?loc - location))))
  (:action FLY
    :parameters (?o - objet ?loc1 - location ?loc2 - location ?t - truck ?a - airplane)
    :precondition (and (inA ?t - truck ?a - airplane) (atA ?a - airplane ?loc1 - location))
    :effect (and (atA ?a - airplane ?loc2 - location) (not (atA ?a - airplane ?loc1 - location))))
  (:action UNLOADAIRPLANE
    :parameters (?loc - location ?t - truck ?a - airplane)
    :precondition (and (inA ?t - truck ?a - airplane) (atA ?a - airplane ?loc - location))
    :effect (and (atT ?t - truck ?loc - location)
            (not (inA ?t - truck ?a - airplane))))
  (:action DRIVETRUCK
    :parameters (?loc1 - location ?t - truck ?loc2 - location ?w - warehouse)
    :precondition (and (atT ?t - truck ?loc - location) (atW ?w - warehouse ?loc2 - location))
    :effect (and (atT ?t - truck ?loc2 - location)
            (not (atT ?t - truck ?loc1 - location))))
  (:action UNLOADTRUCK
    :parameters (?o - objet ?loc - location ?t - truck ?w - warehouse)
    :precondition (and (atW ?w - warehouse ?loc - location) (atT ?t - truck ?loc - location) (inT ?o - objet ?t - truck))
    :effect (and (atO ?o - objet ?loc - location) (not (inT ?o - objet ?t - truck)))
)