cleandatabase = true

just_chat = false

if cleandatabase
  puts "Cleaning Database..."
  User.destroy_all unless just_chat
  Photo.destroy_all unless just_chat
  Customer.destroy_all unless just_chat
  Staff.destroy_all unless just_chat
  QuestionAnswer.destroy_all
  Answer.destroy_all
  Question.destroy_all
end

unless just_chat
  USERS = [
    {email: "rayancdc@gmail.com", password: "hortatech", admin: true},
    ]

  USERS.each do |user_params|
    User.create(user_params)
  end

  puts "Creating new customers..."
  Customer.create!(name: "The Bike Culture",
                  insta_text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  fb_url: "https://www.facebook.com/TheBikeCulture/",
                  insta_url: "https://www.instagram.com/thebikeculture/",
                  site_url: "https://thebikeculture.com/")
  Customer.create!(name: "Uliving",
                  insta_text: "Mussum Ipsum, cacilds vidis litro abertis. Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis.",
                  fb_url: "https://www.facebook.com/ULIVINGBRASIL/",
                  insta_url: "https://www.instagram.com/ulivingbrasil/",
                  site_url: "https://uliving.com.br/")

  puts "Creating Photos..."

  tbcimg = Photo.create
  File.open('./app/assets/images/tbc-store1.jpg') do |media|
    tbcimg.upload = media
  end
  tbcimg.customer = Customer.first
  tbcimg.save

  tbcimg2 = Photo.create
  File.open('./app/assets/images/tbc-store2.jpg') do |media|
    tbcimg2.upload = media
  end
  tbcimg2.customer = Customer.first
  tbcimg2.save

  tbcimg3 = Photo.create
  File.open('./app/assets/images/tbc-store3.jpg') do |media|
    tbcimg3.upload = media
  end
  tbcimg3.customer = Customer.first
  tbcimg3.save

  ulivingimg = Photo.create
  File.open('./app/assets/images/uliving.jpg') do |media|
    ulivingimg.upload = media
  end
  ulivingimg.customer = Customer.last
  ulivingimg.save

  ulivingimg2 = Photo.create
  File.open('./app/assets/images/uliving2.jpg') do |media|
    ulivingimg2.upload = media
  end
  ulivingimg2.customer = Customer.last
  ulivingimg2.save

  ulivingimg3 = Photo.create
  File.open('./app/assets/images/uliving3.jpg') do |media|
    ulivingimg3.upload = media
  end
  ulivingimg3.customer = Customer.last
  ulivingimg3.save

  puts "You have #{Customer.count} customers."

  puts "Creating Staff..."

  STAFF = [
    {name: "Riza Braga", image: "riza.jpeg",role: "CEO", quote: "Fusqueira Influencer Profissional"},
    {name: "Rayan Castro", image: "rayan.jpeg", role: "CTO", quote: "Insira seu quote aqui."},
    {name: "Mauricio Hamaji", image: "hamaji.jpeg",role: "Dev", quote: "42"},
    {name: "Bruna Corrêa", image: "bruna.jpeg", role: "Sales", quote: "Comida? Quero. Só tira o feijão que sou SUPER alérgica."},
    {name: "Davis JR", image: "davis.jpeg",role: "Dev", quote: "Pode dar merge na branch, confia Reinaldo"},
    {name: "Reinaldo Luiz", image: 'reinaldo.jpeg', role: "UX/UI", quote: "Ué, pq o modal tá quebrado? Cade a branch"},
  ]

  STAFF.each do |staff_params|
    staff = Staff.new(staff_params)
    staff_photo = './app/assets/images/' + staff_params[:image]
    File.open(staff_photo) do |image|
      staff.image = image
    end
    staff.save
  end
end

puts "Generating questions and answers"

start = Question.create({typed_texts: [
  "Olá!^1000 Quanto tempoo",
  "Olá! Parece que é sua primeira vez por aqui!^1000
  \n Vamos nos conhecer melhor?^1000
Meus amigos falam que eu sou uma excelente ouvinte,^500 então me fale de vocsf",
  "Olá! Parece que é sua primeira vez por aqui!
  \n Vamos nos conhecer melhor?
Meus amigos falam que eu sou uma excelente ouvinte, então me fale de você, que jájá eu me apresento!^1000
\n
Qual desses você acha mais importante em uma pessoa??"
]})

dedicação = Answer.new(text: "Dedicação")
File.open('./app/assets/images/dedicacao.jpg') do |file|
  dedicação.image = file
end
dedicação.save

alegria = Answer.new(text: "Alegria")
File.open('./app/assets/images/alegria.jpg') do |file|
  alegria.image = file
end
alegria.save

inteligencia = Answer.new(text: "Inteligencia")
File.open('./app/assets/images/inteligencia.jpg') do |file|
  inteligencia.image = file
end
inteligencia.save

start.assign_answers([dedicação, alegria, inteligencia])


q_alegria = Question.create(typed_texts: [
  "Ahh, minha favorita!^1000 Para ser sempre alegres precisamos ser leves né?"
])

alegria.next_question = q_alegria
alegria.save

