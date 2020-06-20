# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
<<<<<<< HEAD
require 'pg'

# control memo
class Memo
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.memos_count
    Dir.open('./public/memos').children.count
  end

  def memo_content
    File.open("./public/memos/#{number}.txt").read
  end

  def content_write(content)
    File.open("./public/memos/#{number}.txt", 'wb') do |f|
      f.write(content)
    end
  end

  def delete
    File.delete("./public/memos/#{number}.txt")
  end
end
=======
>>>>>>> add_DB

get '/new_memo' do
  erb :new_memo
end

post '/new' do
  content = params[:content]
<<<<<<< HEAD
  Memo.new(Memo.memos_count + 1).content_write(content)
=======
  number = Dir.open('./public/memos').children.count
  File.open("./public/memos/#{number + 1}.txt", 'wb') do |f|
    f.write(content)
  end
>>>>>>> add_DB
  redirect '/'
end

get '/' do
<<<<<<< HEAD
  @number = Memo.memos_count
=======
  @number = Dir.open('./public/memos').children.count
>>>>>>> add_DB
  erb :top
end

get '/edition/:i' do
  @number = params[:i]
<<<<<<< HEAD
  @file_content = Memo.new(@number).memo_content
=======
  @file_content = File.open("./public/memos/#{@number}.txt").read
>>>>>>> add_DB
  erb :edition
end

patch '/memo/:i' do
  number = params[:i]
  content = params[:content]
<<<<<<< HEAD
  Memo.new(number).content_write(content)
=======
  File.open("./public/memos/#{number}.txt", 'wb') do |f|
    f.write(content)
  end
>>>>>>> add_DB
  redirect '/'
end

get '/memo/:i' do
  @number = params[:i]
<<<<<<< HEAD
  @file_content = Memo.new(@number).memo_content
=======
  @file_content = File.open("./public/memos/#{@number}.txt").read
>>>>>>> add_DB
  erb :memo
end

delete '/memo/:id' do
  number = params[:id]
<<<<<<< HEAD
  Memo.new(number).delete
=======
  File.delete("./public/memos/#{number}.txt")
>>>>>>> add_DB
  redirect '/'
end
