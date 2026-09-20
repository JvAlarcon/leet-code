(ns leet-code.012-int-to-roman-v2)

; https://leetcode.com/problems/integer-to-roman/description/

; This version is a translation from the erlang version
; It is more cleaner and allow a better use of recursion
(def roman-dictionary
  [[1000 "M"] [900 "CM"] [500 "D"]
   [400 "CD"] [100 "C"] [90 "XC"]
   [50 "L"] [40 "XL"] [10 "X"]
   [9 "IX"] [5 "V"] [4 "IV"] [1 "I"]])

(defn translate [dictionary number acc]
  (cond
    (<= number 0) acc
    (empty? dictionary) acc
    :else
    (let [[key value] (first dictionary)
          tail (rest dictionary)]
      (if (>= number key)
        (recur dictionary (- number key) (str acc value))
        (recur tail number acc)))))

(defn int-to-roman [num]
  (if (zero? num)
    "nulla"
    (translate roman-dictionary num "")))
