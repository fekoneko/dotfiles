#!/bin/sh
# shellcheck disable=SC2317,SC1089

pidof wofi && exit 0

emoji="$(sed '1,/^### DATA ###$/d' "$0" \
  | wofi --show dmenu --prompt 'Emojis' \
  | cut -d ' ' -f 1 \
  | tr -d '\n')"

if [ -n "$emoji" ]; then
  wl-copy "$emoji"
fi

exit

### DATA ###
😀 grinning face smile happy joy :D grin
😃 grinning face with big eyes happy joy haha :D :) smile funny
😄 grinning face with smiling eyes happy joy funny haha laugh like :D
😁 beaming face with smiling eyes happy smile joy kawaii
😆 grinning squinting face happy joy lol satisfied haha glad XD laugh
😅 grinning face with sweat hot happy laugh smile relief
🤣 rolling on the floor laughing face lol haha rofl
😂 face with tears of joy cry weep happy happytears haha
🙂 slightly smiling face smile
🙃 upside down face flipped silly smile
😉 winking face happy mischievous secret ;) smile eye
😊 smiling face with eyes smile happy flushed crush embarrassed shy
😇 smiling face with halo angel heaven
🥰 smiling face with hearts love like affection valentines infatuation
😍 smiling face with heart eyes love like affection valentines
🤩 star struck face smile starry eyes grinning
😘 face blowing a kiss love like affection valentines infatuation
😗 kissing face love like 3 valentines infatuation kiss
☺️ smiling face blush massage happiness
😚 kissing face with closed eyes love like affection valentines
😙 kissing face with smiling eyes affection valentines infatuation
😋 face savoring food happy joy tongue smile silly yummy nom delicious
😛 face with tongue prank childish playful mischievous smile
😜 winking face with tongue prank childish playful mischievous smile
🤪 zany face goofy crazy
😝 squinting face with tongue prank playful mischievous smile
🤑 money mouth face rich dollar
🤗 hugging face smile hug
🤭 face with hand over mouth whoops shock surprise
🤫 shushing face quiet shhh
🤔 thinking face hmmm think consider
🤐 zipper mouth face sealed secret
🤨 face with raised eyebrow distrust scepticism disapproval disbelief
😐 neutral face indifference meh :|
😑 expressionless face indifferent - meh deadpan
😶 face without mouth hellokitty
😏 smirking face smile mean prank smug sarcasm
😒 unamused face indifference bored straight serious sarcasm
🙄 face with rolling eyes eyeroll frustrated
😬 grimacing face grimace teeth
🤥 lying face lie pinocchio
😌 relieved face relaxed phew massage happiness
😔 pensive face sad depressed upset
😪 sleepy face tired rest nap
🤤 drooling face
😴 sleeping face tired sleepy night zzz
😷 face with medical mask sick ill disease
🤒 face with thermometer sick temperature cold fever
🤕 face with head bandage injured clumsy hurt
🤢 nauseated face vomit gross green sick throw up ill
🤮 face vomiting sick
🤧 sneezing face gesundheit sneeze sick allergy
🥵 hot face feverish heat red sweating
🥶 cold face blue freezing frozen frostbite icicles
🥴 woozy face dizzy intoxicated tipsy wavy
😵 dizzy face spent unconscious xox
🤯 exploding head face shocked mind blown
🤠 cowboy hat face cowgirl
🥳 partying face celebration woohoo
😎 smiling face with sunglasses cool smile summer beach sunglass
🤓 nerd face nerdy geek dork
🧐 face with monocle stuffy wealthy
😕 confused face indifference huh weird hmmm :/
😟 worried face concern nervous :(
🙁 slightly frowning face disappointed sad upset
☹️ frowning face sad upset frown
😮 face with open mouth surprise impressed wow whoa :O
😯 hushed face woo shh
😲 astonished face xox surprised poisoned
😳 flushed face blush shy flattered
🥺 pleading face begging mercy
😦 frowning face with open mouth aw what
😧 anguished face stunned nervous
😨 fearful face scared terrified nervous oops huh
😰 anxious face with sweat nervous
😥 sad but relieved face phew sweat nervous
😢 crying face tears sad depressed upset :'(
😭 loudly crying face cry tears sad upset depressed
😱 face screaming in fear munch scared omg
😖 confounded face confused sick unwell oops :S
😣 persevering face sick no upset oops
😞 disappointed face sad upset depressed :(
😓 downcast face with sweat hot sad tired exercise
😩 weary face tired sleepy sad frustrated upset
😫 tired face sick whine upset frustrated
🥱 yawning face tired sleepy
😤 face with steam from nose gas phew proud pride
😡 pouting face angry mad hate despise
😠 angry face mad annoyed frustrated
🤬 face with symbols on mouth swearing cursing cussing profanity
😈 smiling face with horns devil
👿 angry face with horns devil
💀 skull dead skeleton creepy death
☠️ skull and crossbones poison danger deadly scary death pirate evil
💩 pile of poo hankey shitface fail turd shit
🤡 clown face
👹 ogre monster red mask halloween scary creepy devil demon japanese
👺 goblin red evil mask monster scary creepy japanese
👻 ghost halloween spooky scary
👽 alien UFO paul weird outer space
👾 alien monster game arcade play
🤖 robot computer machine bot
😺 grinning cat animal cats happy smile
😸 grinning cat with smiling eyes animal cats smile
😹 cat with tears of joy animal cats haha happy
😻 smiling cat with heart eyes animal love like affection cats
😼 cat with wry smile animal cats smirk
😽 kissing cat animal cats kiss
🙀 weary cat animal cats munch scared scream
😿 crying cat animal tears weep sad cats upset cry
😾 pouting cat animal cats
🙈 see no evil monkey animal nature haha
🙉 hear no evil monkey animal nature
🙊 speak no evil monkey animal nature omg
💋 kiss mark face lips love like affection valentines
💌 love letter email like affection envelope valentines
💘 heart with arrow love like affection valentines
💝 heart with ribbon love valentines
💖 sparkling heart love like affection valentines
💗 growing heart like love affection valentines pink
💓 beating heart love like affection valentines pink
💞 revolving hearts love like affection valentines
💕 two hearts love like affection valentines heart
💟 heart decoration purple-square love like
❣️ heart exclamation decoration love
💔 broken heart sad sorry break heartbreak
❤️ red heart love like valentines
🧡 orange heart love like affection valentines
💛 yellow heart love like affection valentines
💚 green heart love like affection valentines
💙 blue heart love like affection valentines
💜 purple heart love like affection valentines
🤎 brown heart coffee
🖤 black heart evil
🤍 white heart pure
💯 hundred points score perfect numbers century exam quiz test pass
💢 anger symbol angry mad
💥 collision bomb explode explosion blown
💫 dizzy star sparkle shoot magic
💦 sweat droplets water drip oops
💨 dashing away wind air fast shoo fart smoke puff
🕳️ hole embarrassing
💣 bomb boom explode explosion terrorism
💬 speech balloon bubble words message talk chatting
👁️‍🗨️ eye in speech bubble info
🗨️ left speech bubble words message talk chatting
🗯️ right anger bubble caption speech thinking mad
💭 thought balloon bubble cloud speech thinking dream
💤 zzz sleepy tired dream
👋 waving hand hands gesture goodbye solong farewell hello hi palm
🤚 raised back of hand fingers backhand
🖐️ hand with fingers splayed palm
✋ raised hand fingers stop highfive palm ban
🖖 vulcan salute hand fingers spock star trek
👌 ok hand fingers limbs perfect okay
🤏 pinching hand tiny small size
✌️ victory hand fingers ohyeah peace two
🤞 crossed fingers good lucky
🤟 love you gesture hand fingers
🤘 sign of the horns hand fingers evil eye rock on
🤙 call me hand hands gesture shaka
👈 backhand index pointing left direction fingers hand
👉 backhand index pointing right fingers hand direction
👆 backhand index pointing up fingers hand direction
🖕 middle finger hand fingers rude flipping
👇 backhand index pointing down fingers hand direction
☝️ index pointing up hand fingers direction
👍 thumbs up thumbsup yes awesome good agree accept cool hand like +1
👎 thumbs down thumbsdown no dislike hand -1
✊ raised fist fingers hand grasp
👊 oncoming fist angry violence hit attack hand
🤛 left facing fist hand fistbump
🤜 right facing fist hand fistbump
👏 clapping hands praise applause congrats yay
🙌 raising hands gesture hooray yea celebration
👐 open hands fingers butterfly
🤲 palms up together hands gesture cupped prayer
🤝 handshake agreement shake
🙏 folded hands please hope wish namaste highfive pray
✍️ writing hand lower left ballpoint pen stationery write compose
💅 nail polish beauty manicure finger fashion
🤳 selfie camera phone
💪 flexed biceps arm flex hand summer strong
🦾 mechanical arm accessibility
🦿 mechanical leg accessibility
🦵 leg kick limb
🦶 foot kick stomp
👂 ear face hear sound listen
🦻 ear with hearing aid accessibility
👃 nose smell sniff
🧠 brain smart intelligent
🦷 tooth teeth dentist
🦴 bone skeleton
👀 eyes look watch stalk peek see
👁️ eye face look see watch stare
👅 tongue mouth playful
👄 mouth kiss
👶 baby child boy girl toddler
🧒 child gender-neutral young
👦 boy man male guy teenager
👧 girl female woman teenager
🧑 person gender-neutral
👱 person blond hair hairstyle
👨 man mustache father dad guy classy sir moustache
🧔 man beard person bewhiskered
👨‍🦰 man red hair hairstyle
👨‍🦱 man curly hair hairstyle
👨‍🦳 man white hair old elder
👨‍🦲 man bald hairless
👩 woman female girls lady
👩‍🦰 woman red hair hairstyle
🧑‍🦰 person red hair hairstyle
👩‍🦱 woman curly hair hairstyle
🧑‍🦱 person curly hair hairstyle
👩‍🦳 woman white hair old elder
🧑‍🦳 person white hair elder old
👩‍🦲 woman bald hairless
🧑‍🦲 person bald hairless
👱‍♀️ woman blond hair female girl blonde person
👱‍♂️ man blond hair male boy blonde guy person
🧓 older person human elder senior gender-neutral
👴 old man human male men elder senior
👵 old woman human female women lady elder senior
🙍 person frowning worried
🙍‍♂️ man frowning male boy sad depressed discouraged unhappy
🙍‍♀️ woman frowning female girl sad depressed discouraged unhappy
🙎 person pouting upset
🙎‍♂️ man pouting male boy
🙎‍♀️ woman pouting female girl
🙅 person gesturing no decline
🙅‍♂️ man gesturing no male boy nope
🙅‍♀️ woman gesturing no female girl nope
🙆 person gesturing ok agree
🙆‍♂️ man gesturing ok men boy male blue human
🙆‍♀️ woman gesturing ok women girl female pink human
💁 person tipping hand information
💁‍♂️ man tipping hand male boy human information
💁‍♀️ woman tipping hand female girl human information
🙋 person raising hand question
🙋‍♂️ man raising hand male boy
🙋‍♀️ woman raising hand female girl
🧏 deaf person accessibility
🧏‍♂️ deaf man accessibility
🧏‍♀️ deaf woman accessibility
🙇 person bowing respectiful
🙇‍♂️ man bowing male boy
🙇‍♀️ woman bowing female girl
🤦 person facepalming disappointed
🤦‍♂️ man facepalming male boy disbelief
🤦‍♀️ woman facepalming female girl disbelief
🤷 person shrugging regardless
🤷‍♂️ man shrugging male boy confused indifferent doubt
🤷‍♀️ woman shrugging female girl confused indifferent doubt
🧑‍⚕️ health worker hospital
👨‍⚕️ man health worker doctor nurse therapist healthcare human
👩‍⚕️ woman health worker doctor nurse therapist healthcare human
🧑‍🎓 student learn
👨‍🎓 man student graduate human
👩‍🎓 woman student graduate human
🧑‍🏫 teacher professor
👨‍🏫 man teacher instructor professor human
👩‍🏫 woman teacher instructor professor human
🧑‍⚖️ judge law
👨‍⚖️ man judge justice court human
👩‍⚖️ woman judge justice court human
🧑‍🌾 farmer crops
👨‍🌾 man farmer rancher gardener human
👩‍🌾 woman farmer rancher gardener human
🧑‍🍳 cook food kitchen culinary
👨‍🍳 man cook chef human
👩‍🍳 woman cook chef human
🧑‍🔧 mechanic worker technician
👨‍🔧 man mechanic plumber human wrench
👩‍🔧 woman mechanic plumber human wrench
🧑‍🏭 factory worker labor
👨‍🏭 man factory worker assembly industrial human
👩‍🏭 woman factory worker assembly industrial human
🧑‍💼 office worker business
👨‍💼 man office worker business manager human
👩‍💼 woman office worker business manager human
🧑‍🔬 scientist chemistry
👨‍🔬 man scientist biologist chemist engineer physicist human
👩‍🔬 woman scientist biologist chemist engineer physicist human
🧑‍💻 technologist computer
👨‍💻 man technologist coder developer engineer programmer software
👩‍💻 woman technologist coder developer engineer programmer software
🧑‍🎤 singer song artist performer
👨‍🎤 man singer rockstar entertainer human
👩‍🎤 woman singer rockstar entertainer human
🧑‍🎨 artist painting draw creativity
👨‍🎨 man artist painter human
👩‍🎨 woman artist painter human
🧑‍✈️ pilot fly plane airplane
👨‍✈️ man pilot aviator plane human
👩‍✈️ woman pilot aviator plane human
🧑‍🚀 astronaut outerspace
👨‍🚀 man astronaut space rocket human
👩‍🚀 woman astronaut space rocket human
🧑‍🚒 firefighter fire
👨‍🚒 man firefighter fireman human
👩‍🚒 woman firefighter fireman human
👮 police officer cop
👮‍♂️ man police officer law legal enforcement arrest 911
👮‍♀️ woman police officer law legal enforcement arrest 911 female
🕵️ detective human spy
🕵️‍♂️ man detective crime
🕵️‍♀️ woman detective human spy female
💂 guard protect
💂‍♂️ man guard uk gb british male guy royal
💂‍♀️ woman guard uk gb british female royal
👷 construction worker labor build
👷‍♂️ man construction worker male human wip guy build labor
👷‍♀️ woman construction worker female human wip build labor
🤴 prince boy man male crown royal king
👸 princess girl woman female blond crown royal queen
👳 person wearing turban headdress
👳‍♂️ man wearing turban male indian hinduism arabs
👳‍♀️ woman wearing turban female indian hinduism arabs
👲 man with skullcap male boy chinese
🧕 woman with headscarf female hijab mantilla tichel
🤵 man in tuxedo couple marriage wedding groom
👰 bride with veil couple marriage wedding woman
🤰 pregnant woman baby
🤱 breast feeding nursing baby
👼 baby angel heaven wings halo
🎅 santa claus festival man male xmas father christmas
🤶 mrs claus woman female xmas mother christmas
🦸 superhero marvel
🦸‍♂️ man superhero male good hero superpowers
🦸‍♀️ woman superhero female good heroine superpowers
🦹 supervillain marvel
🦹‍♂️ man supervillain male evil bad criminal hero superpowers
🦹‍♀️ woman supervillain female evil bad criminal heroine superpowers
🧙 mage magic
🧙‍♂️ man mage male sorcerer
🧙‍♀️ woman mage female witch
🧚 fairy wings magical
🧚‍♂️ man fairy male
🧚‍♀️ woman fairy female
🧛 vampire blood twilight
🧛‍♂️ man vampire male dracula
🧛‍♀️ woman vampire female
🧜 merperson sea
🧜‍♂️ merman man male triton
🧜‍♀️ mermaid woman female merwoman ariel
🧝 elf magical
🧝‍♂️ man elf male
🧝‍♀️ woman elf female
🧞 genie magical wishes
🧞‍♂️ man genie male
🧞‍♀️ woman genie female
🧟 zombie dead
🧟‍♂️ man zombie male dracula undead walking dead
🧟‍♀️ woman zombie female undead walking dead
💆 person getting massage relax
💆‍♂️ man getting massage male boy head
💆‍♀️ woman getting massage female girl head
💇 person getting haircut hairstyle
💇‍♂️ man getting haircut male boy
💇‍♀️ woman getting haircut female girl
🚶 person walking move
🚶‍♂️ man walking human feet steps
🚶‍♀️ woman walking human feet steps female
🧍 person standing still
🧍‍♂️ man standing still
🧍‍♀️ woman standing still
🧎 person kneeling pray respectful
🧎‍♂️ man kneeling pray respectful
🧎‍♀️ woman kneeling respectful pray
🧑‍🦯 person with probing cane blind
👨‍🦯 man with probing cane blind
👩‍🦯 woman with probing cane blind
🧑‍🦼 person in motorized wheelchair disability accessibility
👨‍🦼 man in motorized wheelchair disability accessibility
👩‍🦼 woman in motorized wheelchair disability accessibility
🧑‍🦽 person in manual wheelchair disability accessibility
👨‍🦽 man in manual wheelchair disability accessibility
👩‍🦽 woman in manual wheelchair disability accessibility
🏃 person running move
🏃‍♂️ man running walking exercise race
🏃‍♀️ woman running walking exercise race female
💃 woman dancing female girl fun
🕺 man dancing male boy fun dancer
🕴️ man in suit levitating business levitate hover jump
👯 people with bunny ears perform costume
👯‍♂️ men with bunny ears male boys
👯‍♀️ women with bunny ears female girls
🧖 person in steamy room relax spa
🧖‍♂️ man in steamy room male spa steamroom sauna
🧖‍♀️ woman in steamy room female spa steamroom sauna
🧗 person climbing sport
🧗‍♂️ man climbing sports hobby male rock
🧗‍♀️ woman climbing sports hobby female rock
🤺 person fencing sports sword
🏇 horse racing animal betting competition gambling luck
⛷️ skier sports winter snow
🏂 snowboarder sports winter
🏌️ person golfing sports business
🏌️‍♂️ man golfing sport
🏌️‍♀️ woman golfing sports business female
🏄 person surfing sport sea
🏄‍♂️ man surfing sports ocean sea summer beach
🏄‍♀️ woman surfing sports ocean sea summer beach female
🚣 person rowing boat sport move
🚣‍♂️ man rowing boat sports hobby water ship
🚣‍♀️ woman rowing boat sports hobby water ship female
🏊 person swimming sport pool
🏊‍♂️ man swimming sports exercise human athlete water summer
🏊‍♀️ woman swimming sports exercise human athlete water summer female
⛹️ person bouncing ball sports human
⛹️‍♂️ man bouncing ball sport
⛹️‍♀️ woman bouncing ball sports human female
🏋️ person lifting weights sports training exercise
🏋️‍♂️ man lifting weights sport
🏋️‍♀️ woman lifting weights sports training exercise female
🚴 person biking sport move
🚴‍♂️ man biking sports bike exercise hipster
🚴‍♀️ woman biking sports bike exercise hipster female
🚵 person mountain biking sport move
🚵‍♂️ man mountain biking transportation sports human race bike
🚵‍♀️ woman mountain biking transportation sports human race bike
🤸 person cartwheeling sport gymnastic
🤸‍♂️ man cartwheeling gymnastics
🤸‍♀️ woman cartwheeling gymnastics
🤼 people wrestling sport
🤼‍♂️ men wrestling sports wrestlers
🤼‍♀️ women wrestling sports wrestlers
🤽 person playing water polo sport
🤽‍♂️ man playing water polo sports pool
🤽‍♀️ woman playing water polo sports pool
🤾 person playing handball sport
🤾‍♂️ man playing handball sports
🤾‍♀️ woman playing handball sports
🤹 person juggling performance balance
🤹‍♂️ man juggling juggle balance skill multitask
🤹‍♀️ woman juggling juggle balance skill multitask
🧘 person in lotus position meditate
🧘‍♂️ man in lotus position male meditation yoga serenity zen
🧘‍♀️ woman in lotus position female meditation yoga serenity zen
🛀 person taking bath clean shower bathroom
🛌 person in bed rest
🧑‍🤝‍🧑 people holding hands friendship
👭 women holding hands pair friendship couple love like female people
👫 woman and man holding hands pair people human love date dating like
👬 men holding hands pair couple love like bromance friendship people
💏 kiss pair valentines love like dating marriage
👩‍❤️‍💋‍👨 kiss woman man love
👨‍❤️‍💋‍👨 kiss man pair valentines love like dating marriage
👩‍❤️‍💋‍👩 kiss woman pair valentines love like dating marriage
💑 couple with heart pair love like affection human dating valentines
👩‍❤️‍👨 couple with heart woman man love
👨‍❤️‍👨 couple with heart man pair love like affection human dating
👩‍❤️‍👩 couple with heart woman pair love like affection human dating
👪 family home parents child mom dad father mother people human
👨‍👩‍👦 family man woman boy love
👨‍👩‍👧 family man woman girl home parents people human child
👨‍👩‍👧‍👦 family man woman girl boy home parents people human
👨‍👩‍👦‍👦 family man woman boy home parents people human children
👨‍👩‍👧‍👧 family man woman girl home parents people human children
👨‍👨‍👦 family man boy home parents people human children
👨‍👨‍👧 family man girl home parents people human children
👨‍👨‍👧‍👦 family man girl boy home parents people human children
👨‍👨‍👦‍👦 family man boy home parents people human children
👨‍👨‍👧‍👧 family man girl home parents people human children
👩‍👩‍👦 family woman boy home parents people human children
👩‍👩‍👧 family woman girl home parents people human children
👩‍👩‍👧‍👦 family woman girl boy home parents people human children
👩‍👩‍👦‍👦 family woman boy home parents people human children
👩‍👩‍👧‍👧 family woman girl home parents people human children
👨‍👦 family man boy home parent people human child
👨‍👦‍👦 family man boy home parent people human children
👨‍👧 family man girl home parent people human child
👨‍👧‍👦 family man girl boy home parent people human children
👨‍👧‍👧 family man girl home parent people human children
👩‍👦 family woman boy home parent people human child
👩‍👦‍👦 family woman boy home parent people human children
👩‍👧 family woman girl home parent people human child
👩‍👧‍👦 family woman girl boy home parent people human children
👩‍👧‍👧 family woman girl home parent people human children
🗣️ speaking head user person human sing say talk
👤 bust in silhouette user person human
👥 busts in silhouette user person human group team
👣 footprints feet tracking walking beach
🐵 monkey face animal nature circus
🐒 monkey animal nature banana circus
🦍 gorilla animal nature circus
🦧 orangutan animal
🐶 dog face animal friend nature woof puppy pet faithful
🐕 dog animal nature friend doge pet faithful
🦮 guide dog animal blind
🐕‍🦺 service dog blind animal
🐩 poodle dog animal 101 nature pet
🐺 wolf animal nature wild
🦊 fox animal nature face
🦝 raccoon animal nature
🐱 cat face animal meow nature pet kitten
🐈 cat animal meow pet cats
🦁 lion animal nature
🐯 tiger face animal cat danger wild nature roar
🐅 tiger animal nature roar
🐆 leopard animal nature
🐴 horse face animal brown nature
🐎 horse animal gamble luck
🦄 unicorn animal nature mystical
🦓 zebra animal nature stripes safari
🦌 deer animal nature horns venison
🐮 cow face beef ox animal nature moo milk
🐂 ox animal cow beef
🐃 water buffalo animal nature ox cow
🐄 cow beef ox animal nature moo milk
🐷 pig face animal oink nature
🐖 pig animal nature
🐗 boar animal nature
🐽 pig nose animal oink
🐏 ram animal sheep nature
🐑 ewe animal nature wool shipit
🐐 goat animal nature
🐪 camel animal hot desert hump
🐫 two hump camel animal nature hot desert
🦙 llama animal nature alpaca
🦒 giraffe animal nature spots safari
🐘 elephant animal nature nose th circus
🦏 rhinoceros animal nature horn
🦛 hippopotamus animal nature
🐭 mouse face animal nature cheese wedge rodent
🐁 mouse animal nature rodent
🐀 rat animal mouse rodent
🐹 hamster animal nature
🐰 rabbit face animal nature pet spring magic bunny
🐇 rabbit animal nature pet magic spring
🐿️ chipmunk animal nature rodent squirrel
🦔 hedgehog animal nature spiny
🦇 bat animal nature blind vampire
🐻 bear animal nature wild
🐨 koala animal nature
🐼 panda animal nature
🦥 sloth animal
🦦 otter animal
🦨 skunk animal
🦘 kangaroo animal nature australia joey hop marsupial
🦡 badger animal nature honey
🐾 paw prints animal tracking footprints dog cat pet feet
🦃 turkey animal bird
🐔 chicken animal cluck nature bird
🐓 rooster animal nature chicken
🐣 hatching chick animal chicken egg born baby bird
🐤 baby chick animal chicken bird
🐥 front facing baby chick animal chicken bird
🐦 bird animal nature fly tweet spring
🐧 penguin animal nature
🕊️ dove animal bird
🦅 eagle animal nature bird
🦆 duck animal nature bird mallard
🦢 swan animal nature bird
🦉 owl animal nature bird hoot
🦩 flamingo animal
🦚 peacock animal nature peahen bird
🦜 parrot animal nature bird pirate talk
🐸 frog animal nature croak toad
🐊 crocodile animal nature reptile lizard alligator
🐢 turtle animal slow nature tortoise
🦎 lizard animal nature reptile
🐍 snake animal evil nature hiss python
🐲 dragon face animal myth nature chinese green
🐉 dragon animal myth nature chinese green
🦕 sauropod animal nature dinosaur brachiosaurus brontosaurus
🦖 t rex animal nature dinosaur tyrannosaurus extinct
🐳 spouting whale animal nature sea ocean
🐋 whale animal nature sea ocean
🐬 dolphin animal nature fish sea ocean flipper fins beach
🐟 fish animal food nature
🐠 tropical fish animal swim ocean beach nemo
🐡 blowfish animal nature food sea ocean
🦈 shark animal nature fish sea ocean jaws fins beach
🐙 octopus animal creature ocean sea nature beach
🐚 spiral shell nature sea beach
🐌 snail slow animal shell
🦋 butterfly animal insect nature caterpillar
🐛 bug animal insect nature worm
🐜 ant animal insect nature bug
🐝 honeybee animal insect nature bug spring honey
🐞 lady beetle animal insect nature ladybug
🦗 cricket animal chirp
🕷️ spider animal arachnid
🕸️ spider web animal insect arachnid silk
🦂 scorpion animal arachnid
🦟 mosquito animal nature insect malaria
🦠 microbe amoeba bacteria germs virus
💐 bouquet flowers nature spring
🌸 cherry blossom nature plant spring flower
💮 white flower japanese spring
🏵️ rosette flower decoration military
🌹 rose flowers valentines love spring
🥀 wilted flower plant nature
🌺 hibiscus plant vegetable flowers beach
🌻 sunflower nature plant fall
🌼 blossom nature flowers yellow
🌷 tulip flowers plant nature summer spring
🌱 seedling plant nature grass lawn spring
🌲 evergreen tree plant nature
🌳 deciduous tree plant nature
🌴 palm tree plant vegetable nature summer beach mojito tropical
🌵 cactus vegetable plant nature
🌾 sheaf of rice nature plant
🌿 herb vegetable plant medicine weed grass lawn
☘️ shamrock vegetable plant nature irish clover
🍀 four leaf clover vegetable plant nature lucky irish
🍁 maple leaf nature plant vegetable ca fall
🍂 fallen leaf nature plant vegetable leaves
🍃 leaf fluttering in wind nature plant tree vegetable grass lawn
🍇 grapes fruit food wine
🍈 melon fruit nature food
🍉 watermelon fruit food picnic summer
🍊 tangerine food fruit nature orange
🍋 lemon fruit nature
🍌 banana fruit food monkey
🍍 pineapple fruit nature food
🥭 mango fruit food tropical
🍎 red apple fruit mac school
🍏 green apple fruit nature
🍐 pear fruit nature food
🍑 peach fruit nature food
🍒 cherries food fruit
🍓 strawberry fruit food nature
🥝 kiwi fruit food
🍅 tomato fruit vegetable nature food
🥥 coconut fruit nature food palm
🥑 avocado fruit food
🍆 eggplant vegetable nature food aubergine
🥔 potato food tuber vegatable starch
🥕 carrot vegetable food orange
🌽 ear of corn food vegetable plant
🌶️ hot pepper food spicy chilli chili
🥒 cucumber fruit food pickle
🥬 leafy green food vegetable plant bok choy cabbage kale lettuce
🥦 broccoli fruit food vegetable
🧄 garlic food spice cook
🧅 onion cook food spice
🍄 mushroom plant vegetable
🥜 peanuts food nut
🌰 chestnut food squirrel
🍞 bread food wheat breakfast toast
🥐 croissant food bread french
🥖 baguette bread food french
🥨 pretzel food bread twisted
🥯 bagel food bread bakery schmear
🥞 pancakes food breakfast flapjacks hotcakes
🧇 waffle food breakfast
🧀 cheese wedge food chadder
🍖 meat on bone good food drumstick
🍗 poultry leg food meat drumstick bird chicken turkey
🥩 cut of meat food cow chop lambchop porkchop
🥓 bacon food breakfast pork pig meat
🍔 hamburger meat fast food beef cheeseburger mcdonalds burger king
🍟 french fries chips snack fast food
🍕 pizza food party
🌭 hot dog food frankfurter
🥪 sandwich food lunch bread
🌮 taco food mexican
🌯 burrito food mexican
🥙 stuffed flatbread food gyro
🧆 falafel food
🥚 egg food chicken breakfast
🍳 cooking food breakfast kitchen egg
🥘 shallow pan of food cooking casserole paella
🍲 pot of food meat soup
🥣 bowl with spoon food breakfast cereal oatmeal porridge
🥗 green salad food healthy lettuce
🍿 popcorn food movie theater films snack
🧈 butter food cook
🧂 salt condiment shaker
🥫 canned food soup
🍱 bento box food japanese
🍘 rice cracker food japanese
🍙 rice ball food japanese
🍚 cooked rice food china asian
🍛 curry rice food spicy hot indian
🍜 steaming bowl food japanese noodle chopsticks
🍝 spaghetti food italian noodle
🍠 roasted sweet potato food nature
🍢 oden food japanese
🍣 sushi food fish japanese rice
🍤 fried shrimp food animal appetizer summer
🍥 fish cake with swirl food japan sea beach narutomaki pink kamaboko
🥮 moon cake food autumn
🍡 dango food dessert sweet japanese barbecue meat
🥟 dumpling food empanada pierogi potsticker
🥠 fortune cookie food prophecy
🥡 takeout box food leftovers
🦀 crab animal crustacean
🦞 lobster animal nature bisque claws seafood
🦐 shrimp animal ocean nature seafood
🦑 squid animal nature ocean sea
🦪 oyster food
🍦 soft ice cream food hot dessert summer
🍧 shaved ice hot dessert summer
🍨 ice cream food hot dessert
🍩 doughnut food dessert snack sweet donut
🍪 cookie food snack oreo chocolate sweet dessert
🎂 birthday cake food dessert
🍰 shortcake food dessert
🧁 cupcake food dessert bakery sweet
🥧 pie food dessert pastry
🍫 chocolate bar food snack dessert sweet
🍬 candy snack dessert sweet lolly
🍭 lollipop food snack candy sweet
🍮 custard dessert food
🍯 honey pot bees sweet kitchen
🍼 baby bottle food container milk
🥛 glass of milk beverage drink cow
☕ hot beverage caffeine latte espresso coffee
🍵 teacup without handle drink bowl breakfast green british
🍶 sake wine drink drunk beverage japanese alcohol booze
🍾 bottle with popping cork drink wine celebration
🍷 wine glass drink beverage drunk alcohol booze
🍸 cocktail glass drink drunk alcohol beverage booze mojito
🍹 tropical drink beverage cocktail summer beach alcohol booze mojito
🍺 beer mug relax beverage drink drunk party pub summer alcohol booze
🍻 clinking beer mugs relax beverage drink drunk party pub summer
🥂 clinking glasses beverage drink party alcohol celebrate cheers wine
🥃 tumbler glass drink beverage drunk alcohol liquor booze bourbon
🥤 cup with straw drink soda
🧃 beverage box drink
🧉 mate drink tea beverage
🧊 ice water cold
🥢 chopsticks food
🍽️ fork and knife with plate food eat meal lunch dinner restaurant
🍴 fork and knife cutlery kitchen
🥄 spoon cutlery kitchen tableware
🔪 kitchen knife blade cutlery weapon
🏺 amphora vase jar
🌍 globe showing europe africa world international
🌎 globe showing americas world USA international
🌏 globe showing asia australia world east international
🌐 globe with meridians earth international world internet interweb
🗺️ world map location direction
🗾 map of japan nation country japanese asia
🧭 compass magnetic navigation orienteering
🏔️ snow capped mountain photo nature environment winter cold
⛰️ mountain photo nature environment
🌋 volcano photo nature disaster
🗻 mount fuji photo mountain nature japanese
🏕️ camping photo outdoors tent
🏖️ beach with umbrella weather summer sunny sand mojito
🏜️ desert photo warm saharah
🏝️ desert island photo tropical mojito
🏞️ national park photo environment nature
🏟️ stadium photo place sports concert venue
🏛️ classical building art culture history
🏗️ building construction wip working progress
🧱 brick bricks
🏘️ houses buildings photo
🏚️ derelict house abandon evict broken building
🏠 house building home
🏡 house with garden home plant nature
🏢 office building bureau work
🏣 japanese post office building envelope communication
🏤 post office building email
🏥 hospital building health surgery doctor
🏦 bank building money sales cash business enterprise
🏨 hotel building accomodation checkin
🏩 love hotel like affection dating
🏪 convenience store building shopping groceries
🏫 school building student education learn teach
🏬 department store building shopping mall
🏭 factory building industry pollution smoke
🏯 japanese castle photo building
🏰 castle building royalty history
💒 wedding love like affection couple marriage bride groom
🗼 tokyo tower photo japanese
🗽 statue of liberty american newyork
⛪ church building religion christ
🕌 mosque islam worship minaret
🛕 hindu temple religion
🕍 synagogue judaism worship temple jewish
⛩️ shinto shrine temple japan kyoto
🕋 kaaba mecca mosque islam
⛲ fountain photo summer water fresh
⛺ tent photo camping outdoors
🌁 foggy photo mountain
🌃 night with stars evening city downtown
🏙️ cityscape photo night life urban
🌄 sunrise over mountains view vacation photo
🌅 sunrise morning view vacation photo
🌆 cityscape at dusk photo evening sky buildings
🌇 sunset photo good morning dawn
🌉 bridge at night photo sanfrancisco
♨️ hot springs bath warm relax
🎠 carousel horse photo carnival
🎡 ferris wheel photo carnival londoneye
🎢 roller coaster carnival playground photo fun
💈 barber pole hair salon style
🎪 circus tent festival carnival party
🚂 locomotive transportation vehicle train
🚃 railway car transportation vehicle
🚄 high speed train transportation vehicle
🚅 bullet train transportation vehicle speed fast public travel
🚆 train transportation vehicle
🚇 metro transportation blue-square mrt underground tube
🚈 light rail transportation vehicle
🚉 station transportation vehicle public
🚊 tram transportation vehicle
🚝 monorail transportation vehicle
🚞 mountain railway transportation vehicle
🚋 tram car transportation vehicle carriage public travel
🚌 bus car vehicle transportation
🚍 oncoming bus vehicle transportation
🚎 trolleybus bart transportation vehicle
🚐 minibus vehicle car transportation
🚑 ambulance health 911 hospital
🚒 fire engine transportation cars vehicle
🚓 police car vehicle cars transportation law legal enforcement
🚔 oncoming police car vehicle law legal enforcement 911
🚕 taxi uber vehicle cars transportation
🚖 oncoming taxi vehicle cars uber
🚗 automobile red transportation vehicle
🚘 oncoming automobile car vehicle transportation
🚙 sport utility vehicle transportation
🚚 delivery truck cars transportation
🚛 articulated lorry vehicle cars transportation express
🚜 tractor vehicle car farming agriculture
🏎️ racing car sports race fast formula f1
🏍️ motorcycle race sports fast
🛵 motor scooter vehicle vespa sasha
🦽 manual wheelchair accessibility
🦼 motorized wheelchair accessibility
🛺 auto rickshaw move transportation
🚲 bicycle sports exercise hipster
🛴 kick scooter vehicle razor
🛹 skateboard board
🚏 bus stop transportation wait
🛣️ motorway road cupertino interstate highway
🛤️ railway track train transportation
🛢️ oil drum barrell
⛽ fuel pump gas station petroleum
🚨 police car light ambulance 911 emergency alert error pinged law
🚥 horizontal traffic light transportation signal
🚦 vertical traffic light transportation driving
🛑 stop sign
🚧 construction wip progress caution warning
⚓ anchor ship ferry sea boat
⛵ sailboat ship summer transportation water sailing
🛶 canoe boat paddle water ship
🚤 speedboat ship transportation vehicle summer
🛳️ passenger ship yacht cruise ferry
⛴️ ferry boat ship yacht
🛥️ motor boat ship
🚢 ship transportation titanic deploy
✈️ airplane vehicle transportation flight fly
🛩️ small airplane flight transportation fly vehicle
🛫 airplane departure airport flight landing
🛬 airplane arrival airport flight boarding
🪂 parachute fly glide
💺 seat sit airplane transport bus flight fly
🚁 helicopter transportation vehicle fly
🚟 suspension railway vehicle transportation
🚠 mountain cableway transportation vehicle ski
🚡 aerial tramway transportation vehicle ski
🛰️ satellite communication gps orbit spaceflight NASA ISS
🚀 rocket launch ship staffmode NASA outer space fly
🛸 flying saucer transportation vehicle ufo
🛎️ bellhop bell service
🧳 luggage packing travel
⌛ hourglass done time clock oldschool limit exam quiz test
⏳ hourglass not done oldschool time countdown
⌚ watch time accessories
⏰ alarm clock time wake
⏱️ stopwatch time deadline
⏲️ timer clock alarm
🕰️ mantelpiece clock time
🕛 twelve o clock time noon midnight midday late early schedule
🕧 twelve thirty time late early schedule
🕐 one o clock time late early schedule
🕜 one thirty time late early schedule
🕑 two o clock time late early schedule
🕝 two thirty time late early schedule
🕒 three o clock time late early schedule
🕞 three thirty time late early schedule
🕓 four o clock time late early schedule
🕟 four thirty time late early schedule
🕔 five o clock time late early schedule
🕠 five thirty time late early schedule
🕕 six o clock time late early schedule dawn dusk
🕡 six thirty time late early schedule
🕖 seven o clock time late early schedule
🕢 seven thirty time late early schedule
🕗 eight o clock time late early schedule
🕣 eight thirty time late early schedule
🕘 nine o clock time late early schedule
🕤 nine thirty time late early schedule
🕙 ten o clock time late early schedule
🕥 ten thirty time late early schedule
🕚 eleven o clock time late early schedule
🕦 eleven thirty time late early schedule
🌑 new moon nature twilight planet space night evening sleep
🌒 waxing crescent moon nature twilight planet space night evening
🌓 first quarter moon nature twilight planet space night evening sleep
🌔 waxing gibbous moon nature night sky gray twilight planet space
🌕 full moon nature yellow twilight planet space night evening sleep
🌖 waning gibbous moon nature twilight planet space night evening
🌗 last quarter moon nature twilight planet space night evening sleep
🌘 waning crescent moon nature twilight planet space night evening
🌙 crescent moon night sleep sky evening magic
🌚 new moon face nature twilight planet space night evening sleep
🌛 first quarter moon face nature twilight planet space night evening
🌜 last quarter moon face nature twilight planet space night evening
🌡️ thermometer weather temperature hot cold
☀️ sun weather nature brightness summer beach spring
🌝 full moon face nature twilight planet space night evening sleep
🌞 sun with face nature morning sky
🪐 ringed planet outerspace
⭐ star night yellow
🌟 glowing star night sparkle awesome good magic
🌠 shooting star night photo
🌌 milky way photo space stars
☁️ cloud weather sky
⛅ sun behind cloud weather nature cloudy morning fall spring
⛈️ cloud with lightning and rain weather
🌤️ sun behind small cloud weather
🌥️ sun behind large cloud weather
🌦️ sun behind rain cloud weather
🌧️ cloud with rain weather
🌨️ cloud with snow weather
🌩️ cloud with lightning weather thunder
🌪️ tornado weather cyclone twister
🌫️ fog weather
🌬️ wind face gust air
🌀 cyclone weather swirl blue cloud vortex spiral whirlpool spin
🌈 rainbow nature happy unicorn face photo sky spring
🌂 closed umbrella weather rain drizzle
☂️ umbrella weather spring
☔ umbrella with rain drops rainy weather spring
⛱️ umbrella on ground weather summer
⚡ high voltage thunder weather lightning bolt fast
❄️ snowflake winter season cold weather christmas xmas
☃️ snowman winter season cold weather christmas xmas frozen
⛄ snowman without snow winter season cold weather christmas xmas
☄️ comet space
🔥 fire hot cook flame
💧 droplet water drip faucet spring
🌊 water wave sea nature tsunami disaster
🎃 jack o lantern halloween light pumpkin creepy fall
🎄 christmas tree festival vacation december xmas celebration
🎆 fireworks photo festival carnival congratulations
🎇 sparkler stars night shine
🧨 firecracker dynamite boom explode explosion explosive
✨ sparkles stars shine shiny cool awesome good magic
🎈 balloon party celebration birthday circus
🎉 party popper congratulations birthday magic circus celebration tada
🎊 confetti ball festival party birthday circus
🎋 tanabata tree plant nature branch summer
🎍 pine decoration plant nature vegetable panda
🎎 japanese dolls toy kimono
🎏 carp streamer fish japanese koinobori banner
🎐 wind chime nature ding spring bell
🎑 moon viewing ceremony photo japan asia tsukimi
🧧 red envelope gift
🎀 ribbon decoration pink girl bowtie
🎁 wrapped gift present birthday christmas xmas
🎗️ reminder ribbon sports cause support awareness
🎟️ admission tickets sports concert entrance
🎫 ticket event concert pass
🎖️ military medal award winning army
🏆 trophy win award contest place ftw ceremony
🏅 sports medal award winning
🥇 1st place medal award winning first
🥈 2nd place medal award second
🥉 3rd place medal award third
⚽ soccer ball sports football
⚾ baseball sports balls
🥎 softball sports balls
🏀 basketball sports balls NBA
🏐 volleyball sports balls
🏈 american football sports balls NFL
🏉 rugby football sports team
🎾 tennis sports balls green
🥏 flying disc sports frisbee ultimate
🎳 bowling sports fun play
🏏 cricket game sports
🏑 field hockey sports
🏒 ice hockey sports
🥍 lacrosse sports ball stick
🏓 ping pong sports pingpong
🏸 badminton sports
🥊 boxing glove sports fighting
🥋 martial arts uniform judo karate taekwondo
🥅 goal net sports
⛳ flag in hole sports business summer
⛸️ ice skate sports
🎣 fishing pole food hobby summer
🤿 diving mask sport ocean
🎽 running shirt play pageant
🎿 skis sports winter cold snow
🛷 sled sleigh luge toboggan
🥌 curling stone sports
🎯 direct hit game play bar target bullseye
🪀 yo toy
🪁 kite wind fly
🎱 pool 8 ball hobby game luck magic
🔮 crystal ball disco party magic circus fortune teller
🧿 nazar amulet bead charm
🎮 video game play console PS4 controller
🕹️ joystick game play
🎰 slot machine bet gamble vegas fruit luck casino
🎲 game die dice random tabletop play luck
🧩 puzzle piece interlocking
🧸 teddy bear plush stuffed
♠️ spade suit poker cards suits magic
♥️ heart suit poker cards magic suits
♦️ diamond suit poker cards magic suits
♣️ club suit poker cards magic suits
♟️ chess pawn expendable
🃏 joker poker cards game play magic
🀄 mahjong red dragon game play chinese kanji
🎴 flower playing cards game sunset red
🎭 performing arts acting theater drama
🖼️ framed picture photography
🎨 artist palette design paint draw colors
🧵 thread needle sewing spool string
🧶 yarn ball crochet knit
👓 glasses fashion accessories eyesight nerdy dork geek
🕶️ sunglasses face cool accessories
🥽 goggles eyes protection safety
🥼 lab coat doctor experiment scientist chemist
🦺 safety vest protection
👔 necktie shirt suitup formal fashion cloth business
👕 t shirt fashion cloth casual tee
👖 jeans fashion shopping
🧣 scarf neck winter clothes
🧤 gloves hands winter clothes
🧥 coat jacket
🧦 socks stockings clothes
👗 dress clothes fashion shopping
👘 kimono dress fashion women female japanese
🥻 sari dress
🩱 one piece swimsuit fashion
🩲 briefs clothing
🩳 shorts clothing
👙 bikini swimming female woman girl fashion beach summer
👚 woman s clothes fashion shopping bags female
👛 purse fashion accessories money sales shopping
👜 handbag fashion accessory accessories shopping
👝 clutch bag accessories shopping
🛍️ shopping bags mall buy purchase
🎒 backpack student education bag
👞 man s shoe fashion male
👟 running shoe shoes sports sneakers
🥾 hiking boot backpacking camping
🥿 flat shoe ballet slip-on slipper
👠 high heeled shoe fashion shoes female pumps stiletto
👡 woman s sandal shoes fashion flip flops
🩰 ballet shoes dance
👢 woman s boot shoes fashion
👑 crown king kod leader royalty lord
👒 woman s hat fashion accessories female lady spring
🎩 top hat magic gentleman classy circus
🎓 graduation cap school college degree university hat legal learn
🧢 billed cap baseball
⛑️ rescue worker s helmet construction build
📿 prayer beads dhikr religious
💄 lipstick female girl fashion woman
💍 ring wedding propose marriage valentines diamond fashion jewelry
💎 gem stone blue ruby diamond jewelry
🔇 muted speaker sound volume silence quiet
🔈 speaker low volume sound silence broadcast
🔉 speaker medium volume broadcast
🔊 speaker high volume noise noisy broadcast
📢 loudspeaker volume sound
📣 megaphone sound speaker volume
📯 postal horn instrument music
🔔 bell sound notification christmas xmas chime
🔕 bell with slash sound volume mute quiet silent
🎼 musical score treble clef compose
🎵 musical note score tone sound
🎶 musical notes music score
🎙️ studio microphone sing recording artist talkshow
🎚️ level slider scale
🎛️ control knobs dial
🎤 microphone sound music PA sing talkshow
🎧 headphone music score gadgets
📻 radio communication music podcast program
🎷 saxophone music instrument jazz blues
🎸 guitar music instrument
🎹 musical keyboard piano instrument compose
🎺 trumpet music brass
🎻 violin music instrument orchestra symphony
🪕 banjo music instructment
🥁 drum music instrument drumsticks snare
📱 mobile phone technology apple gadgets dial
📲 mobile phone with arrow iphone incoming
☎️ telephone technology communication dial
📞 telephone receiver technology communication dial
📟 pager bbcall oldschool 90s
📠 fax machine communication technology
🔋 battery power energy sustain
🔌 electric plug charger power
💻 laptop technology screen display monitor
🖥️ desktop computer technology computing screen
🖨️ printer paper ink
⌨️ keyboard technology computer type input text
🖱️ computer mouse click
🖲️ trackball technology trackpad
💽 computer disk technology record data 90s
💾 floppy disk oldschool technology save 90s 80s
💿 optical disk technology dvd disc 90s
📀 dvd cd disk disc
🧮 abacus calculation
🎥 movie camera film record
🎞️ film frames movie
📽️ film projector video tape record movie
🎬 clapper board movie film record
📺 television technology program oldschool show
📷 camera gadgets photography
📸 camera with flash photography gadgets
📹 video camera film record
📼 videocassette record video oldschool 90s 80s
🔍 magnifying glass tilted left search zoom find detective
🔎 magnifying glass tilted right search zoom find detective
🕯️ candle fire wax
💡 light bulb electricity idea
🔦 flashlight dark camping sight night
🏮 red paper lantern light halloween spooky
🪔 diya lamp lighting
📔 notebook with decorative cover classroom notes record paper study
📕 closed book read library knowledge textbook learn
📖 open book read library knowledge literature learn study
📗 green book read library knowledge study
📘 blue book read library knowledge learn study
📙 orange book read library knowledge textbook study
📚 books literature library study
📓 notebook stationery record notes paper study
📒 ledger notes paper
📃 page with curl documents office paper
📜 scroll documents ancient history paper
📄 page facing up documents office paper information
📰 newspaper press headline
🗞️ rolled up newspaper press headline
📑 bookmark tabs favorite save order tidy
🔖 bookmark favorite label save
🏷️ label sale tag
💰 money bag dollar payment coins sale
💴 yen banknote money sales japanese dollar currency
💵 dollar banknote money sales bill currency
💶 euro banknote money sales dollar currency
💷 pound banknote british sterling money sales bills uk england
💸 money with wings dollar bills payment sale
💳 credit card money sales dollar bill payment shopping
🧾 receipt accounting expenses
💹 chart increasing with yen green-square graph presentation stats
💱 currency exchange money sales dollar travel
💲 heavy dollar sign money sales payment currency buck
✉️ envelope letter postal inbox communication
📧 e mail communication inbox
📨 incoming envelope email inbox
📩 envelope with arrow email communication
📤 outbox tray inbox email
📥 inbox tray email documents
📦 package mail gift cardboard box moving
📫 closed mailbox with raised flag email inbox communication
📪 closed mailbox with lowered flag email communication inbox
📬 open mailbox with raised flag email inbox communication
📭 open mailbox with lowered flag email inbox
📮 postbox email letter envelope
🗳️ ballot box with election vote
✏️ pencil stationery write paper writing school study
✒️ black nib pen stationery writing write
🖋️ fountain pen stationery writing write
🖊️ pen stationery writing write
🖌️ paintbrush drawing creativity art
🖍️ crayon drawing creativity
📝 memo write documents stationery pencil paper writing legal exam
💼 briefcase business documents work law legal job career
📁 file folder documents business office
📂 open file folder documents load
🗂️ card index dividers organizing business stationery
📅 calendar schedule
📆 tear off calendar schedule date planning
🗒️ spiral notepad memo stationery
🗓️ spiral calendar date schedule planning
📇 card index business stationery
📈 chart increasing graph presentation stats recovery business
📉 chart decreasing graph presentation stats recession business
📊 bar chart graph presentation stats
📋 clipboard stationery documents
📌 pushpin stationery mark here
📍 round pushpin stationery location map here
📎 paperclip documents stationery
🖇️ linked paperclips documents stationery
📏 straight ruler stationery calculate length math school drawing
📐 triangular ruler stationery math architect sketch
✂️ scissors stationery cut
🗃️ card file box business stationery
🗄️ file cabinet filing organizing
🗑️ wastebasket bin trash rubbish garbage toss
🔒 locked security password padlock
🔓 unlocked privacy security
🔏 locked with pen security secret
🔐 locked with key security privacy
🔑 key lock door password
🗝️ old key lock door password
🔨 hammer tools build create
🪓 axe tool chop cut
⛏️ pick tools dig
⚒️ hammer and pick tools build create
🛠️ hammer and wrench tools build create
🗡️ dagger weapon
⚔️ crossed swords weapon
🔫 pistol violence weapon revolver
🏹 bow and arrow sports
🛡️ shield protection security
🔧 wrench tools diy ikea fix maintainer
🔩 nut and bolt handy tools fix
⚙️ gear cog
🗜️ clamp tool
⚖️ balance scale law fairness weight
🦯 probing cane accessibility
🔗 link rings url
⛓️ chains lock arrest
🧰 toolbox tools diy fix maintainer mechanic
🧲 magnet attraction magnetic
⚗️ alembic distilling science experiment chemistry
🧪 test tube chemistry experiment lab science
🧫 petri dish bacteria biology culture lab
🧬 dna biologist genetics life
🔬 microscope laboratory experiment zoomin science study
🔭 telescope stars space zoom science astronomy
📡 satellite antenna communication future radio space
💉 syringe health hospital drugs blood medicine needle doctor nurse
🩸 drop of blood period hurt harm wound
💊 pill health medicine doctor pharmacy drug
🩹 adhesive bandage heal
🩺 stethoscope health
🚪 door house entry exit
🛏️ bed sleep rest
🛋️ couch and lamp read chill
🪑 chair sit furniture
🚽 toilet restroom wc washroom bathroom potty
🚿 shower clean water bathroom
🛁 bathtub clean shower bathroom
🪒 razor cut
🧴 lotion bottle moisturizer sunscreen
🧷 safety pin diaper
🧹 broom cleaning sweeping witch
🧺 basket laundry
🧻 roll of paper
🧼 soap bar bathing cleaning lather
🧽 sponge absorbing cleaning porous
🧯 fire extinguisher quench
🛒 shopping cart trolley
🚬 cigarette kills tobacco joint smoke
⚰️ coffin vampire dead die death rip graveyard cemetery casket funeral
⚱️ funeral urn dead die death rip ashes
🗿 moai rock easter island
🏧 atm sign money sales cash blue-square payment bank
🚮 litter in bin sign blue-square human info
🚰 potable water blue-square liquid restroom cleaning faucet
♿ wheelchair symbol blue-square disabled accessibility
🚹 men s room toilet restroom wc blue-square gender male
🚺 women s room purple-square woman female toilet loo restroom gender
🚻 restroom blue-square toilet refresh wc gender
🚼 baby symbol orange-square child
🚾 water closet toilet restroom blue-square
🛂 passport control custom blue-square
🛃 customs passport border blue-square
🛄 baggage claim blue-square airport transport
🛅 left luggage blue-square travel
⚠️ warning exclamation wip alert error problem issue
🚸 children crossing school warning danger sign driving yellow-diamond
⛔ no entry limit security privacy bad denied stop circle
🚫 prohibited forbid stop limit denied disallow circle
🚳 no bicycles cyclist prohibited circle
🚭 no smoking cigarette blue-square smell smoke
🚯 no littering trash bin garbage circle
🚱 non potable water drink faucet tap circle
🚷 no pedestrians rules crossing walking circle
📵 no mobile phones iphone mute circle
🔞 no one under eighteen 18 drink pub night minor circle
☢️ radioactive nuclear danger
☣️ biohazard danger
⬆️ up arrow blue-square continue top direction
↗️ up right arrow blue-square point direction diagonal northeast
➡️ right arrow blue-square next
↘️ down right arrow blue-square direction diagonal southeast
⬇️ down arrow blue-square direction bottom
↙️ down left arrow blue-square direction diagonal southwest
⬅️ left arrow blue-square previous back
↖️ up left arrow blue-square point direction diagonal northwest
↕️ up down arrow blue-square direction way vertical
↔️ left right arrow shape direction horizontal sideways
↩️ right arrow curving left back return blue-square undo enter
↪️ left arrow curving right blue-square return rotate direction
⤴️ right arrow curving up blue-square direction top
⤵️ right arrow curving down blue-square direction bottom
🔃 clockwise vertical arrows sync cycle round repeat
🔄 counterclockwise arrows button blue-square sync cycle
🔙 back arrow words return
🔚 end arrow words
🔛 on arrow words
🔜 soon arrow words
🔝 top arrow words blue-square
🛐 place of worship religion church temple prayer
⚛️ atom symbol science physics chemistry
🕉️ om hinduism buddhism sikhism jainism
✡️ star of david judaism
☸️ wheel of dharma hinduism buddhism sikhism jainism
☯️ yin yang balance
✝️ latin cross christianity
☦️ orthodox cross suppedaneum religion
☪️ star and crescent islam
☮️ peace symbol hippie
🕎 menorah hanukkah candles jewish
🔯 dotted six pointed star purple-square religion jewish hexagram
♈ aries sign purple-square zodiac astrology
♉ taurus purple-square sign zodiac astrology
♊ gemini sign zodiac purple-square astrology
♋ cancer sign zodiac purple-square astrology
♌ leo sign purple-square zodiac astrology
♍ virgo sign zodiac purple-square astrology
♎ libra sign purple-square zodiac astrology
♏ scorpio sign zodiac purple-square astrology
♐ sagittarius sign zodiac purple-square astrology
♑ capricorn sign zodiac purple-square astrology
♒ aquarius sign purple-square zodiac astrology
♓ pisces purple-square sign zodiac astrology
⛎ ophiuchus sign purple-square constellation astrology
🔀 shuffle tracks button blue-square music random
🔁 repeat button loop record
🔂 repeat single button blue-square loop
▶️ play button blue-square right direction
⏩ fast forward button blue-square play speed continue
⏭️ next track button forward blue-square
⏯️ play or pause button blue-square
◀️ reverse button blue-square left direction
⏪ fast reverse button play blue-square
⏮️ last track button backward
🔼 upwards button blue-square triangle direction point forward top
⏫ fast up button blue-square direction top
🔽 downwards button blue-square direction bottom
⏬ fast down button blue-square direction bottom
⏸️ pause button blue-square
⏹️ stop button blue-square
⏺️ record button blue-square
⏏️ eject button blue-square
🎦 cinema blue-square record film movie curtain stage theater
🔅 dim button sun afternoon warm summer
🔆 bright button sun light
📶 antenna bars blue-square reception phone internet connection wifi
📳 vibration mode orange-square phone
📴 mobile phone off mute orange-square silence quiet
♀️ female sign woman women lady girl
♂️ male sign man boy men
⚕️ medical symbol health hospital
♾️ infinity forever
♻️ recycling symbol arrow environment garbage trash
⚜️ fleur de lis decorative scout
🔱 trident emblem weapon spear
📛 name badge fire forbid
🔰 japanese symbol for beginner badge shield
⭕ hollow red circle round
✅ check mark button green-square ok agree vote election answer tick
☑️ check box with ok agree confirm black-square vote election yes tick
✔️ check mark ok nike answer yes tick
✖️ multiplication sign math calculation
❌ cross mark no delete remove cancel red
❎ cross mark button x green-square no deny
➕ plus sign math calculation addition more increase
➖ minus sign math calculation subtract less
➗ division sign divide math calculation
➰ curly loop scribble draw shape squiggle
➿ double curly loop tape cassette
〽️ part alternation mark graph presentation stats business economics
✳️ eight spoked asterisk star sparkle green-square
✴️ eight pointed star orange-square shape polygon
❇️ sparkle stars green-square awesome good fireworks
‼️ double exclamation mark surprise
⁉️ exclamation question mark wat punctuation surprise
❓ question mark doubt confused
❔ white question mark doubts gray huh confused
❕ white exclamation mark surprise punctuation gray wow warning
❗ exclamation mark heavy danger surprise punctuation wow warning
〰️ wavy dash draw line moustache mustache squiggle scribble
©️ copyright ip license circle law legal
®️ registered alphabet circle
™️ trade mark trademark brand law legal
#️⃣ keycap  symbol blue-square twitter
*️⃣ keycap  star
0️⃣ keycap 0 numbers blue-square null
1️⃣ keycap 1 blue-square numbers
2️⃣ keycap 2 numbers prime blue-square
3️⃣ keycap 3 numbers prime blue-square
4️⃣ keycap 4 numbers blue-square
5️⃣ keycap 5 numbers blue-square prime
6️⃣ keycap 6 numbers blue-square
7️⃣ keycap 7 numbers blue-square prime
8️⃣ keycap 8 blue-square numbers
9️⃣ keycap 9 blue-square numbers
🔟 keycap 10 numbers blue-square
🔠 input latin uppercase alphabet words blue-square
🔡 input latin lowercase blue-square alphabet
🔢 input numbers blue-square
🔣 input symbols blue-square music note ampersand percent glyphs
🔤 input latin letters blue-square alphabet
🅰️ a button red-square alphabet letter
🆎 ab button red-square alphabet
🅱️ b button red-square alphabet letter
🆑 cl button alphabet words red-square
🆒 cool button words blue-square
🆓 free button blue-square words
ℹ️ information blue-square alphabet letter
🆔 id button purple-square words
Ⓜ️ circled m alphabet blue-circle letter
🆕 new button blue-square words start
🆖 ng button blue-square words shape icon
🅾️ o button alphabet red-square letter
🆗 ok button good agree yes blue-square
🅿️ p button cars blue-square alphabet letter
🆘 sos button help red-square words emergency 911
🆙 up button blue-square above high
🆚 vs button words orange-square
🈁 japanese here button blue-square katakana destination
🈂️ japanese service charge button blue-square katakana
🈷️ japanese monthly amount button chinese month moon orange-square
🈶 japanese not free of charge button orange-square chinese have kanji
🈯 japanese reserved button chinese point green-square kanji
🉐 japanese bargain button chinese kanji obtain get circle
🈹 japanese discount button cut divide chinese kanji pink-square
🈚 japanese free of charge button nothing chinese kanji orange-square
🈲 japanese prohibited button kanji chinese forbidden limit restricted
🉑 japanese acceptable button ok good chinese kanji agree yes
🈸 japanese application button chinese kanji orange-square
🈴 japanese passing grade button chinese join kanji red-square
🈳 japanese vacancy button kanji chinese empty sky blue-square
㊗️ japanese congratulations button chinese kanji red-circle
㊙️ japanese secret button privacy chinese sshh kanji red-circle
🈺 japanese open for business button opening hours orange-square
🈵 japanese no vacancy button full chinese red-square kanji
🔴 red circle shape error danger
🟠 orange circle round
🟡 yellow circle round
🟢 green circle round
🔵 blue circle shape icon button
🟣 purple circle round
🟤 brown circle round
⚫ black circle shape button round
⚪ white circle shape round
🟥 red square
🟧 orange square
🟨 yellow square
🟩 green square
🟦 blue square
🟪 purple square
🟫 brown square
⬛ black large square shape icon button
⬜ white large square shape icon stone button
◼️ black medium square shape button icon
◻️ white medium square shape stone icon
◾ black medium small square icon shape button
◽ white medium small square shape stone icon button
▪️ black small square shape icon
▫️ white small square shape icon
🔶 large orange diamond shape jewel gem
🔷 large blue diamond shape jewel gem
🔸 small orange diamond shape jewel gem
🔹 small blue diamond shape jewel gem
🔺 red triangle pointed up shape direction top
🔻 red triangle pointed down shape direction bottom
💠 diamond with a dot jewel blue gem crystal fancy
🔘 radio button input old music circle
🔳 white square button shape input
🔲 black square button shape input frame
🏁 chequered flag contest finishline race gokart
🚩 triangular flag mark milestone place
🎌 crossed flags japanese nation country border
🏴 black flag pirate
🏳️ white flag losing loser lost surrender give up fail
🏳️‍🌈 rainbow flag pride gay lgbt glbt queer homosexual lesbian
🏴‍☠️ pirate flag skull crossbones banner
🇦🇨 flag ascension island
🇦🇩 flag andorra ad nation country banner
🇦🇪 flag united arab emirates nation country banner
🇦🇫 flag afghanistan af nation country banner
🇦🇬 flag antigua barbuda nation country banner
🇦🇮 flag anguilla ai nation country banner
🇦🇱 flag albania al nation country banner
🇦🇲 flag armenia am nation country banner
🇦🇴 flag angola ao nation country banner
🇦🇶 flag antarctica aq nation country banner
🇦🇷 flag argentina ar nation country banner
🇦🇸 flag american samoa ws nation country banner
🇦🇹 flag austria at nation country banner
🇦🇺 flag australia au nation country banner
🇦🇼 flag aruba aw nation country banner
🇦🇽 flag aland islands Åland nation country banner
🇦🇿 flag azerbaijan az nation country banner
🇧🇦 flag bosnia herzegovina nation country banner
🇧🇧 flag barbados bb nation country banner
🇧🇩 flag bangladesh bd nation country banner
🇧🇪 flag belgium be nation country banner
🇧🇫 flag burkina faso nation country banner
🇧🇬 flag bulgaria bg nation country banner
🇧🇭 flag bahrain bh nation country banner
🇧🇮 flag burundi bi nation country banner
🇧🇯 flag benin bj nation country banner
🇧🇱 flag st barthelemy saint barthélemy nation country banner
🇧🇲 flag bermuda bm nation country banner
🇧🇳 flag brunei bn darussalam nation country banner
🇧🇴 flag bolivia bo nation country banner
🇧🇶 flag caribbean netherlands bonaire nation country banner
🇧🇷 flag brazil br nation country banner
🇧🇸 flag bahamas bs nation country banner
🇧🇹 flag bhutan bt nation country banner
🇧🇻 flag bouvet island norway
🇧🇼 flag botswana bw nation country banner
🇧🇾 flag belarus by nation country banner
🇧🇿 flag belize bz nation country banner
🇨🇦 flag canada ca nation country banner
🇨🇨 flag cocos islands keeling nation country banner
🇨🇩 flag congo kinshasa democratic republic nation country banner
🇨🇫 flag central african republic nation country banner
🇨🇬 flag congo brazzaville nation country banner
🇨🇭 flag switzerland ch nation country banner
🇨🇮 flag cote d ivoire ivory coast nation country banner
🇨🇰 flag cook islands nation country banner
🇨🇱 flag chile nation country banner
🇨🇲 flag cameroon cm nation country banner
🇨🇳 flag china chinese prc country nation banner
🇨🇴 flag colombia co nation country banner
🇨🇵 flag clipperton island
🇨🇷 flag costa rica nation country banner
🇨🇺 flag cuba cu nation country banner
🇨🇻 flag cape verde cabo nation country banner
🇨🇼 flag curacao curaçao nation country banner
🇨🇽 flag christmas island nation country banner
🇨🇾 flag cyprus cy nation country banner
🇨🇿 flag czechia cz nation country banner
🇩🇪 flag germany german nation country banner
🇩🇬 flag diego garcia
🇩🇯 flag djibouti dj nation country banner
🇩🇰 flag denmark dk nation country banner
🇩🇲 flag dominica dm nation country banner
🇩🇴 flag dominican republic nation country banner
🇩🇿 flag algeria dz nation country banner
🇪🇦 flag ceuta melilla
🇪🇨 flag ecuador ec nation country banner
🇪🇪 flag estonia ee nation country banner
🇪🇬 flag egypt eg nation country banner
🇪🇭 flag western sahara nation country banner
🇪🇷 flag eritrea er nation country banner
🇪🇸 flag spain nation country banner
🇪🇹 flag ethiopia et nation country banner
🇪🇺 flag european union banner
🇫🇮 flag finland fi nation country banner
🇫🇯 flag fiji fj nation country banner
🇫🇰 flag falkland islands malvinas nation country banner
🇫🇲 flag micronesia federated states nation country banner
🇫🇴 flag faroe islands nation country banner
🇫🇷 flag france banner nation french country
🇬🇦 flag gabon ga nation country banner
🇬🇧 flag united kingdom great britain northern ireland nation country
🇬🇩 flag grenada gd nation country banner
🇬🇪 flag georgia ge nation country banner
🇬🇫 flag french guiana nation country banner
🇬🇬 flag guernsey gg nation country banner
🇬🇭 flag ghana gh nation country banner
🇬🇮 flag gibraltar gi nation country banner
🇬🇱 flag greenland gl nation country banner
🇬🇲 flag gambia gm nation country banner
🇬🇳 flag guinea gn nation country banner
🇬🇵 flag guadeloupe gp nation country banner
🇬🇶 flag equatorial guinea gn nation country banner
🇬🇷 flag greece gr nation country banner
🇬🇸 flag south georgia sandwich islands nation country banner
🇬🇹 flag guatemala gt nation country banner
🇬🇺 flag guam gu nation country banner
🇬🇼 flag guinea bissau gw nation country banner
🇬🇾 flag guyana gy nation country banner
🇭🇰 flag hong kong sar china nation country banner
🇭🇲 flag heard mcdonald islands
🇭🇳 flag honduras hn nation country banner
🇭🇷 flag croatia hr nation country banner
🇭🇹 flag haiti ht nation country banner
🇭🇺 flag hungary hu nation country banner
🇮🇨 flag canary islands nation country banner
🇮🇩 flag indonesia nation country banner
🇮🇪 flag ireland ie nation country banner
🇮🇱 flag israel il nation country banner
🇮🇲 flag isle of man nation country banner
🇮🇳 flag india in nation country banner
🇮🇴 flag british indian ocean territory nation country banner
🇮🇶 flag iraq iq nation country banner
🇮🇷 flag iran islamic republic nation country banner
🇮🇸 flag iceland is nation country banner
🇮🇹 flag italy nation country banner
🇯🇪 flag jersey je nation country banner
🇯🇲 flag jamaica jm nation country banner
🇯🇴 flag jordan jo nation country banner
🇯🇵 flag japan japanese nation country banner
🇰🇪 flag kenya ke nation country banner
🇰🇬 flag kyrgyzstan kg nation country banner
🇰🇭 flag cambodia kh nation country banner
🇰🇮 flag kiribati ki nation country banner
🇰🇲 flag comoros km nation country banner
🇰🇳 flag st kitts nevis saint nation country banner
🇰🇵 flag north korea nation country banner
🇰🇷 flag south korea nation country banner
🇰🇼 flag kuwait kw nation country banner
🇰🇾 flag cayman islands nation country banner
🇰🇿 flag kazakhstan kz nation country banner
🇱🇦 flag laos lao democratic republic nation country banner
🇱🇧 flag lebanon lb nation country banner
🇱🇨 flag st lucia saint nation country banner
🇱🇮 flag liechtenstein li nation country banner
🇱🇰 flag sri lanka nation country banner
🇱🇷 flag liberia lr nation country banner
🇱🇸 flag lesotho ls nation country banner
🇱🇹 flag lithuania lt nation country banner
🇱🇺 flag luxembourg lu nation country banner
🇱🇻 flag latvia lv nation country banner
🇱🇾 flag libya ly nation country banner
🇲🇦 flag morocco ma nation country banner
🇲🇨 flag monaco mc nation country banner
🇲🇩 flag moldova republic nation country banner
🇲🇪 flag montenegro me nation country banner
🇲🇫 flag st martin
🇲🇬 flag madagascar mg nation country banner
🇲🇭 flag marshall islands nation country banner
🇲🇰 flag north macedonia nation country banner
🇲🇱 flag mali ml nation country banner
🇲🇲 flag myanmar mm nation country banner
🇲🇳 flag mongolia mn nation country banner
🇲🇴 flag macao sar china nation country banner
🇲🇵 flag northern mariana islands nation country banner
🇲🇶 flag martinique mq nation country banner
🇲🇷 flag mauritania mr nation country banner
🇲🇸 flag montserrat ms nation country banner
🇲🇹 flag malta mt nation country banner
🇲🇺 flag mauritius mu nation country banner
🇲🇻 flag maldives mv nation country banner
🇲🇼 flag malawi mw nation country banner
🇲🇽 flag mexico mx nation country banner
🇲🇾 flag malaysia my nation country banner
🇲🇿 flag mozambique mz nation country banner
🇳🇦 flag namibia na nation country banner
🇳🇨 flag new caledonia nation country banner
🇳🇪 flag niger ne nation country banner
🇳🇫 flag norfolk island nation country banner
🇳🇬 flag nigeria nation country banner
🇳🇮 flag nicaragua ni nation country banner
🇳🇱 flag netherlands nl nation country banner
🇳🇴 flag norway no nation country banner
🇳🇵 flag nepal np nation country banner
🇳🇷 flag nauru nr nation country banner
🇳🇺 flag niue nu nation country banner
🇳🇿 flag new zealand nation country banner
🇴🇲 flag oman om symbol nation country banner
🇵🇦 flag panama pa nation country banner
🇵🇪 flag peru pe nation country banner
🇵🇫 flag french polynesia nation country banner
🇵🇬 flag papua new guinea nation country banner
🇵🇭 flag philippines ph nation country banner
🇵🇰 flag pakistan pk nation country banner
🇵🇱 flag poland pl nation country banner
🇵🇲 flag st pierre miquelon saint nation country banner
🇵🇳 flag pitcairn islands nation country banner
🇵🇷 flag puerto rico nation country banner
🇵🇸 flag palestinian territories palestine nation country banner
🇵🇹 flag portugal pt nation country banner
🇵🇼 flag palau pw nation country banner
🇵🇾 flag paraguay py nation country banner
🇶🇦 flag qatar qa nation country banner
🇷🇪 flag reunion réunion nation country banner
🇷🇴 flag romania ro nation country banner
🇷🇸 flag serbia rs nation country banner
🇷🇺 flag russia russian federation nation country banner
🇷🇼 flag rwanda rw nation country banner
🇸🇦 flag saudi arabia nation country banner
🇸🇧 flag solomon islands nation country banner
🇸🇨 flag seychelles sc nation country banner
🇸🇩 flag sudan sd nation country banner
🇸🇪 flag sweden se nation country banner
🇸🇬 flag singapore sg nation country banner
🇸🇭 flag st helena saint ascension tristan cunha nation country
🇸🇮 flag slovenia si nation country banner
🇸🇯 flag svalbard jan mayen
🇸🇰 flag slovakia sk nation country banner
🇸🇱 flag sierra leone nation country banner
🇸🇲 flag san marino nation country banner
🇸🇳 flag senegal sn nation country banner
🇸🇴 flag somalia so nation country banner
🇸🇷 flag suriname sr nation country banner
🇸🇸 flag south sudan sd nation country banner
🇸🇹 flag sao tome principe nation country banner
🇸🇻 flag el salvador nation country banner
🇸🇽 flag sint maarten dutch nation country banner
🇸🇾 flag syria syrian arab republic nation country banner
🇸🇿 flag eswatini sz nation country banner
🇹🇦 flag tristan da cunha
🇹🇨 flag turks caicos islands nation country banner
🇹🇩 flag chad td nation country banner
🇹🇫 flag french southern territories nation country banner
🇹🇬 flag togo tg nation country banner
🇹🇭 flag thailand th nation country banner
🇹🇯 flag tajikistan tj nation country banner
🇹🇰 flag tokelau tk nation country banner
🇹🇱 flag timor leste nation country banner
🇹🇲 flag turkmenistan nation country banner
🇹🇳 flag tunisia tn nation country banner
🇹🇴 flag tonga to nation country banner
🇹🇷 flag turkey nation country banner
🇹🇹 flag trinidad tobago nation country banner
🇹🇻 flag tuvalu nation country banner
🇹🇼 flag taiwan tw nation country banner
🇹🇿 flag tanzania united republic nation country banner
🇺🇦 flag ukraine ua nation country banner
🇺🇬 flag uganda ug nation country banner
🇺🇲 flag u s outlying islands
🇺🇳 flag united nations un banner
🇺🇸 flag united states america nation country banner
🇺🇾 flag uruguay uy nation country banner
🇺🇿 flag uzbekistan uz nation country banner
🇻🇦 flag vatican city nation country banner
🇻🇨 flag st vincent grenadines saint nation country banner
🇻🇪 flag venezuela ve bolivarian republic nation country banner
🇻🇬 flag british virgin islands bvi nation country banner
🇻🇮 flag u s virgin islands us nation country banner
🇻🇳 flag vietnam viet nam nation country banner
🇻🇺 flag vanuatu vu nation country banner
🇼🇫 flag wallis futuna nation country banner
🇼🇸 flag samoa ws nation country banner
🇽🇰 flag kosovo xk nation country banner
🇾🇪 flag yemen ye nation country banner
🇾🇹 flag mayotte yt nation country banner
🇿🇦 flag south africa nation country banner
🇿🇲 flag zambia zm nation country banner
🇿🇼 flag zimbabwe zw nation country banner
🏴󠁧󠁢󠁥󠁮󠁧󠁿 flag england english
🏴󠁧󠁢󠁳󠁣󠁴󠁿 flag scotland scottish
🏴󠁧󠁢󠁷󠁬󠁳󠁿 flag wales welsh
🥲 smiling face with tear sad cry pretend
🥸 disguised face pretent brows glasses moustache
🤌 pinched fingers size tiny small
🫀 anatomical heart health heartbeat
🫁 lungs breathe
🥷 ninja ninjutsu skills japanese
🤵‍♂️ man in tuxedo formal fashion
🤵‍♀️ woman in tuxedo formal fashion
👰‍♂️ man with veil wedding marriage
👰‍♀️ woman with veil wedding marriage
👩‍🍼 woman feeding baby birth food
👨‍🍼 man feeding baby birth food
🧑‍🍼 person feeding baby birth food
🧑‍🎄 mx claus christmas
🫂 people hugging care
🐈‍⬛ black cat superstition luck
🦬 bison ox
🦣 mammoth elephant tusks
🦫 beaver animal rodent
🐻‍❄️ polar bear animal arctic
🦤 dodo animal bird
🪶 feather bird fly
🦭 seal animal creature sea
🪲 beetle insect
🪳 cockroach insect pests
🪰 fly insect
🪱 worm animal
🪴 potted plant greenery house
🫐 blueberries fruit
🫒 olive fruit
🫑 bell pepper fruit plant
🫓 flatbread flour food
🫔 tamale food masa
🫕 fondue cheese pot food
🫖 teapot drink hot
🧋 bubble tea taiwan boba milk straw
🪨 rock stone
🪵 wood nature timber trunk
🛖 hut house structure
🛻 pickup truck car transportation
🛼 roller skate footwear sports
🪄 magic wand supernature power
🪅 pinata mexico candy celebration
🪆 nesting dolls matryoshka toy
🪡 sewing needle stitches
🪢 knot rope scout
🩴 thong sandal footwear summer
🪖 military helmet army protection
🪗 accordion music
🪘 long drum music
🪙 coin money currency
🪃 boomerang weapon
🪚 carpentry saw cut chop
🪛 screwdriver tools
🪝 hook tools
🪜 ladder tools
🛗 elevator lift
🪞 mirror reflection
🪟 window scenery
🪠 plunger toilet
🪤 mouse trap cheese
🪣 bucket water container
🪥 toothbrush hygiene dental
🪦 headstone death rip grave
🪧 placard announcement
⚧️ transgender symbol lgbtq
🏳️‍⚧️ transgender flag lgbtq
😶‍🌫️ face in clouds shower steam dream
😮‍💨 face exhaling relieve relief tired sigh
😵‍💫 face with spiral eyes sick ill confused nauseous nausea
❤️‍🔥 heart on fire passionate enthusiastic
❤️‍🩹 mending heart broken bandage wounded
🧔‍♂️ man beard facial hair
🧔‍♀️ woman beard facial hair
🫠 melting face hot heat
🫢 face with open eyes and hand over mouth silence secret shock
🫣 face with peeking eye scared frightening embarrassing
🫡 saluting face respect salute
🫥 dotted line face invisible lonely isolation depression
🫤 face with diagonal mouth skeptic confuse frustrated indifferent
🥹 face holding back tears touched gratitude
🫱 rightwards hand palm offer
🫲 leftwards hand palm offer
🫳 palm down hand drop
🫴 palm up hand lift offer demand
🫰 hand with index finger and thumb crossed heart love money expensive
🫵 index pointing at the viewer you recruit
🫶 heart hands love appreciation support
🫦 biting lip flirt sexy pain worry
🫅 person with crown royalty power
🫃 pregnant man baby belly
🫄 pregnant person baby belly
🧌 troll mystical monster
🪸 coral ocean sea reef
🪷 lotus flower calm meditation
🪹 empty nest bird
🪺 nest with eggs bird
🫘 beans food
🫗 pouring liquid cup water
🫙 jar container sauce
🛝 playground slide fun park
🛞 wheel car transport
🛟 ring buoy life saver preserver
🪬 hamsa religion protection
🪩 mirror ball disco dance party
🪫 low battery drained dead
🩼 crutch accessibility assist
🩻 x-ray skeleton medicine
🫧 bubbles soap fun carbonation sparkling
🪪 identification card document
🟰 heavy equals sign math