q_dedicação = Question.create(typed_texts: [
  "Resiliência é a chave!^1000 Eu gosto sempre de me dedicar ao máximo para todos os meus projetos!"
])

dedicação.next_question = q_dedicação
dedicação.save

q_inteligencia = Question.create(typed_texts: [
  "É essencial para resolver problemas de maneira assertiva!!^1000 Nada como pensar fora da caixa!"
])

inteligencia.next_question = q_inteligencia
inteligencia.save


certeza = Answer.new(text: "Com certeza!")
File.open('./app/assets/images/sim.jpg') do |file|
  certeza.image = file
end
certeza.save

[q_alegria, q_dedicação, q_inteligencia].each do |question|
  question.question_answers.build(answer: certeza).save
end


horas_livres = Question.create(typed_texts: [
  "Agora me conta, o que você mais gosta de fazer nas suas horas livres?"
])

certeza.next_question = horas_livres
certeza.save

netflix = Answer.new(text: "Netflix")
File.open('./app/assets/images/netflix_2.jpg') do |file|
  netflix.image = file
end
netflix.save

balada = Answer.new(text: "Balada")
File.open('./app/assets/images/balada.jpg') do |file|
  balada.image = file
end
balada.save

estudar = Answer.new(text: "Estudar")
File.open('./app/assets/images/estudar.png') do |file|
  estudar.image = file
end
estudar.save

horas_livres.assign_answers([netflix, balada, estudar])

rapid_round = Question.create(typed_texts: [
  "Não da pra ficar sem né?^1000\n\n

  Agora bora uma rodada rápida de sim ou não?^1000 Se joga!"
])

[netflix, balada, estudar].each do |answer|
  answer.next_question = rapid_round
  answer.save
end

bora = Answer.new(text: "Bora")
File.open('./app/assets/images/bora.jpg') do |file|
  bora.image = file
end

rapid_round.assign_answers([bora])

rr1 = Question.create(typed_texts: [
  "Eu gosto de todo mundo que eu conheço."
])
bora.next_question = rr1
bora.save


sim = Answer.new(text: "Sim")
File.open('./app/assets/images/yep.jpg') do |file|
  sim.image = file
end
sim.save

nope = Answer.new(text: "Não")
File.open('./app/assets/images/nope.jpg') do |file|
  nope.image = file
end
nope.save

rr1.assign_answers([sim, nope])

rr2 = Question.create(typed_texts: [
  "Já plantei um pé de macon",
  "Já plantei um pé de feijão no algodão."
])

[sim, nope].each do |answer|
  answer.next_question = rr2
  answer.save
end

sim = Answer.new(text: "Sim")
File.open('./app/assets/images/yep.jpg') do |file|
  sim.image = file
end
sim.save

nope = Answer.new(text: "Não")
File.open('./app/assets/images/nope.jpg') do |file|
  nope.image = file
end
nope.save

rr2.assign_answers([sim, nope])

rr3 = Question.create(typed_texts: [
  "Brigadeiro é melhor do que sorvete."
])

[sim, nope].each do |answer|
  answer.next_question = rr3
  answer.save
end

sim = Answer.new(text: "Sim")
File.open('./app/assets/images/yep.jpg') do |file|
  sim.image = file
end
sim.save

nope = Answer.new(text: "Não")
File.open('./app/assets/images/nope.jpg') do |file|
  nope.image = file
end
nope.save

rr3.assign_answers([sim, nope])


final = Question.create(typed_texts: [
  "Ufa! Agora que já nós conhecemos melhor, vou te mostrar um pouquinho do que eu faço!"
])

[sim, nope].each do |answer|
  answer.next_question = final
  answer.save
end

# Conhecer a horta
horta = Answer.new(text: "Conhecer a Horta", final_path: '/')
File.open('./app/assets/images/horta.jpg') do |file|
  horta.image = file
end
horta.save

reset = Answer.new(text: "Começar de novo!")
File.open('./app/assets/images/reset.jpg') do |file|
  reset.image = file
end
reset.next_question = start
reset.save

final.assign_answers([horta, reset])

puts "Chat created with #{Question.count} questions and #{Answer.count} answers!!"







# betina = Question.create(typed_texts: [ 'Oi, meu nome é <strong>Betina</strong>.^1000 Eu tenho 22 anos e um milhão',
#           'Oi, meu nome é <strong>Betina</strong>. Eu tenho 22 anos e um App para você.^1000 Qual a primeira coisa que você pensa quando falam em <i>UX</i>?^1000',
#         ])

# ux = Question.create(typed_texts: ['UX é o design da experiencia do usuário na sua plataforma,^500 ou seja,^500 o mapeamento de como podemos trazer uma experiencia F*DA para seu lead.^1000 '])

# quero = Answer.new(text: "Quero", final_path: '/')
# File.open('./app/assets/images/food.jpg') do |file|
#   quero.image = file
# end
# quero.save

# que = Answer.new(text: "Ainda não entendi", next_question: ux )
# File.open('./app/assets/images/question.jpg') do |file|
#   que.image = file
# end
# que.save

# betina.question_answers.build(answer: quero).save
# betina.question_answers.build(answer: que).save

# ux.question_answers.build(answer: que).save