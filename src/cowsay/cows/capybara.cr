require "../abstract_cow"

module Cowsay
  class Capybara < AbstractCow
    def set_mouth!
      if @tongue.strip.empty?
        @tongue = "亠"
      end
    end

    def space_eyes
      @eyes = "●●" if @mode == "default"
      "#{@eyes[0]}    #{@eyes[0]}"
    end

    def render_cow
      set_mouth!
      <<-COW
    #{@thoughts}
     #{@thoughts}

　　　　　/)─―ヘ/)
　　　＿／　　　　＼
　 ／　　　  #{space_eyes}丶
　｜　　　　　　　▼　|
　｜　　　　　　　#{@tongue}ノ
  U￣U￣￣￣￣U￣
COW
    end
  end
end
