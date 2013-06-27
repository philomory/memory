class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    load_sprite_sheet
    handle_touches

    @grid = Grid.new(sprite_batch: @sprite_batch)
  end

  def load_sprite_sheet
    Joybox::Core::SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = Joybox::Core::SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch
  end

  def handle_touches
    on_touches_ended do |touches, event|
      touch = touches.any_object
      puts [touch.location.x, touch.location.y].inspect
    end
  end
end