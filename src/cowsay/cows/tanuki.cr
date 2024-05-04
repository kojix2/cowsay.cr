require "../abstract_cow"

module Cowsay
  class Tanuki < AbstractCow
    def render_cow
      <<-COW
      #{@thoughts}     __,-─-､__
       #{@thoughts}     〆-─-ヽ)
           （ ´#{@eyes[0]} ω #{@eyes[1]}`）
           /   ,r---､ヽ
          し  |   x  ) J
          _.'､ ヽ   ノ 人
         (__,ノU  U   (酒)
COW
    end
  end
end
