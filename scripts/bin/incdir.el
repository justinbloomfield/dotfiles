(defvar count 1)
(while (< count 11)
  (mkdir (format "/home/poq/src/hsk/wk%s" count))
  (setq count (1+ count)))