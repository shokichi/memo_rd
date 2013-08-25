##############################
# Ruby on Rails 
# 練習問題
##############################

= 練習編:アプリケーションの開発
== ステップ1:商品管理アプリケーションの作成
=== Rails アプリケーションの作成
 $ rails new depot
 
=== scaffold(足場)の作成
 $ cd depot
 $ rails generate scaffold Product title:string description:text \
   image_url:string price:decimal

=== マイグレーションの適用
* マイグレーション
マイグレーションはデータベースに適用する変更を表すものである. 
これはデータベースの種類に依存しない表現でソースファイルに記述
される. マイグレーションを適用すればデータベースが更新される. 

* (例) price の定義を修正する場合
depot/db/migrate/20130108101654_create_products.rb を修正する. 

 class CreateProducts < ActiveRecord::Migration
   def change
     create_table :products do |t|
       t.string :title
       t.text :description
       t.string :image_url
       t.decimal :price, precision: 8, scale: 2
                       # 有効数字8桁, 小数点以下2桁に変更 
 
       t.timestamps
     end
   end
 end

上の修正を適用
 $ rake db:migrate

サーバーを起動
 $ rails s 

http:0.0.3000/productsにアクセスする

ユニットテスト
 $ rake test

== ステップ2:美しく!!
=== シードデータのインポート機能
* データの初期化をおこなう
db/seeds.rb を編集

 Product.create(title: 'Rails test',
   description:" English only. ",
   image_url:'ruby.jpg',
   price: 3200)

日本語を使う場合は先頭行に以下の文言を追加
 # -*- coding: utf-8 -*-

Productsテーブルにデータを流し込む
 $ rake db:seed

=== CSSの利用
CSSの定義は /app/assets/stylesheets/products.css.scssに記述する. 
*.scssファイルはSassyCSSによって前処理されCSSに変換される. 

次にスタイルシートで使われているproductsクラスを定義する. 
クラスの定義はapp/views/layouts/application.html.erbに記述する. 

app/views/products/index.html.erbを編集する

 <h1>Listing products</h1>
 
 <table>
 <% @products.each do |product| %>
   <tr class="<%= cycle('list_line_odd', 'list_line_even') %>">
 
     <td>
       <%= image_tag(product.image_url, class: 'list_image') %>
     </td>
 
     <td class="list_description">
       <dl>
         <dt><%= product.title %></dt>
         <dd><%= truncate(strip_tags(product.description),
                length: 80) %></dd>
       </dl>
     </td>
 
     <td class="list_actions">
       <%= link_to 'Show', product %><br/>
       <%= link_to 'Edit', edit_product_path(product) %><br/>
       <%= link_to 'Destroy', product, 
                   confirm: 'Are you sure?',
                   method: :delete %>
     </td>
   </tr>
 <% end %>
 </table>
 
 <br />
 
 <%= link_to 'New product', new_product_path %>

== ステップ3: カタログの表示
=== カタログリストの作成
 $ rails generate controller Store index

http://0.0.3000/store/index をWebサイトのrootのURLとして設定する. 
config/routes.rbを編集
 # You can have the root of your site routed with "root"
 # just remember to delete public/index.html.
 root :to => 'store#index', as: 'store'

public/index.htmlを削除
 $ rm public/index.html

コントローラ(app/controllers/store_controller.rb)を編集
 class StoreController < ApplicationController
   def index
     @products = Product.order(:title)
   end
 end

view(app/views/store/index.html.erb)を編集
 <% if notice %>
   <p id="notice"><%= notice %> </p>
 <% end %>

 <h1>カタログ</h1>

 <% @products.each do |product| %>
   <div class="entry">
     <%= image_tag(product.image_url) %>
     <h3><%= product.title %></h3>
     <div class="price_line">
       <span class="price"><%= product.price %></span>
     </div>
   </div>
 <% end %>

CSSを定義

== 参考資料
* RailsによるアジャイルWebアプリケーション開発 第4版
