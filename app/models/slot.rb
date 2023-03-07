class Slot < ApplicationRecord
  PROGRAMMING_LANGUAGES = %w[
    C# C++ CSS3 HTML5 Java JavaScript PHP
    Python Ruby Rust TypeScript
  ]
  validates :price, :programming_language, :start_date, :end_date, :start_time, :end_time, presence: true
  validates :programming_language, acceptance: { accept: PROGRAMMING_LANGUAGES }
  #  validate :end_date_after_start_date

  has_one :gig
  belongs_to :user

  include PgSearch::Model
  # multisearchable against: %i[programming_language name]

  pg_search_scope :search_programming_language,
                  against: %i[programming_language],
                  associated_against: {
                    user: %i[name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  # private

  # def end_date_after_start_date
  #  return if end_date.blank? || start_date.blank?

  # if end_date < start_date
  # errors.add(:end_date, "must be after the start date")
  # elsif start_date < Date.today
  # errors.add(:start_date)
  #  end
  # end

  # If autocomplete is made, use this array
  # PROGRAMMING_LANGUAGES = %w[1C Enterprise
  #   2-Dimensional Array
  #   4D
  #   ABAP
  #   ABAP CDS
  #   ABNF
  #   ActionScript
  #   Ada
  #   Adblock Filter List
  #   Adobe Font Metrics
  #   Agda
  #   AGS Script
  #   AIDL
  #   AL
  #   Alloy
  #   Alpine Abuild
  #   Altium Designer
  #   AMPL
  #   AngelScript
  #   Ant Build System
  #   Antlers
  #   ANTLR
  #   ApacheConf
  #   Apex
  #   API Blueprint
  #   APL
  #   Apollo Guidance Computer
  #   AppleScript
  #   Arc
  #   AsciiDoc
  #   ASL
  #   ASN.1
  #   ASP.NET
  #   AspectJ
  #   Assembly
  #   Astro
  #   Asymptote
  #   ATS
  #   Augeas
  #   AutoHotkey
  #   AutoIt
  #   Avro IDL
  #   Awk
  #   Ballerina
  #   BASIC
  #   Batchfile
  #   Beef
  #   Befunge
  #   Berry
  #   BibTeX
  #   Bicep
  #   Bikeshed
  #   Bison
  #   BitBake
  #   Blade
  #   BlitzBasic
  #   BlitzMax
  #   Bluespec
  #   Boo
  #   Boogie
  #   Brainfuck
  #   BrighterScript
  #   Brightscript
  #   Browserslist
  #   C-ObjDump
  #   C2hs Haskell
  #   Cabal Config
  #   Cadence
  #   Cairo
  #   CameLIGO
  #   CAP CDS
  #   Cap&#39;n Proto
  #   CartoCSS
  #   Ceylon
  #   Chapel
  #   Charity
  #   Checksums
  #   ChucK
  #   CIL
  #   Cirru
  #   Clarion
  #   Clarity
  #   Classic ASP
  #   Clean
  #   Click
  #   CLIPS
  #   Clojure
  #   Closure Templates
  #   Cloud Firestore Security Rules
  #   CMake
  #   COBOL
  #   CODEOWNERS
  #   CodeQL
  #   ColdFusion
  #   ColdFusion CFC
  #   COLLADA
  #   Common Lisp
  #   Common Workflow Language
  #   Component Pascal
  #   CoNLL-U
  #   Cool
  #   Coq
  #   Cpp-ObjDump
  #   Creole
  #   Crystal
  #   CSON
  #   Csound
  #   Csound Document
  #   Csound Score
  #   CSV
  #   Cuda
  #   CUE
  #   Cue Sheet
  #   cURL Config
  #   Curry
  #   CWeb
  #   Cycript
  #   Cypher
  #   Cython
  #   D
  #   D-ObjDump
  #   Dafny
  #   Darcs Patch
  #   DataWeave
  #   Debian Package Control File
  #   DenizenScript
  #   desktop
  #   Dhall
  #   Diff
  #   DIGITAL Command Language
  #   dircolors
  #   DirectX 3D File
  #   DNS Zone
  #   Dockerfile
  #   Dogescript
  #   DTrace
  #   Dylan
  #   E
  #   E-mail
  #   Eagle
  #   Earthly
  #   Easybuild
  #   EBNF
  #   eC
  #   Ecere Projects
  #   ECL
  #   ECLiPSe
  #   Ecmarkup
  #   EditorConfig
  #   Edje Data Collection
  #   edn
  #   Eiffel
  #   EJS
  #   Elm
  #   Elvish
  #   Emacs Lisp
  #   EmberScript
  #   EQ
  #   Erlang
  #   Euphoria
  #   F#
  #   F*
  #   Factor
  #   Fancy
  #   Fantom
  #   Faust
  #   Fennel
  #   FIGlet Font
  #   Filebench WML
  #   Filterscript
  #   fish
  #   Fluent
  #   FLUX
  #   Formatted
  #   Forth
  #   Fortran
  #   Fortran Free Form
  #   FreeBasic
  #   FreeMarker
  #   Frege
  #   Futhark
  #   G-code
  #   Game Maker Language
  #   GAML
  #   GAMS
  #   GAP
  #   GCC Machine Description
  #   GDB
  #   GDScript
  #   GEDCOM
  #   Gemfile.lock
  #   Gemini
  #   Genero
  #   Genero Forms
  #   Genie
  #   Genshi
  #   Gentoo Ebuild
  #   Gentoo Eclass
  #   Gerber Image
  #   Gettext Catalog
  #   Gherkin
  #   Git Attributes
  #   Git Config
  #   Git Revision List
  #   Gleam
  #   GLSL
  #   Glyph
  #   Glyph Bitmap Distribution Format
  #   GN
  #   Gnuplot
  #   Go Checksums
  #   Go Module
  #   Golo
  #   Gosu
  #   Grace
  #   Gradle
  #   Grammatical Framework
  #   Graph Modeling Language
  #   GraphQL
  #   Graphviz (DOT)
  #   Groovy Server Pages
  #   GSC
  #   Hack
  #   Haml
  #   Handlebars
  #   HAProxy
  #   Harbour
  #   Haskell
  #   Haxe
  #   HCL
  #   HiveQL
  #   HLSL
  #   HOCON
  #   HolyC
  #   hoon
  #   HTML+ECR
  #   HTML+EEX
  #   HTML+ERB
  #   HTML+PHP
  #   HTML+Razor
  #   HTTP
  #   HXML
  #   Hy
  #   HyPhy
  #   IDL
  #   Idris
  #   Ignore List
  #   IGOR Pro
  #   ImageJ Macro
  #   Imba
  #   Inform 7
  #   INI
  #   Ink
  #   Inno Setup
  #   Io
  #   Ioke
  #   IRC log
  #   Isabelle
  #   Isabelle ROOT
  #   J
  #   Janet
  #   JAR Manifest
  #   Jasmin
  #   Java Properties
  #   Java Server Pages
  #   JavaScript+ERB
  #   Jest Snapshot
  #   JetBrains MPS
  #   JFlex
  #   Jinja
  #   Jison
  #   Jison Lex
  #   Jolie
  #   jq
  #   JSON
  #   JSON with Comments
  #   JSON5
  #   JSONiq
  #   JSONLD
  #   Jsonnet
  #   Julia
  #   Jupyter Notebook
  #   just
  #   Kaitai Struct
  #   KakouneScript
  #   KiCad Layout
  #   KiCad Legacy Layout
  #   KiCad Schematic
  #   Kit
  #   KRL
  #   Kusto
  #   kvlang
  #   LabVIEW
  #   Lark
  #   Lasso
  #   Latte
  #   Lean
  #   Less
  #   Lex
  #   LFE
  #   LigoLANG
  #   LilyPond
  #   Limbo
  #   Linker Script
  #   Linux Kernel Module
  #   Liquid
  #   Literate Agda
  #   Literate CoffeeScript
  #   Literate Haskell
  #   LiveScript
  #   LLVM
  #   Logos
  #   Logtalk
  #   LOLCODE
  #   LookML
  #   LoomScript
  #   LSL
  #   LTspice Symbol
  #   Lua
  #   M
  #   M4
  #   M4Sugar
  #   Macaulay2
  #   Makefile
  #   Mako
  #   Markdown
  #   Marko
  #   Mask
  #   Mathematica
  #   MATLAB
  #   Maven POM
  #   Max
  #   MAXScript
  #   mcfunction
  #   Mercury
  #   Mermaid
  #   Meson
  #   Metal
  #   Microsoft Developer Studio Project
  #   Microsoft Visual Studio Solution
  #   MiniD
  #   MiniYAML
  #   Mint
  #   Mirah
  #   mIRC Script
  #   MLIR
  #   Modelica
  #   Modula-2
  #   Modula-3
  #   Module Management System
  #   Monkey
  #   Monkey C
  #   Moocode
  #   MoonScript
  #   Motoko
  #   Motorola 68K Assembly
  #   Move
  #   MQL4
  #   MQL5
  #   MTML
  #   MUF
  #   mupad
  #   Muse
  #   Mustache
  #   Myghty
  #   nanorc
  #   Nasal
  #   NASL
  #   NCL
  #   Nearley
  #   Nemerle
  #   NEON
  #   nesC
  #   NetLinx
  #   NetLinx+ERB
  #   NetLogo
  #   NewLisp
  #   Nextflow
  #   Nginx
  #   Nim
  #   Ninja
  #   Nit
  #   Nix
  #   NL
  #   NPM Config
  #   NSIS
  #   Nu
  #   NumPy
  #   Nunjucks
  #   NWScript
  #   OASv2-json
  #   OASv2-yaml
  #   OASv3-json
  #   OASv3-yaml
  #   ObjDump
  #   Object Data Instance Notation
  #   Objective-C++
  #   Objective-J
  #   ObjectScript
  #   OCaml
  #   Odin
  #   Omgrofl
  #   ooc
  #   Opa
  #   Opal
  #   Open Policy Agent
  #   OpenAPI Specification v2
  #   OpenAPI Specification v3
  #   OpenCL
  #   OpenEdge ABL
  #   OpenQASM
  #   OpenRC runscript
  #   OpenSCAD
  #   OpenStep Property List
  #   OpenType Feature File
  #   Option List
  #   Org
  #   Ox
  #   Oxygene
  #   Oz
  #   P4
  #   Pan
  #   Papyrus
  #   Parrot
  #   Parrot Assembly
  #   Parrot Internal Representation
  #   Pascal
  #   Pawn
  #   PDDL
  #   PEG.js
  #   Pep8
  #   Pic
  #   Pickle
  #   PicoLisp
  #   PigLatin
  #   Pike
  #   PlantUML
  #   PLpgSQL
  #   PLSQL
  #   Pod
  #   Pod 6
  #   PogoScript
  #   Polar
  #   Pony
  #   Portugol
  #   PostCSS
  #   PostScript
  #   POV-Ray SDL
  #   PowerBuilder
  #   Prisma
  #   Processing
  #   Procfile
  #   Proguard
  #   Prolog
  #   Promela
  #   Propeller Spin
  #   Protocol Buffer
  #   Protocol Buffer Text Format
  #   Public Key
  #   Pug
  #   Puppet
  #   Pure Data
  #   PureBasic
  #   PureScript
  #   Python console
  #   Python traceback
  #   q
  #   Q#
  #   QMake
  #   QML
  #   Qt Script
  #   Quake
  #   R
  #   Racket
  #   Ragel
  #   Raku
  #   RAML
  #   Rascal
  #   Raw token data
  #   RDoc
  #   Readline Config
  #   REALbasic
  #   Reason
  #   ReasonLIGO
  #   Rebol
  #   Record Jar
  #   Red
  #   Redcode
  #   Redirect Rules
  #   Regular Expression
  #   Ren&#39;Py
  #   RenderScript
  #   ReScript
  #   reStructuredText
  #   REXX
  #   Rich Text Format
  #   Ring
  #   Riot
  #   RMarkdown
  #   RobotFramework
  #   robots.txt
  #   Roff
  #   Roff Manpage
  #   Rouge
  #   RouterOS Script
  #   RPC
  #   RPGLE
  #   RPM Spec
  #   RUNOFF
  #   Sage
  #   SaltStack
  #   SAS
  #   Sass
  #   Scaml
  #   Scenic
  #   Scheme
  #   Scilab
  #   SCSS
  #   sed
  #   Self
  #   SELinux Policy
  #   ShaderLab
  #   ShellCheck Config
  #   ShellSession
  #   Shen
  #   Sieve
  #   Simple File Verification
  #   Singularity
  #   Slash
  #   Slice
  #   Slim
  #   Smali
  #   Smalltalk
  #   Smarty
  #   Smithy
  #   SmPL
  #   SMT
  #   Solidity
  #   Soong
  #   SourcePawn
  #   SPARQL
  #   Spline Font Database
  #   SQF
  #   SQL
  #   SQLPL
  #   Squirrel
  #   SRecode Template
  #   SSH Config
  #   Stan
  #   Standard ML
  #   STAR
  #   Starlark
  #   Stata
  #   STL
  #   STON
  #   StringTemplate
  #   Stylus
  #   SubRip Text
  #   SugarSS
  #   SuperCollider
  #   Svelte
  #   SVG
  #   SWIG
  #   SystemVerilog
  #   Talon
  #   Tcl
  #   Tcsh
  #   Tea
  #   Terra
  #   TeX
  #   Texinfo
  #   Text
  #   Textile
  #   TextMate Properties
  #   Thrift
  #   TI Program
  #   TLA
  #   TOML
  #   TSQL
  #   TSV
  #   TSX
  #   Turing
  #   Turtle
  #   Twig
  #   TXL
  #   Type Language
  #   Unified Parallel C
  #   Unity3D Asset
  #   Unix Assembly
  #   Uno
  #   UnrealScript
  #   UrWeb
  #   V
  #   Vala
  #   Valve Data Format
  #   VBA
  #   VBScript
  #   VCL
  #   Velocity Template Language
  #   Verilog
  #   VHDL
  #   Vim Help File
  #   Vim Script
  #   Vim Snippet
  #   Visual Basic .NET
  #   Visual Basic 6.0
  #   Volt
  #   Vue
  #   Vyper
  #   Wavefront Material
  #   Wavefront Object
  #   wdl
  #   Web Ontology Language
  #   WebAssembly
  #   WebIDL
  #   WebVTT
  #   Wget Config
  #   Whiley
  #   Wikitext
  #   Win32 Message File
  #   Windows Registry Entries
  #   wisp
  #   Witcher Script
  #   Wollok
  #   World of Warcraft Addon Data
  #   Wren
  #   X BitMap
  #   X Font Directory Index
  #   X PixMap
  #   X10
  #   xBase
  #   XC
  #   XCompose
  #   XML
  #   XML Property List
  #   Xojo
  #   Xonsh
  #   XPages
  #   XProc
  #   XQuery
  #   XS
  #   XSLT
  #   Xtend
  #   Yacc
  #   YAML
  #   YANG
  #   YARA
  #   YASnippet
  #   Yul
  #   ZAP
  #   Zeek
  #   ZenScript
  #   Zephir
  #   Zig
  #   ZIL
  #   Zimpl]
end
