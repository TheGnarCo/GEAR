class AssetsController < AuthenticatedController
  def index
    @assets = Asset.all.includes(:user)
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
    puts "hello"
  end

  def BadNameOfMethod
    puts "Ain't I a stinker"
  end
end
