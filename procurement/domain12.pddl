(define (domain procurement_truck)
(:requirements :typing :durative-actions :fluents :duration-inequalities)

(:types    itemB itemD itemE itemA itemC itemI itemJ itemK itemL itemN itemM itemF itemG itemH - item
            location
)

    (:predicates (available)
                (finished)
                (can_produce_A ?loc1 - location)
                (can_produce_C ?loc1 - location)
                (can_produce_B ?loc1 - location)
                (can_produce_D ?loc1 - location)
                (can_produce_L ?loc1 - location)
                (can_produce_F ?loc1 - location)
                (can_produce_G ?loc1 - location)
                (link ?loc1 ?loc2 - location)
                (can_supply ?loc1 - location)
                (delivered ?a - item ?loc1 - location)
                (at ?loc1 - location)
          )

      (:functions   (stock ?e - item)
            )

(:durative-action produce_item_A  
:parameters (?a - itemA ?b - itemB ?c - itemC ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_A ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?b) (* ?batchsize 2) ) )
                (at start (>= (stock ?c) ?batchsize) )
                (at end (>= (stock ?b) 0) ) 
                (at end (>= (stock ?c) 0) )
                (at end (>= (stock ?a) 0) )

            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?a) ?batchsize))
                (at start (decrease (stock ?c) ?batchsize))
                (at start (decrease (stock ?b) (* ?batchsize 2) ) )
                (at end (available))
)
)

(:durative-action produce_item_B
:parameters(?i - itemI ?j - itemJ ?k - itemK ?b - itemB ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_B ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?j) ?batchsize ) )
                (at start (>= (stock ?i) (* ?batchsize 4) ) )
                (at start (>= (stock ?k) (* ?batchsize 2) ) )
                (at end (>= (stock ?i) 0) ) 
                (at end (>= (stock ?j) 0) )
                (at end (>= (stock ?k) 0) )
                (at end (>= (stock ?b) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?b) ?batchsize) )
                (at start (decrease (stock ?j) ?batchsize ) )
                (at start (decrease (stock ?i) (* ?batchsize 4) ) )
                (at start (decrease (stock ?k) (* ?batchsize 2) ) )
                (at end (available))
)
)

(:durative-action produce_item_C
:parameters(?c - itemC ?d - itemD ?e - itemE ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_C ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?e) ?batchsize) )
                (at start (>= (stock ?d) (* ?batchsize 3) ) )
                (at end (>= (stock ?e) 0) ) 
                (at end (>= (stock ?d) 0) )
                (at end (>= (stock ?c) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?c) ?batchsize) )
                (at start (decrease (stock ?d) (* ?batchsize 3) ) )
                (at start (decrease (stock ?e) ?batchsize) )
                (at end (available))
)
)

(:durative-action produce_item_D  
:parameters(?l - itemL ?n - itemN ?d - itemD ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_D ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?l) (* ?batchsize 2) ) )
                (at start (>= (stock ?n) (* ?batchsize 2) ) )
                (at end (>= (stock ?l) 0) ) 
                (at end (>= (stock ?n) 0) )
                (at end (>= (stock ?d) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?d) ?batchsize) )
                (at start (decrease (stock ?l) (* ?batchsize 2) ) )
                (at start (decrease (stock ?n) (* ?batchsize 2) ) )
                (at end (available))
)
)

(:durative-action produce_item_L  
:parameters(?l - itemL ?m - itemM ?f - itemF ?b - itemB ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_L ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?m) (* ?batchsize 2) ) )
                (at start (>= (stock ?f) ?batchsize ) )
                (at start (>= (stock ?b) ?batchsize ) )
                (at end (>= (stock ?m) 0) ) 
                (at end (>= (stock ?f) 0) )
                (at end (>= (stock ?b) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?l) ?batchsize) )
                (at start (decrease (stock ?m) (* ?batchsize 2) ) )
                (at start (decrease (stock ?f) ?batchsize) )
                (at start (decrease (stock ?b) ?batchsize) )
                (at end (available))
)
)

