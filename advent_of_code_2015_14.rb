# --- Day 7: Some Assembly Required ---
# This year, Santa brought little Bobby Tables a set of wires and bitwise logic gates! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

# Each wire has an identifier (some lowercase letters) and can carry a 16-bit signal (a number from 0 to 65535). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

# The included instructions booklet describes how to connect the parts together: x AND y -> z means to connect wires x and y to an AND gate, and then connect its output to wire z.

# For example:

# 123 -> x means that the signal 123 is provided to wire x.
# x AND y -> z means that the bitwise AND of wire x and wire y is provided to wire z.
# p LSHIFT 2 -> q means that the value from wire p is left-shifted by 2 and then provided to wire q.
# NOT e -> f means that the bitwise complement of the value from wire e is provided to wire f.
# Other possible gates include OR (bitwise OR) and RSHIFT (right-shift). If, for some reason, you'd like to emulate the circuit instead, almost all programming languages (for example, C, JavaScript, or Python) provide operators for these gates.

# For example, here is a simple circuit:

# 123 -> x
# 456 -> y
# x AND y -> d
# x OR y -> e
# x LSHIFT 2 -> f
# y RSHIFT 2 -> g
# NOT x -> h
# NOT y -> i
# After it is run, these are the signals on the wires:

# d: 72
# e: 507
# f: 492
# g: 114
# h: 65412
# i: 65079
# x: 123
# y: 456
# In little Bobby's kit's instructions booklet (provided as your puzzle input), what signal is ultimately provided to wire a?

