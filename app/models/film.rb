class Film < ApplicationRecord  
    validates :title, presence: { message: "タイトルを入力してください" }
    validates :story, presence: { message: "あらすじを入力してください" }
    validates :filmdirector, presence: { message: "監督を入力してください" }
    validates :origin, presence: { message: "原作を入力してください" }
    validates :releasedate, presence: { message: "公開日を入力してください" }
    validates :country, presence: { message: "国を入力してください" }
    validates :starring, presence: { message: "主演を入力してください" }
    belongs_to :user 
    belongs_to :genre
end
