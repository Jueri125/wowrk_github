<h1>ジャンル一覧・追加</h1>

<%= form_for @genre do |form| %>
  <div class="field">
  　<h4>ジャンル名</h4>
    <%= form.text_field :name, required: true %>
  </div>
  <div class="actions">
    <%= form.submit '新規登録' %>
  </div>
<% end %>

<h2>ジャンル</h2>
<% @genres.each do |genres| %>
  <div>
    <p>
    　<%= genres %><%= link_to '編集', edit_genre_path(genre) %>
    </p>

  </div>
<% end %>
