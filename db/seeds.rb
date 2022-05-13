require 'securerandom'

#master_user
User.create!(
    id: 0,
    name: "master",
    password: "master",
    password_confirmation: "master"
     )


#test_user
5.times do |n|
    User.create!(
      id: "#{n + 1}",
      name: "テスト太郎子#{n + 1}",
      password: "#{(n + 1) * 111111}",
      password_confirmation: "#{(n + 1) * 111111}"
      )
  end

  connection = ActiveRecord::Base.connection();
  connection.execute("select setval('users_id_seq',(select max(id) from users))")


#test_recipe
5.times do |n|
    recipe = Recipe.create!(      
        id: "#{n}",
        name: "テストレシピ#{n + 1}",
        summary: "テストレシピ#{n + 1}の作り方です。",
       cooktime: "00分#{(n + 1) * 5}秒"
       )
    recipe_name = "app/assets/images/" + "#{n + 1}" + ".png"
    recipe.portrait.attach(io: File.open(Rails.root.join(recipe_name)),
    filename: 'test.png')
    end

#example_recipe
recipe = Recipe.create!(      
    id: "11",
    name: "チキンポテトバーグ",
    summary: "少ない肉でもボリューム満点になるアイデアに、感激の声が集まっています！味付けをいろいろ変えて楽しむのもGood✨",
    cooktime: "25分00秒"
   )
   recipe.portrait.attach(io: File.open(Rails.root.join('app/assets/images/tori_jaga_han.png')),
   filename: 'tori_jaga_han.png')

recipe = Recipe.create!(      
    id: "12",
    name: "鶏むね肉の照り焼き",
    summary: "お財布に優しい！ムネ肉のあっさり照り焼き。",
    cooktime: "25分00秒"
   )
   recipe.portrait.attach(io: File.open(Rails.root.join('app/assets/images/teriyaki_tori.png')),
   filename: 'teriyaki_tori.png')

recipe = Recipe.create!(      
    id: "13",
    name: "厚揚げモヤシ炒め",
    summary: "お財布に優しい！厚揚げとモヤシの炒め物です。",
    cooktime: "20分00秒"
   )
   recipe.portrait.attach(io: File.open(Rails.root.join('app/assets/images/moyashi.png')),
   filename: 'moyashi.png')

recipe = Recipe.create!(
    id: "14",
    name: "豆腐とひき肉とオートミールのハンバーガー",
    summary: "ひき肉とオートミールと豆腐を混ぜたハンバーガー。",
    cooktime: "18分30秒"
   )
   recipe.portrait.attach(io: File.open(Rails.root.join('app/assets/images/hanba-ga-.png')),
   filename: 'hanba-ga-.png')

recipe = Recipe.create!(
    id: "15",
    name: "白だしで出来る！だし巻き卵",
    summary: "おかずやおつまみに大活躍♪まろやかな卵の中に含まれた、だしの風味でほっと落ち着く、やさしい味わいのだし巻き卵です。",
    cooktime: "10分00秒"
   )
   recipe.portrait.attach(io: File.open(Rails.root.join('app/assets/images/tamago.png')),
   filename: 'tamago.png')

#test_recipe_user
5.times do |n|
    userA = User.find("#{n}")
    recipeA = Recipe.find("#{n}")
    userA.recipes << recipeA
  end

#master_recipe_user
5.times do |n|
    userA = User.find(0)
    recipeA = Recipe.find("#{n}")
    userA.recipes << recipeA
  end

  5.times do |n|
    userA = User.find(0)
    recipeA = Recipe.find("#{n + 11}")
    userA.recipes << recipeA
  end

#test_task
5.times do |n|
    Task.create!(      
        id: "#{n}",
        name: "テスト#{n + 1}",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "テストレシピ#{n + 1}の完成です",
        start_time: "0",
        task_time: "#{(n + 1) * 5}",
        recipe_id: "#{n}"
       )
    end

#master_task
#example_recipe