(:durative-action produce_item_F  
:parameters(?g - itemG ?h - itemH ?f - itemF ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_F ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?g) (* ?batchsize 2) ) )
                (at start (>= (stock ?h) (* ?batchsize 3) ) )
                (at end (>= (stock ?f) 0) ) 
                (at end (>= (stock ?g) 0) )
                (at end (>= (stock ?h) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?f) ?batchsize) )
                (at start (decrease (stock ?g) (* ?batchsize 2) ) )
                (at start (decrease (stock ?h) (* ?batchsize 3) ) )
                (at end (available))
)
)

(:durative-action produce_item_G  
:parameters(?e - itemE ?n - itemN ?j - itemJ ?g - itemG ?loc1 - location)
:control (?batchsize - number)
:duration (= ?duration 1)
:condition (and (at start (available))
                (at start (>= ?batchsize 1))
                (at start (<= ?batchsize 80))
                (at start (can_produce_G ?loc1))
                (at start (at ?loc1) )
                (at start (>= (stock ?e) (* ?batchsize 2) ) )
                (at start (>= (stock ?n) (* ?batchsize 2) ) )
                (at start (>= (stock ?j) ?batchsize) )
                (at end (>= (stock ?e) 0) ) 
                (at end (>= (stock ?n) 0) )
                (at end (>= (stock ?j) 0) )
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?g) ?batchsize) )
                (at start (decrease (stock ?e) (* ?batchsize 2) ) )
                (at start (decrease (stock ?n) (* ?batchsize 2) ) )
                (at start (decrease (stock ?j) ?batchsize) )
                (at end (available))
)
)

(:durative-action Supply_Raw_Material
:parameters(?i - itemI ?e - itemE ?j - itemJ ?k - itemK ?n - itemN  ?m - itemM ?h - itemH ?loc1 - location)
:control (?batchsize_E ?batchsize_I ?batchsize_J ?batchsize_K ?batchsize_N ?batchsize_M ?batchsize_G ?batchsize_H - number)
:duration (= ?duration 1)
:condition (and (at start (>=   ?batchsize_I 1))
                (at start (<= ?batchsize_I 80))
                (at start (>=   ?batchsize_E 1))
                (at start (<= ?batchsize_E 80))
                (at start (>=   ?batchsize_J 1))
                (at start (<= ?batchsize_J 80))
                (at start (>=   ?batchsize_K 1))
                (at start (<= ?batchsize_K 80))
                (at start (>=   ?batchsize_N 1))
                (at start (<= ?batchsize_N 80))
                (at start (>=   ?batchsize_M 1))
                (at start (<= ?batchsize_M 80))
                (at start (>=   ?batchsize_H 1))
                (at start (<= ?batchsize_H 80))
                (at start (available))
                (at start (can_supply ?loc1) )
                (at start (at ?loc1) )
                (at end (>= (stock ?i) 0) ) 
                (at end (>= (stock ?e) 0) )
                (at end (>= (stock ?j) 0) )
                (at end (>= (stock ?k) 0) )
                (at end (>= (stock ?n) 0) )
                (at end (>= (stock ?m) 0) ) 
                (at end (>= (stock ?h) 0) )             
            )
:effect (and    (at start (not (available)))
                (at start (increase (stock ?i) ?batchsize_I))
                (at start (increase (stock ?e) ?batchsize_E))
                (at start (increase (stock ?j) ?batchsize_J))
                (at start (increase (stock ?k) ?batchsize_K))
                (at start (increase (stock ?n) ?batchsize_N))
                (at start (increase (stock ?m) ?batchsize_M)) 
                (at start (increase (stock ?h) ?batchsize_H))                               
                (at end (available))
)
)

(:durative-action Go_to
:parameters (?loc1 ?loc2 - location)
:duration (= ?duration 5)
:condition (and (at start (at ?loc1) )
                (at start (link ?loc1 ?loc2))
                (at start (available)))
:effect (and       
            (at start (not (available)))
            (at start (not (at ?loc1)))
            (at end (at ?loc2))
           (at end (available))
        ))

(:durative-action Deliver_To_Customer
:parameters (?a - item ?loc1 - location)
:duration (= ?duration 1)
:condition (and (at start (>= (stock ?a) 2 ) )
                (at start (available))
                (at start (at ?loc1) ) 
                (at end (>= (stock ?a) 0) ) )
:effect (and (at end (delivered ?a ?loc1))
                (at start (not (available)))
                (at start (decrease (stock ?a) 2 ))
                (at end (available)))
)
)