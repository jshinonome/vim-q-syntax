" Vim syntax file
" Language:     q
" Maintainer:   Jo Shinonome <jo.shinonome@gmail.com>
" URL:          http://https://github.com/jshinonome/vim-q-syntax
" Last Change:  2022 Aug 6

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'q'
elseif exists("b:current_syntax") && b:current_syntax == "q"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword qCommentDoc         param return contained
syn match   qLineComment        "^\/.*" contains=@Spell,qCommentDoc
syn match   qLineComment        "\s\/.*" contains=@Spell,qCommentDoc
syn region  qComment            start="^/\s*$"  end="^\\\s*$" contains=@Spell,qCommentDoc
syn region  qComment            start="^\\\s*$"  end="\%$" contains=@Spell,qCommentDoc

" escape utf8
syn match   qSpecial            "\\\d\d\d\|\\." contained
syn region  qString             start=+"+  skip=+\\\\\|\\"+  end=+"\|$+ contains=qSpecial

syn match   qSymbol             "\v`(:[a-zA-Z0-9_\.:/]*|[a-zA-Z0-9_\.:]*)"

syn match   qInternalFunction   "\v\.Q\.(A|addmonths|addr|a|b6|btoa|bt|bv|Cf|chk|cn|D|dd|def|dpfts|dpft|dsftg|ens|en|fc|ff|fk|fmt|fps|fsn|fs|ft|fu|f|gc|gz|hdpf|hg|host|hp|id|ind|j10|j12|k|l|MAP|M|nA|opt|par|pd|PD|pf|pn|pt|pv|PV|P|qp|qp|qt|qt|res|s1|sbt|sha1|s|trp|ts|ty|u|V|view|vp|v|w|x10|x12|x|Xf)"
syn match   qInternalFunction   "\v\.j\.(k|jd|j)"
syn match   qInternalFunction   "\v\.z\.(ac|bm|exit|p[cdghiopqsw]|ts|vs|w[cos]|ex|ey|pm|zd|[a-fhiklno-qstuwxzDKNPTWXZ])"
syn match   qInternalFunction   "\v\.h\.(br|c0|c1|cd|code|d|edsn|ed|fram|ha|hb|hc|he|hn|HOME|hp|hr|htac|hta|htc|html|http|ht|hug|hu|hy|iso8601|jx|logo|nbr|pre|sa|sb|sc|td|text|tx|ty|uh|val|xd|xmp|xs|xt)"
" not working
syn match   qInternalFunction   "\v[0-2]:"
syn match   qInternalFunction   "\v-([1-9]|1[0-689]|2[0-79]|3[01368]|120)!"

syn match   qNull               "\v<0(N[ghijepmdznuvt]?|n)>"
syn match   qBoolean            "\v<[01]+b>"
syn match   qInfinity           "\v<-?0(W[hijepdnutv]?|wz?)>"

syn match   Number              "\v<0x[0-9a-fA-F]+>"
syn match   Float               "\v<[0-9]+\.[0-9]*(e[+-]=[0-9]+)=>"
syn match   Float               "\v\.[0-9]+(e[+-]=[0-9]+)="
syn match   Float               "\v<[0-9]+e[+-]=[0-9]+>"
syn match   Number              "\v<[0-9]+[fhij]=>"

syn match   qCommand            "^\\.\+"

syn match   qIdentifier         "\v\.[a-zA-Z][a-zA-Z0-9_]*(\.[a-zA-Z0-9_]+)*" contains=qInternalFunction

" temporal types
syn match   qDate               "\v<([12]\d{3}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01]))>"
syn match   qMonth              "\v<([12]\d{3}\.(0[1-9]|1[0-2])m)>"
syn match   qTime               "\v<([01]\d|2[0-3])(:([0-5]\d)(:([0-5]\d(\.\d{0,3})?))?)>"
syn match   qTimespan           "\v<\d+D(([01]\d|2[0-3])(:([0-5]\d)(:([0-5]\d(\.\d{0,9})?))?)?)?n?>"
syn match   qTimestamp          "\v<([12]\d{3}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01]))(p|D|Dp)>"
syn match   qTimestamp          "\v<([12]\d{3}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01]))D([01]\d|2[0-3])(:([0-5]\d)(:([0-5]\d(\.\d{0,9})?))?)?p?>"
syn match   qDatetime           "\v<([12]\d{3}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01]))(z|T|Tz)>"
syn match   qDatetime           "\v<([12]\d{3}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01]))T([01]\d|2[0-3])(:([0-5]\d)(:([0-5]\d(\.\d{0,3})?))?)?z?>"

syn keyword qConditional        do while if
syn keyword qKeyword            abs acos all and any asc asin asof atan attr avg avgs bin binr ceiling cols cor cos count cov cross csv cut deltas desc dev differ distinct div dsave each ema enlist eval except exec exit exp fills first fkeys flip floor get getenv group gtime hclose hcount hdel hopen hsym iasc idesc in inter inv key keys last like load log lower lsq ltime ltrim mavg max maxs mcount md5 mdev med meta min mins mmax mmin mmu mod msum neg next not null or over parse peach pj prd prds prev prior rand rank ratios raze read0 read1 reciprocal reval reverse rload rotate rsave rtrim save scan scov sdev set setenv show signum sin sqrt ss ssr string sublist sum sums sv svar system tables tan til trim type ungroup union upper value var view views vs wavg within wsum xasc xbar xcol xcols xdesc xexp xgroup xkey xlog xprev xrank
syn keyword qDML                select update delete exec from by fby where aj aj0 ajf ajf0 ej ij ijf lj ljf uj ujf wj wj1 upsert insert

syn match   qError              "^[}\])]"

if main_syntax == "q"
  syn sync fromstart
  syn sync maxlines=100

  syn sync ccomment qComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link qComment            Comment
hi def link qLineComment        Comment
hi def link qCommentDoc         Keyword
hi def link qSpecial            Special
hi def link qString             String
hi def link qInternalFunction   Type
hi def link qConditional        Conditional
hi def link qKeyword            Keyword
hi def link qDML                Keyword
hi def link qError              Error
hi def link qBoolean            Boolean
hi def link qSymbol             Constant
hi def link qNull               Constant
hi def link qInfinity           Constant
hi def link qDate               Constant
hi def link qMonth              Constant
hi def link qTime               Constant
hi def link qTimespan           Constant
hi def link qTimestamp          Constant
hi def link qDatetime           Constant
hi def link qCommand            Constant
hi def link qIdentifier         Function

let b:current_syntax = "q"
if main_syntax == 'q'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