#id: "11",
#name: "チキンポテトバーグ",
#cooktime: "00時間25分00秒"

    Task.create!(      
        id: "11",
        name: "混ぜる",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "調味料と鶏肉をボールに入れよく混ぜる　材料：鶏ムネひき肉 100g 酒 大さじ1/2 醤油 大さじ1/2",
        start_time: "0",
        task_time: "60",
        recipe_id: "11"
       )

       Task.create!(      
        id: "12",
        name: "千切り",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "じゃがいもは皮をむき千切りにする　材料：じゃがいも 2個",
        start_time: "60",
        task_time: "480",
        recipe_id: "11"
       )

       Task.create!(      
        id: "13",
        name: "混ぜる",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "ボールに千切りにしたじゃがいも、ハーブソルトと片栗粉を入れ混ぜる　材料：ハーブソルト 5振りくらい 片栗粉 大さじ1",
        start_time: "540",
        task_time: "180",
        recipe_id: "11"
       )

       Task.create!(      
        id: "14",
        name: "加熱する",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "フライパンに1cm弱ぐらい油を入れ熱する　材料： 油 適量",
        start_time: "720",
        task_time: "60",
        recipe_id: "11"
       )
    
       Task.create!(      
        id: "15",
        name: "落とす",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "スプーンでボールから具を掬い、丸い感じに落としていく。フライパンに入れた後上を潰すこと",
        start_time: "780",
        task_time: "720",
        recipe_id: "11"
       )
    
       Task.create!(      
        id: "16",
        name: "完成",
        color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
        memo: "両面美味しそうなキツネ色に揚げ焼きして完成☆　参照元：https://cookpad.com/recipe/3135955",
        start_time: "900",
        task_time: "600",
        recipe_id: "11"
       )
    
#id: "12"
#name: "鶏むね肉の照り焼き"
#cooktime: "00時間25分00秒"

Task.create!(      
    id: "21",
    name: "切る",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "胸肉は皮を取り半分に開き2㎝幅位の棒状に切る　材料：鶏むね肉 300g",
    start_time: "0",
    task_time: "480",
    recipe_id: "12"
   )

   Task.create!(      
    id: "22",
    name: "片栗粉",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "切った胸肉に軽く塩を振り片栗粉を振っておく　材料：塩 適量 片栗粉 大さじ2",
    start_time: "480",
    task_time: "60",
    recipe_id: "12"
   )

   Task.create!(      
    id: "23",
    name: "焼く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "フライパンにサラダ油を入れ胸肉を並べて、中火の弱火で両面軽く焼く　材料：サラダ油 大さじ2 焦げ目はつけないこと",
    start_time: "540",
    task_time: "300",
    recipe_id: "12"
   )

   Task.create!(      
    id: "24",
    name: "加熱する",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "合わせ調味料を入れ強火にし沸騰させたら中火の弱火にする　材料：水 大さじ4 砂糖 大さじ1半 醤油 大さじ3+小さじ1 料理酒 大さじ2 みりん 大さじ1半",
    start_time: "840",
    task_time: "180",
    recipe_id: "12"
   )

   Task.create!(      
    id: "25",
    name: "蒸焼き",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "鶏肉を裏返してから蓋をして、蒸し焼きにする",
    start_time: "1120",
    task_time: "240",
    recipe_id: "12"
   )

   Task.create!(      
    id: "26",
    name: "並べる",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "器にレタスを敷き、ムネ肉の照り焼きを並べる　材料：レタス 3枚",
    start_time: "1260",
    task_time: "120",
    recipe_id: "12"
   )

   Task.create!(      
    id: "27",
    name: "完成",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "残ったタレを少し煮詰め、上からかけて完成　参考元：https://cookpad.com/recipe/7191318",
    start_time: "1380",
    task_time: "120",
    recipe_id: "12"
   )

#id: "13"
#name: "厚揚げモヤシ炒め"
#cooktime: "00時間20分00秒"

Task.create!(
    id: "31",
    name: "切る",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "厚揚げを2〜3cm大に切ります　材料：厚揚げ 1枚 油 大さじ1",
    start_time: "0",
    task_time: "120",
    recipe_id: "13"
   )

   Task.create!(
    id: "32",
    name: "炒める",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "切った厚揚げを油で炒めます　材料：油 大さじ1 油の種類は何でも結構",
    start_time: "120",
    task_time: "300",
    recipe_id: "13"
   )

   Task.create!(
    id: "33",
    name: "蒸焼き",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "モヤシと差し水を追加して蒸し焼きにします　材料：モヤシ 1袋 水 50cc",
    start_time: "420",
    task_time: "300",
    recipe_id: "13"
   )

   Task.create!(
    id: "34",
    name: "調味料",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "待ち時間に味噌、豆板醤、酒をあわせておきます　材料：味噌 大さじ1 豆板醤 大さじ1 酒 大さじ1",
    start_time: "430",
    task_time: "60",
    recipe_id: "13"
   )

   Task.create!(
    id: "35",
    name: "加熱する",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "モヤシがしんなりしたら合わせダレを回しかけて、さらに加熱します",
    start_time: "720",
    task_time: "300",
    recipe_id: "13"
   )

   Task.create!(
    id: "36",
    name: "完成",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "タッパーに移してお好みの温度まで冷まして、完成　参考元：https://cookpad.com/recipe/7193692",
    start_time: "1020",
    task_time: "180",
    recipe_id: "13"
   )

