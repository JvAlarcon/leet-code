(ns leet-code.001-two-sum)

 ; Exercise from https://leetcode.com/problems/two-sum/description/
; Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
; You may assume that each input would have exactly one solution, and you may not use the same element twice.
; You can return the answer in any order.

; Example 1:
; Input: nums = [2,7,11,15], target = 9
; Output: [0,1]
; Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

; Example 2:
; Input: nums = [3,2,4], target = 6
; Output: [1,2]

; Example 3:
; Input: nums = [3,3], target = 6
; Output: [0,1]

; Constraints:
; 2 <= nums.length <= 104
; -109 <= nums[i] <= 109
; -109 <= target <= 109
; Only one valid answer exists.

(defn find-position [pred coll]
  (keep-indexed (fn [idx x]
                  (when (pred x)
                    idx))
                coll))

(defn twoSum
  ([nums target]
   (twoSum nums target 0))
  ([nums target pos]
   (let [nums-len (count nums)]
     (if (>= pos nums-len)
       "Target value not present in list"
       (let [initial-element (get nums pos)
             element-to-find  (- target initial-element)
             element-pos (remove #(= % pos) (find-position #{element-to-find} nums))]
         (if (not-empty element-pos)
           [pos (first element-pos)]
           (recur  nums target (+ pos 1))))))))

(twoSum [2, 7, 11, 15] 9)
(twoSum [2, 7, 11, 15] 27)
; The previous problem for the cases below to not work was because when initial-element happens to be equal to element-to-find find-position would find 3 at position 0.
; And because pos is also 0, the code pairs pos 0 with (first element-pos) would give me 0, resulting in [0, 0]
; To correct that, I needed to remove the position from nums before finding the position
(twoSum [3, 2, 4] 6)
(twoSum [3, 3] 6)
