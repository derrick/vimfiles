
"" Dispatch Ignore
syntax region clojureDispatchIgnoreSexp start="(" end=")" contained contains=clojureDispatchIgnoreSexp
syntax region clojureDispatchIgnoreVector start="\[" end="]" contained contains=clojureDispatchIgnoreVector
syntax region clojureDispatchIgnoreMap start="{" end="}" contained contains=clojureDispatchIgnoreMap
syntax region clojureDispatchIgnoreString start=/"/ skip=/\\\\\|\\"/ end=/"/

syntax match clojureComment "#_" nextgroup=clojureDispatchIgnoreSexp,clojureDispatchIgnoreVector,clojureDispatchIgnoreMap,clojureDispatchIgnoreString
syntax match clojureComment "\v#_\k+"

highlight default link clojureDispatchIgnore Comment
highlight default link clojureDispatchIgnoreSexp Comment
highlight default link clojureDispatchIgnoreVector Comment
highlight default link clojureDispatchIgnoreMap Comment
highlight default link clojureDispatchIgnoreString Comment