#id: "14"
#name: "豆腐とひき肉とオートミールのハンバーガー"
#cooktime: "00時間25分30秒"

Task.create!(
    id: "41",
    name: "水切り",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "豆腐は3個パックで売ってるのをつかいました。よーく水切りしてください。　材料：豆腐(木綿) 130gくらい",
    start_time: "0",
    task_time: "120",
    recipe_id: "14"
   )

   Task.create!(
    id: "42",
    name: "レンチン",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "豆腐にオートミールを加えてよく混ぜて、レンチン1分。よくさましてください。　材料：オートミール 大さじ2",
    start_time: "120",
    task_time: "750",
    recipe_id: "14"
   )

   Task.create!(
    id: "43",
    name: "混ぜる",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "さめたらひき肉と混ぜ合わせます。ここで、しょうが、塩、胡椒、酒を入れて混ぜ、まんまるくボール状にします。　材料：合い挽き肉 80g前後 しょうが(すりおろし) 小さじ1 塩 小さじ1/2 粗挽き黒胡椒 少々 酒 小さじ1/2",
    start_time: "870",
    task_time: "210",
    recipe_id: "14"
   )

   Task.create!(
    id: "44",
    name: "焼く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "オリーブオイル（またはサラダ油）を少々いれます。熱くなったフライパンに乗せ、すぐ上からフライ返しで押さえます。　材料：オリーブオイル(サラダ油) 少々 焼いている間にでた油はキッチンペーパーなどでとってください。",
    start_time: "720",
    task_time: "240",
    recipe_id: "14"
   )

   Task.create!(
    id: "45",
    name: "返す",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "ひっくり返して焼いてください。",
    start_time: "960",
    task_time: "120",
    recipe_id: "14"
   )

   Task.create!(
    id: "46",
    name: "トースト",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "焼いてる間にパンを軽くトーストしてバターを塗る。　材料：バンズまたは食パン 2人分 バター 少々",
    start_time: "780",
    task_time: "180",
    recipe_id: "14"
   )

   Task.create!(
    id: "47",
    name: "完成",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "パンにレタスを敷いて、その上にハンバーグ、ケチャップ、ソース、タバスコ（お好みで）をのせて、完成！　材料：ケチャップ 大さじ2杯前後 ソース 大さじ1 タバスコ 少々 参照元：https://cookpad.com/recipe/7191867",
    start_time: "960",
    task_time: "150",
    recipe_id: "14"
   )

#id: "15"
#name: "白だしで出来る！だし巻き卵"
#cooktime: "00時間10分00秒"

Task.create!(
    id: "51",
    name: "溶く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "ボウルに卵を割り入れて溶きほぐす。　材料：卵 3個",
    start_time: "0",
    task_time: "60",
    recipe_id: "15"
   )

   Task.create!(
    id: "52",
    name: "濾す",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "調味料を加えて混ぜ合わせ、ざるで濾す。　材料：ヤマキ「割烹白だし」 小さじ2 水 大さじ2",
    start_time: "60",
    task_time: "60",
    recipe_id: "15"
   )

   Task.create!(
    id: "53",
    name: "焼く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "卵焼き器にサラダ油を熱し、卵液を少量流し入れる",
    start_time: "120",
    task_time: "30",
    recipe_id: "15"
   )

   Task.create!(
    id: "54",
    name: "巻く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "半熟状態になったら手前に巻き、奥にずらす",
    start_time: "122",
    task_time: "30",
    recipe_id: "15"
   )

   Task.create!(
    id: "55",
    name: "持ち上げ",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "油を足して再び卵液を少量流し入れ、巻いた卵を持ち上げる",
    start_time: "135",
    task_time: "60",
    recipe_id: "15"
   )

   Task.create!(
    id: "56",
    name: "巻く",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "下に卵液を流し、手前に巻き込む",
    start_time: "145",
    task_time: "120",
    recipe_id: "15"
   )

   Task.create!(
    id: "57",
    name: "繰り返す",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "油を足して再び卵液を少量流し入れ、巻いた卵を持ち上げて下に卵液を流し、手前に巻き込む。",
    start_time: "150",
    task_time: "420",
    recipe_id: "15"
   )

   Task.create!(
    id: "58",
    name: "完成",
    color: "#" + SecureRandom.hex(16).to_s.slice(0..5),
    memo: "焼きあげて、完成　 参照元：https://cookpad.com/recipe/7164792",
    start_time: "570",
    task_time: "30",
    recipe_id: "15"
   )

   