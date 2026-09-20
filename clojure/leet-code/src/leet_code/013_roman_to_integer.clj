(ns leet-code.013-roman-to-integer)

; https://leetcode.com/problems/roman-to-integer/description/

; This version is a translation from the erlang version
(def roman-dictionary
  {"M" 1000, "D" 500, "C" 100,
  "L" 50, "X" 10, "V" 5,
  "I" 1})

(defn translate [dictionary char-list acc]
  (cond
    (empty? char-list) acc
    :else
    (let [current-head (first char-list)
          current-tail (rest char-list)
          next-head (if (seq current-tail) (first current-tail) :empty)
          current-number (get dictionary current-head)
          next-number (get dictionary next-head 0)]
      (cond
        (< current-number next-number)
        (let [next-tail (rest current-tail)
              result (- next-number current-number)]
          (recur dictionary next-tail (+ acc result)))
        :else
        (recur dictionary current-tail (+ acc current-number))))))

(defn roman-to-int [text]
  (let [char-list (mapv str text)
         acc 0]
    (translate roman-dictionary char-list acc)))
