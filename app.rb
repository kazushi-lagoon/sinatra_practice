# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
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

get '/new_memo' do
  erb :new_memo
end

post '/new' do
  content = params[:content]
  Memo.new(Memo.memos_count + 1).content_write(content)
  redirect '/'
end

get '/' do
  @number = Memo.memos_count
  erb :top
end

get '/edition/:i' do
  @number = params[:i]
  @file_content = Memo.new(@number).memo_content
  erb :edition
end

patch '/memo/:i' do
  number = params[:i]
  content = params[:content]
  Memo.new(number).content_write(content)
  redirect '/'
end

get '/memo/:i' do
  @number = params[:i]
  @file_content = Memo.new(@number).memo_content
  erb :memo
end

delete '/memo/:id' do
  number = params[:id]
  Memo.new(number).delete
  redirect '/'
end