class SantaBitwiseGame

  INSTRUCTION_BOOKLET = "NOT dq -> dr
  kg OR kf -> kh
  ep OR eo -> eq
  3176 -> b
  NOT gs -> gt
  dd OR do -> dp
  eg AND ei -> ej
  y AND ae -> ag
  jx AND jz -> ka
  lf RSHIFT 2 -> lg
  z AND aa -> ac
  dy AND ej -> el
  bj OR bi -> bk
  kk RSHIFT 3 -> km
  NOT cn -> co
  gn AND gp -> gq
  cq AND cs -> ct
  eo LSHIFT 15 -> es
  lg OR lm -> ln
  dy OR ej -> ek
  NOT di -> dj
  1 AND fi -> fj
  kf LSHIFT 15 -> kj
  NOT jy -> jz
  NOT ft -> fu
  fs AND fu -> fv
  NOT hr -> hs
  ck OR cl -> cm
  jp RSHIFT 5 -> js
  iv OR jb -> jc
  is OR it -> iu
  ld OR le -> lf
  NOT fc -> fd
  NOT dm -> dn
  bn OR by -> bz
  aj AND al -> am
  cd LSHIFT 15 -> ch
  jp AND ka -> kc
  ci OR ct -> cu
  gv AND gx -> gy
  de AND dk -> dm
  x RSHIFT 5 -> aa
  et RSHIFT 2 -> eu
  x RSHIFT 1 -> aq
  ia OR ig -> ih
  bk LSHIFT 1 -> ce
  y OR ae -> af
  NOT ca -> cb
  e AND f -> h
  ia AND ig -> ii
  ck AND cl -> cn
  NOT jh -> ji
  z OR aa -> ab
  1 AND en -> eo
  ib AND ic -> ie
  NOT eh -> ei
  iy AND ja -> jb
  NOT bb -> bc
  ha OR gz -> hb
  1 AND cx -> cy
  NOT ax -> ay
  ev OR ew -> ex
  bn RSHIFT 2 -> bo
  er OR es -> et
  eu OR fa -> fb
  jp OR ka -> kb
  ea AND eb -> ed
  k AND m -> n
  et RSHIFT 3 -> ev
  et RSHIFT 5 -> ew
  hz RSHIFT 1 -> is
  ki OR kj -> kk
  NOT h -> i
  lv LSHIFT 15 -> lz
  as RSHIFT 1 -> bl
  hu LSHIFT 15 -> hy
  iw AND ix -> iz
  lf RSHIFT 1 -> ly
  fp OR fv -> fw
  1 AND am -> an
  ap LSHIFT 1 -> bj
  u LSHIFT 1 -> ao
  b RSHIFT 5 -> f
  jq AND jw -> jy
  iu RSHIFT 3 -> iw
  ih AND ij -> ik
  NOT iz -> ja
  de OR dk -> dl
  iu OR jf -> jg
  as AND bd -> bf
  b RSHIFT 3 -> e
  jq OR jw -> jx
  iv AND jb -> jd
  cg OR ch -> ci
  iu AND jf -> jh
  lx -> a
  1 AND cc -> cd
  ly OR lz -> ma
  NOT el -> em
  1 AND bh -> bi
  fb AND fd -> fe
  lf OR lq -> lr
  bn RSHIFT 3 -> bp
  bn AND by -> ca
  af AND ah -> ai
  cf LSHIFT 1 -> cz
  dw OR dx -> dy
  gj AND gu -> gw
  jg AND ji -> jj
  jr OR js -> jt
  bl OR bm -> bn
  gj RSHIFT 2 -> gk
  cj OR cp -> cq
  gj OR gu -> gv
  b OR n -> o
  o AND q -> r
  bi LSHIFT 15 -> bm
  dy RSHIFT 1 -> er
  cu AND cw -> cx
  iw OR ix -> iy
  hc OR hd -> he
  0 -> c
  db OR dc -> dd
  kk RSHIFT 2 -> kl
  eq LSHIFT 1 -> fk
  dz OR ef -> eg
  NOT ed -> ee
  lw OR lv -> lx
  fw AND fy -> fz
  dz AND ef -> eh
  jp RSHIFT 3 -> jr
  lg AND lm -> lo
  ci RSHIFT 2 -> cj
  be AND bg -> bh
  lc LSHIFT 1 -> lw
  hm AND ho -> hp
  jr AND js -> ju
  1 AND io -> ip
  cm AND co -> cp
  ib OR ic -> id
  NOT bf -> bg
  fo RSHIFT 5 -> fr
  ip LSHIFT 15 -> it
  jt AND jv -> jw
  jc AND je -> jf
  du OR dt -> dv
  NOT fx -> fy
  aw AND ay -> az
  ge LSHIFT 15 -> gi
  NOT ak -> al
  fm OR fn -> fo
  ff AND fh -> fi
  ci RSHIFT 5 -> cl
  cz OR cy -> da
  NOT ey -> ez
  NOT ju -> jv
  NOT ls -> lt
  kk AND kv -> kx
  NOT ii -> ij
  kl AND kr -> kt
  jk LSHIFT 15 -> jo
  e OR f -> g
  NOT bs -> bt
  hi AND hk -> hl
  hz OR ik -> il
  ek AND em -> en
  ao OR an -> ap
  dv LSHIFT 1 -> ep
  an LSHIFT 15 -> ar
  fo RSHIFT 1 -> gh
  NOT im -> in
  kk RSHIFT 1 -> ld
  hw LSHIFT 1 -> iq
  ec AND ee -> ef
  hb LSHIFT 1 -> hv
  kb AND kd -> ke
  x AND ai -> ak
  dd AND do -> dq
  aq OR ar -> as
  iq OR ip -> ir
  dl AND dn -> do
  iu RSHIFT 5 -> ix
  as OR bd -> be
  NOT go -> gp
  fk OR fj -> fl
  jm LSHIFT 1 -> kg
  NOT cv -> cw
  dp AND dr -> ds
  dt LSHIFT 15 -> dx
  et RSHIFT 1 -> fm
  dy RSHIFT 3 -> ea
  fp AND fv -> fx
  NOT p -> q
  dd RSHIFT 2 -> de
  eu AND fa -> fc
  ba AND bc -> bd
  dh AND dj -> dk
  lr AND lt -> lu
  he RSHIFT 1 -> hx
  ex AND ez -> fa
  df OR dg -> dh
  fj LSHIFT 15 -> fn
  NOT kx -> ky
  gk OR gq -> gr
  dy RSHIFT 2 -> dz
  gh OR gi -> gj
  lj AND ll -> lm
  x OR ai -> aj
  bz AND cb -> cc
  1 AND lu -> lv
  as RSHIFT 3 -> au
  ce OR cd -> cf
  il AND in -> io
  dd RSHIFT 1 -> dw
  NOT lo -> lp
  c LSHIFT 1 -> t
  dd RSHIFT 3 -> df
  dd RSHIFT 5 -> dg
  lh AND li -> lk
  lf RSHIFT 5 -> li
  dy RSHIFT 5 -> eb
  NOT kt -> ku
  at OR az -> ba
  x RSHIFT 3 -> z
  NOT lk -> ll
  lb OR la -> lc
  1 AND r -> s
  lh OR li -> lj
  ln AND lp -> lq
  kk RSHIFT 5 -> kn
  ea OR eb -> ec
  ci AND ct -> cv
  b RSHIFT 2 -> d
  jp RSHIFT 1 -> ki
  NOT cr -> cs
  NOT jd -> je
  jp RSHIFT 2 -> jq
  jn OR jo -> jp
  lf RSHIFT 3 -> lh
  1 AND ds -> dt
  lf AND lq -> ls
  la LSHIFT 15 -> le
  NOT fg -> fh
  at AND az -> bb
  au AND av -> ax
  kw AND ky -> kz
  v OR w -> x
  kk OR kv -> kw
  ks AND ku -> kv
  kh LSHIFT 1 -> lb
  1 AND kz -> la
  NOT kc -> kd
  x RSHIFT 2 -> y
  et OR fe -> ff
  et AND fe -> fg
  NOT ac -> ad
  jl OR jk -> jm
  1 AND jj -> jk
  bn RSHIFT 1 -> cg
  NOT kp -> kq
  ci RSHIFT 3 -> ck
  ev AND ew -> ey
  1 AND ke -> kf
  cj AND cp -> cr
  ir LSHIFT 1 -> jl
  NOT gw -> gx
  as RSHIFT 2 -> at
  iu RSHIFT 1 -> jn
  cy LSHIFT 15 -> dc
  hg OR hh -> hi
  ci RSHIFT 1 -> db
  au OR av -> aw
  km AND kn -> kp
  gj RSHIFT 1 -> hc
  iu RSHIFT 2 -> iv
  ab AND ad -> ae
  da LSHIFT 1 -> du
  NOT bw -> bx
  km OR kn -> ko
  ko AND kq -> kr
  bv AND bx -> by
  kl OR kr -> ks
  1 AND ht -> hu
  df AND dg -> di
  NOT ag -> ah
  d OR j -> k
  d AND j -> l
  b AND n -> p
  gf OR ge -> gg
  gg LSHIFT 1 -> ha
  bn RSHIFT 5 -> bq
  bo OR bu -> bv
  1 AND gy -> gz
  s LSHIFT 15 -> w
  NOT ie -> if
  as RSHIFT 5 -> av
  bo AND bu -> bw
  hz AND ik -> im
  bp AND bq -> bs
  b RSHIFT 1 -> v
  NOT l -> m
  bp OR bq -> br
  g AND i -> j
  br AND bt -> bu
  t OR s -> u
  hz RSHIFT 5 -> ic
  gk AND gq -> gs
  fl LSHIFT 1 -> gf
  he RSHIFT 3 -> hg
  gz LSHIFT 15 -> hd
  hf OR hl -> hm
  1 AND gd -> ge
  fo OR fz -> ga
  id AND if -> ig
  fo AND fz -> gb
  gr AND gt -> gu
  he OR hp -> hq
  fq AND fr -> ft
  ga AND gc -> gd
  fo RSHIFT 2 -> fp
  gl OR gm -> gn
  hg AND hh -> hj
  NOT hn -> ho
  gl AND gm -> go
  he RSHIFT 5 -> hh
  NOT gb -> gc
  hq AND hs -> ht
  hz RSHIFT 3 -> ib
  hz RSHIFT 2 -> ia
  fq OR fr -> fs
  hx OR hy -> hz
  he AND hp -> hr
  gj RSHIFT 5 -> gm
  hf AND hl -> hn
  hv OR hu -> hw
  NOT hj -> hk
  gj RSHIFT 3 -> gl
  fo RSHIFT 3 -> fq
  he RSHIFT 2 -> hf"

  INSTRUCTION_BOOKLET_TEST = "123 -> x
  456 -> y
  x AND y -> d
  x OR y -> e
  x LSHIFT 2 -> f
  y RSHIFT 2 -> g
  NOT x -> h
  NOT y -> i"

  # BITWISE_COMPLEMENT_PATTERN = /NOT\s(?<wire1>[a-z].+?)\s->\s(?<wire2>[a-z].+?)/
  BITWISE_OR_AND_PATTERN = /(?<wire1>[0-9a-z]+)\s[A-Z]+?\s(?<wire2>[a-z]+?)\s.+?(?<to_wire>[a-z]+)/
  BITWISE_SHIFT_PATTERN = /(?<wire1>[a-z]+)\s[A-Z]+?\s(?<shift_by>\d+)\s.+?(?<to_wire>[a-z]+)/
  BITWISE_NOT_PATTERN = /NOT\s(?<wire1>[a-z]+?)\s.+?(?<wire2>[a-z]+)/
  BITWISE_PROVIDE_PATTERN = /(?<signal>[0-9a-z]+?)\s->\s(?<to_wire>[a-z]+)/

  BITWISE_COMMAND_PATTERN = /(?<raw_command>[A-Z]+?)\s/

  attr_reader :wires

  def initialize(wires)
    @wires = wires
  end

  # def perform_all_setters
  #   instructions_ary = INSTRUCTION_BOOKLET.split("\n")

  #   instructions_ary.each do |instruction|
  #     instruction[BITWISE_COMMAND_PATTERN, :raw_command] == nil ? command(instruction) : (puts "Can't set shit for #{instruction[BITWISE_COMMAND_PATTERN, :raw_command]}")
  #   end
  #   wires
  # end

  def perform
    instructions_ary = INSTRUCTION_BOOKLET.split("\n")
    wires_starter_size = 0

    until wires["a"] != nil do
      instructions_ary.each do |instruction|
        command(instruction)
        puts wires if wires.size > wires_starter_size
        if wires.size > wires_starter_size
          instructions_ary.delete(instruction)
          puts "Resolved instruction: #{instruction}"
          wires_starter_size = wires.size
        end
      end
    end
    wires["a"]
  end

  def command(instruction)
    raw_command = instruction[BITWISE_COMMAND_PATTERN, :raw_command]
    puts "Performing #{raw_command}"

    case raw_command
    when "NOT"
      # puts "wire1: #{instruction[BITWISE_NOT_PATTERN, :wire1]}"
      # puts "wire2: #{instruction[BITWISE_NOT_PATTERN, :wire2]}"

      binary_not(instruction[BITWISE_NOT_PATTERN, :wire1],
        instruction[BITWISE_NOT_PATTERN, :wire2]
      )
    when "OR"
      # puts "wire1: #{instruction[BITWISE_OR_AND_PATTERN, :wire1]}"
      # puts "wire2: #{instruction[BITWISE_OR_AND_PATTERN, :wire2]}"
      # puts "to_wire: #{instruction[BITWISE_OR_AND_PATTERN, :to_wire]}"

      bitwise_or(instruction[BITWISE_OR_AND_PATTERN, :wire1],
        instruction[BITWISE_OR_AND_PATTERN, :wire2],
        instruction[BITWISE_OR_AND_PATTERN, :to_wire]
      )
    when "AND"
      # puts "wire1: #{instruction[BITWISE_OR_AND_PATTERN, :wire1]}"
      # puts "wire2: #{instruction[BITWISE_OR_AND_PATTERN, :wire2]}"
      # puts "to_wire: #{instruction[BITWISE_OR_AND_PATTERN, :to_wire]}"

      bitwise_and(instruction[BITWISE_OR_AND_PATTERN, :wire1],
        instruction[BITWISE_OR_AND_PATTERN, :wire2],
        instruction[BITWISE_OR_AND_PATTERN, :to_wire]
      )
    when "RSHIFT"
      bitwise_rshift(instruction[BITWISE_SHIFT_PATTERN, :wire1],
        instruction[BITWISE_SHIFT_PATTERN, :shift_by],
        instruction[BITWISE_SHIFT_PATTERN, :to_wire]
      )
    when "LSHIFT"
      bitwise_lshift(instruction[BITWISE_SHIFT_PATTERN, :wire1],
        instruction[BITWISE_SHIFT_PATTERN, :shift_by],
        instruction[BITWISE_SHIFT_PATTERN, :to_wire]
      )
    when nil #assign vlaue to wire
      # puts "the instructions are: #{instruction}"
      provide(instruction[BITWISE_PROVIDE_PATTERN, :signal],
        instruction[BITWISE_PROVIDE_PATTERN, :to_wire]
      )
    end
  end

  def provide(signal, to_wire)
    # return unless signal.scan(/\d/).any? || !wires[signal].nil?

    if signal.scan(/\d/).any?
      wires[to_wire] = signal.to_i
    elsif !wires[signal].nil?
      wires[to_wire] = wires[signal]
    end
  end

  def bitwise_and(wire1, wire2, to_wire)
    return unless (wire1.scan(/\d/).any? || wires[wire1]) && !wires[wire2].nil?

    if wire1.scan(/\d/).any?
      wires[to_wire]= wire1.scan(/\d/).first.to_i & wires[wire2].to_i
    else
      wires[to_wire] = wires[wire1].to_i & wires[wire2].to_i
    end
  end

  def bitwise_or(wire1, wire2, to_wire)
    return if wires[wire1].nil? || wires[wire2].nil?
    wires[to_wire] = wires[wire1].to_i | wires[wire2].to_i
  end

  def bitwise_lshift(wire1, shift_by, wire2)
    return if wires[wire1].nil?
    wires[wire2] = wires[wire1].to_i << shift_by.to_i
  end

  def bitwise_rshift(wire1, shift_by, wire2)
    return if wires[wire1].nil?
    wires[wire2] =wires[wire1].to_i >> shift_by.to_i
  end

  def binary_not(wire1, wire2)
    return if wires[wire1].nil?
    wires[wire2] = 65535 - wires[wire1].to_i
  end
end

puts SantaBitwiseGame.new({}).perform

((db OR dc) AND do) -> dr

  lx -> a
