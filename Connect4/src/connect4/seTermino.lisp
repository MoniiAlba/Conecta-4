
(load 'matriz.txt)
(setq fichaYo 'r)
(setq fichaOp 'a)


;;===============================================
;;================MetodosConecta=================
;;===============================================

;(setq tablero (make-array '(6 7)))
(setq diag nil)
(setq tableroP (make-array '(6 7) :initial-contents 
	'((r   a   r   r   a   a   nil)
	  (nil r   a   r   r   a   nil)
	  (nil r   a   r   r   a   nil)
	  (nil a   a   a   nil a   nil)
	  (nil nil r   nil nil nil nil)
	  (nil nil nil nil nil nil nil))))

 (defun copy-array (array)
 (let ((dims (array-dimensions array)))
   (adjust-array
    (make-array dims :displaced-to array)
    dims)))






(defun renglon (tablero col)
	(renglonPrimerFicha tablero col 5))
(defun renglonPrimerFicha (tablero col j)
	(cond 
		((< j 0) nil)
		((null (aref tablero j col)) (renglonPrimerFicha tablero col (- j 1)))
		(T j)))
;(insertaFicha tablero 2 'r 0)
;(insertaFicha tablero 2 'r 0)
;(insertaFicha tablero 2 'r 0)
;(insertaFicha tablero 2 'r 0)
;(insertaFicha tablero 2 'r 0)
;(insertaFicha tablero 2 'r 0)
;(print tablero)
;(print (renglonPrimerFicha tablero 2 5))


;;Busca en una col el numero de veces que hay numFichas
;;en cuatro celdas adyacentes sin fichas del oponente entre
;ellas
(defun buscaNCol (tablero col ficha numFichas)
	(let ((ren 5)  (j 0)
		(act nil) (descartado nil) (cont 0) (i 0) (res 0) ) 
		(loop 
			(when (< ren 3) (return res))
			(setq j 0)
			(setq descartado nil)
			(setq cont 0)
			(loop
				(when (> j 3) (return))
				(setq i (- ren j) )
				(setq act (aref tablero i col))
				;(print act)
				;(print i)
				(when (or (> j 3) (< i 0)  descartado )
					(return))
				(cond
					((null act))
					(( not (equal act ficha) ) (setq descartado T))
					(T (incf cont)))
				(incf j))
			(when (and (= cont numFichas) (not descartado)) (incf res))
			(decf ren))))
; (print tableroP)
; (setq col 2)
; (print 'buscaNCol)
; (print col)
; (print (buscaNCol tableroP col 'r 4))

(defun buscaNRen (tablero ren ficha numFichas)
	(let ((col 0)  (j 0)
		(act nil) (descartado nil) (cont 0) (i 0) (res 0) ) 
		(loop 
			(when (> col 3) (return res))
			(setq j 0)
			(setq descartado nil)
			(setq cont 0)
			(loop
				(when (> j 3) (return))
				(setq i (+ col j) )
				(setq act (aref tablero ren i))
				;(print act)
				(when (or (> j 3) (> i 6)  descartado )
					(return))
				(cond
					((null act))
					(( not (equal act ficha) ) (setq descartado T))
					(T (incf cont)))
				(incf j))
			(when (and (= cont numFichas) (not descartado)) (incf res))
			(incf col))))

; (print tableroP)
; (setq ren 2)
; (print 'buscaNRen)
; (print ren)
; (print (buscaNRen tableroP ren 'r 4))

(defun buscaNDiagCres (tablero ren col ficha numFichas)
	(let (  (j 0)
		(act nil) (descartado nil) (cont 0) (i 0) (res 0)
		(termina nil) (colA 0) (renA 0) ) 
		(loop 
			(when termina (return res))
			;(when (> col 3) (return res))
			(setq j 0)
			(setq descartado nil)
			(setq cont 0)
			(setq colA col)
			(setq renA ren)
			(loop
				(when (> j 3) (return))
				(setq renA (+ ren j) )
				(setq colA (+ col j) )
				;(print `(,renA ,colA))
				(if (or (> colA 6) (> renA 5)) (setq termina T) (setq act (aref tablero renA colA)))
				;(print act)
				(when (or descartado termina )
					(return))
				(cond
					((null act))
					(( not (equal act ficha) ) (setq descartado T))
					(T (incf cont)))
				(incf j))
			(when (and (not descartado) (not termina) (= cont numFichas)) (incf res))
			(incf col)
			(incf ren))))
; (print tableroP)
; (setq ren 3)
; (setq col 0)
; (print 'buscaNDiagCres)
; (print `(,ren ,col))
; (print (buscaNDiagCres tableroP ren col 'r 4))

(defun buscaNDiagDec (tablero ren col ficha numFichas)
	(let (  (j 0)
		(act nil) (descartado nil) (cont 0) (i 0) (res 0)
		(termina nil) (colA 0) (renA 0) ) 
		(loop 
			(when termina (return res))
			;(when (> col 3) (return res))
			(setq j 0)
			(setq descartado nil)
			(setq cont 0)
			(setq colA col)
			(setq renA ren)
			(loop
				(when (> j 3) (return))
				(setq renA (- ren j) )
				(setq colA (+ col j) )
				;(print `(,renA ,colA))
				(if (or (> colA 6) (< renA 0)) (setq termina T) (setq act (aref tablero renA colA)))
				;(print act)
				(when (or descartado termina )
					(return))
				(cond
					((null act))
					(( not (equal act ficha) ) (setq descartado T))
					(T (incf cont)))
				(incf j))
			(when (and (not descartado) (not termina) (= cont numFichas)) (incf res))
			(incf col)
			(decf ren))))
; (print tableroP)
; (setq ren 5)
; (setq col 0)
; (print 'buscaNDiagDec)
; (print `(,ren ,col))
; (print (buscaNDiagDec tableroP ren col 'r 4))








;col es la columna donde se hizo la ultima 
; inserción
(defun esTerminalTablero (tablero col ficha)
	(let ((res 0) (ren (renglon tablero col)) (m -1)) 
		(setq res (+ res (buscaNCol tablero col ficha 4)))
		(setq res (+ res (buscaNRen tablero ren ficha 4)))
		(setq m (min col ren))
		(setq res (+ res (buscaNDiagCres tablero (- ren m) (- col m) ficha 4 )))
		(setq m (min col (- 5 ren)))
		(setq res (+ res (buscaNDiagDec tablero (+ ren m) (- col m) ficha 4)))
		(> res 0)))
; (print tableroP)
; (setq col 5)
; (print col)
; (print (esTerminalTablero tableroP col 'r))

(defun yaSeAcabo (tablero ficha)
	(let ((col 0) (esT nil))
		(loop 
			(when (or esT (< 6 col)) (return esT))
			(cond
				((null (aref tablero 0 col)) (setq esT nil))
				(T (setq esT (esTerminalTablero tablero col ficha))))
			(incf col)

			)))
(print (or (yaSeAcabo tableroIni fichaOp) (yaSeAcabo tableroIni fichaYo)))
