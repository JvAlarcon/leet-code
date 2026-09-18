(ns leet-code.012-int-to-roman)

; https://leetcode.com/problems/integer-to-roman/description/
; Dictionary to be consulted. Add more numbers if you want support to 4000 or above
(def roman_dictionary
  (sorted-map-by >
                 1000 "M" 900 "CM"
                 500 "D" 400 "CD"
                 100 "C" 90 "XC"
                 50 "L" 40 "XL"
                 10 "X" 9 "IX"
                 5 "V" 4 "IV"
                 1 "I"))

; Given a dictionary and a number, translate that number into the dictionary
(defn translate [dictionary number]
  (if (or (nil? number)
           (<= number 0))
    ""
    (loop [[[k v] & tail] (seq dictionary)]
      (when k
        (if (<= number k)
          (str v (translate dictionary (- k number)))
          (recur tail))))))
