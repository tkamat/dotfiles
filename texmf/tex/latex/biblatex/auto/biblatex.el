(TeX-add-style-hook
 "biblatex"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "pdftexcmds"
    "etoolbox"
    "keyval"
    "kvoptions"
    "logreq"
    "ifthen"
    "url"
    "xstring")
   (TeX-add-symbols
    "endrefsegment"
    '("printdelim" ["argument"] 1)
    '("bibendnotewrapper" 1)
    '("bibfootnotewrapper" 1)
    '("DeclareRefcontext" 2)
    '("ifpartannotation" 2)
    '("ifitemannotation" 1)
    '("iffieldannotation" 1)
    '("DeclareDelimcontextAlias" 2)
    '("delimcontext" 1)
    '("rangelen" 1)
    "nolinkurl"
    "blx"
    "NumcheckSetup"
    "ppspace"
    "sqspace"
    "RNfont"
    "Rnfont"
    "assignrefcontextkeyws"
    "assignrefcontextcats"
    "assignrefcontextentries"
    "bibleftparen"
    "bibrightparen"
    "bibleftbracket"
    "bibrightbracket"
    "isundefined"
    "thelisttotal"
    "thelistcount"
    "theliststart"
    "theliststop"
    "thecitetotal"
    "themulticitecount"
    "themulticitetotal"
    "theinstcount"
    "themaxnames"
    "theminnames"
    "themaxitems"
    "theminitems"
    "thecitecount"
    "theuniquelist"
    "theuniquename"
    "therefsection"
    "therefsegment"
    "themaxextratitle"
    "themaxextratitleyear"
    "themaxextrayear"
    "themaxextraalpha"
    "theabbrvpenalty"
    "thehighnamepenalty"
    "thelownamepenalty"
    "themaxparens"
    "theparenlevel"
    "frenchspacing"
    "nonfrenchspacing"
    "Lu"
    "storedpar"
    "temp"
    "RN"
    "Rn"
    "frangelen"
    "newblock"
    "ifcrossrefsource"
    "ifxrefsource"
    "pno"
    "ppno"
    "nopp"
    "psq"
    "psqq"
    "IeC"
    "j"
    "MakeUppercase"
    "MakeLowercase"
    "currentname"
    "bibinitperiod"
    "bibinitdelim"
    "bibinithyphendelim"
    "bibnamedelima"
    "bibnamedelimb"
    "bibnamedelimc"
    "bibnamedelimd"
    "bibnamedelimi"
    "currentlist"
    "finentry"
    "i"
    "biblcstring"
    "biblclstring"
    "biblcsstring"
    "bibstring"
    "biblstring"
    "bibsstring"
    "bibucstring"
    "bibuclstring"
    "bibucsstring"
    "bibcpstring"
    "bibcplstring"
    "bibcpsstring"
    "bibname"
    "refname"
    "biblistname"
    "InheritBibliographyStrings"
    "DeclareBibliographyStrings"
    "InheritBibliographyExtras"
    "DeclareBibliographyExtras"
    "UndeclareBibliographyExtras"
    "DeclareHyphenationExceptions"
    "bibdatetimesep"
    "mkdatezeros"
    "printdatelabel"
    "printdatelabelextra"
    "currentlang"
    "regexp"
    "dateeraprintpre"
    "dateeraprint"
    "iflabeldateera"
    "iflabelenddateera"
    "iflabeldatecirca"
    "iflabelenddatecirca"
    "iflabeldatejulian"
    "iflabelenddatejulian"
    "iflabeldateuncertain"
    "iflabelenddateuncertain"
    "iffirstinits"
    "item"
    "break"
    "NewCount"
    "NewOption"
    "NewValue"
    "preamble"
    "warn"
    "missing"
    "keyalias"
    "set"
    "inset"
    "xref"
    "keyw"
    "range"
    "strng"
    "cnt"
    "true"
    "false"
    "annotation"
    "makelabel"
    "not"
    "NOT"
    "and"
    "AND"
    "or"
    "OR"
    "section"
    "segment"
    "type"
    "subtype"
    "keyword"
    "category"
    "the"
    "skipentry"
    "newrefsection"
    "newrefsegment"
    "printshorthands"
    "AtBeginShorthands"
    "AtEveryLositem"
    "newrefcontext"
    "nocite"
    "blxmciteicmd"
    "blxmcites"
    "blxendmcites"
    "ifhyperref"
    "ifmorenames"
    "ifmoreitems"
    "iffirstcitekey"
    "iflastcitekey"
    "ifciteseen"
    "ifentryseen"
    "ifentryinbib"
    "ifciteibid"
    "ifciteidem"
    "ifopcit"
    "ifloccit"
    "ifsamepage"
    "iffirstonpage"
    "ifcurrentfield"
    "ifcurrentlist"
    "ifcurrentname"
    "ifentrytype"
    "iffieldequalcs"
    "iffieldequals"
    "iffieldequalstr"
    "iffieldsequal"
    "ifbibmacroundef"
    "iffieldundef"
    "ifnameequalcs"
    "ifnameequals"
    "ifnamesequal"
    "ifnameundef"
    "ifcategory"
    "ifkeyword"
    "ifentrycategory"
    "ifentrykeyword"
    "ifcapital"
    "ifinteger"
    "iffieldint"
    "ifnumeral"
    "ifnumerals"
    "ifpages"
    "iffieldnum"
    "iffieldnums"
    "iffieldpages"
    "ifbibstring"
    "iffieldbibstring"
    "ifnatbibmode"
    "ifcitation"
    "ifbibliography"
    "ifciteindex"
    "ifbibindex"
    "iffootnote"
    "ifuseprefix"
    "ifterseinits"
    "ifsingletitle"
    "ifuniquetitle"
    "ifuniquebaretitle"
    "ifuniquework"
    "ifuniqueprimaryauthor"
    "ifandothers"
    "noexpand"
    "mkbibsuperscript"
    "labelalphaothers"
    "sortalphaothers"
    "protect"
    "nolabel"
    "nosort"
    "noinit"
    "member"
    "maps"
    "map"
    "perdatasource"
    "pertype"
    "pernottype"
    "step"
    "labelelement"
    "except"
    "inherit"
    "noinherit"
    "filteror"
    "filter"
    "translit"
    "namepart"
    "keypart"
    "ifsortnamekeyscheme"
    "name"
    "list"
    "sort"
    "citeorder"
    "field"
    "literal"
    "newblockpunct"
    "bibopenparen"
    "bibcloseparen"
    "bibopenbracket"
    "bibclosebracket"
    "ResetDatamodelEntrytypes"
    "ResetDatamodelFields"
    "ResetDatamodelEntryfields"
    "ResetDatamodelConstraints")
   (LaTeX-add-environments
    "dateuncertainprint"
    "datecircaprintedtf"
    "datecircaprint"
    "refsection"
    "refcontext"
    "lverb"
    "verb"
    "sortlist"
    "entry")
   (LaTeX-add-counters
    "listtotal"
    "listcount"
    "liststart"
    "liststop"
    "citecount"
    "citetotal"
    "multicitecount"
    "multicitetotal"
    "instcount"
    "maxnames"
    "minnames"
    "maxitems"
    "minitems"
    "citecounter"
    "savedcitecounter"
    "uniquelist"
    "uniquename"
    "refsection"
    "refsegment"
    "maxextratitle"
    "maxextratitleyear"
    "maxextrayear"
    "maxextraalpha"
    "abbrvpenalty"
    "highnamepenalty"
    "lownamepenalty"
    "maxparens"
    "parenlevel"
    "mincomprange"
    "maxcomprange"
    "mincompwidth")
   (LaTeX-add-lengths
    "labelnumberwidth"
    "labelalphawidth"
    "biblabelsep"
    "bibitemsep"
    "bibnamesep"
    "bibinitsep"
    "bibparsep"
    "bibhang"
    "expandafter"))
 :latex)
