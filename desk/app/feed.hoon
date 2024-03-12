/-  *feed
/+  dbug, default-agent
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0  
  $:
    pals=[targets=(set ship) leeches=(set ship)]
    =store
    ::=saved
    ::=hidden
  ==
::
+$  card  $+(card card:agent:gall)
--
::
%-  agent:dbug
=|  versioned-state
=*  state  -
::
^-  agent:gall
::
=<
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %|) bowl)
    hc   ~(. +> [bowl ~])
::
++  on-init
  ^-  (quip card _this)
  =^  cards  state  abet:init:hc
  [cards this]
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  =vase
  ^-  (quip card _this)
  =^  cards  state  abet:(load:hc vase)
  [cards this]
::
++  on-poke
  |=  =cage
  ^-  (quip card _this)
  =^  cards  state  abet:(poke:hc cage)
  [cards this]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  [~ ~]
  ::?>  =(src.bowl our.bowl)
  ::(peek:hc path)
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  =^  card  state  abet:(agent:hc [wire sign])
  [cards this]
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  [~ this]
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  [~ this]
::
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--
::
|_  [=bowl:gall deck=(list card)]
+*  that  .
::
++  emit  |=(=card that(deck [card deck]))
++  emil  |=(lac=(list card) that(deck (welp lac deck)))
++  abet  ^-((quip card _state) [(flop deck) state])
::
++  init
  ^+  that
  %-  emit
  :*  %pass  /targets  %agent
      [our.bowl %pals]  %watch  /targets
    ==  
::
++  poke
  |=  [=mark =vase]
  ^+  that
  ?+  mark  that
    %feed-action
      ?>  =(our.bowl src.bowl)
      =/  act  (action !<(action vase))
      (handle-action act)
    %feed-message
      =/  msg  (message !<(message vase))
      (handle-message msg)
  ==
++  handle-action
  |=  act=action
  ^+  that
  ?>  ?=(%broadcast -.act)
  =/  hops  hops.signal.act
  =/  post  post.signal.act
  ::  ?> on -.post so that author is not blocked
  ::  measure size of path to prevent DDoS
  ?>  (lte 256 (met 3 (jam post)))
  that
++  handle-message
  |=  msg=message
  ^+  that  that
::++  peek
::  |=  =path
::  ^-  (unit (unit cage))
::  ?+    path  [~ ~]
::      [%x %universe ~]
::    ``explorer-universe+!>(universe)
::  ==
::
++  load
  |=  =vase
  ^+  that
  ?>  ?=([%0 *] q.vase)
  that(state !<(state-0 vase))
--