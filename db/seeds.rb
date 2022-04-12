# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

Recommendation.destroy_all
Restaurantrecom.destroy_all
Movie.destroy_all
Bookrecom.destroy_all
Book.destroy_all
Podcastrecom.destroy_all
Podcast.destroy_all
Restaurantrecom.destroy_all
User.destroy_all
Restaurant.destroy_all

puts "creating users"
valentine = User.create(nickname: "valou", email: "valentine.fouche@hotmail.fr", password: "qwerty")
alexandru = User.create(nickname: "alex", email: "alexandru.rebenciuc@hotmail.fr", password: "qwerty")
ingo = User.create(nickname: "ing", email: "ingo.knorr@hotmail.fr", password: "qwerty")
lulu = User.create(nickname: "lulu", email: "eva.lampin@hotmail.fr", password: "qwerty")

puts "creating movies with API"
url = "https://imdb-api.com/en/API/Top250Movies/#{ENV['IMDB_API_KEY']}"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies["items"].each do |movie|
  Movie.create(title: movie["title"], director: movie["crew"], image_url: movie["image"], stream_options: "pas de stream pour l'instant" )
end

puts "creating 20 movies"
les_evades = Movie.create(title: "Les évadés", director: "Frank Darabont", image_url: "les-evades.jpg", stream_options: "Stream")
le_parrain = Movie.create(title: "Le parrain", director: "Francis Ford Coppola", image_url: "le-parrain.webp", stream_options: "Stream")
dark_knight = Movie.create(title: "The Dark Knight : Le Chevalier noir", director: "Christopher Nolan", image_url: "dark-knight.jpg", stream_options: "Stream")
douze_hommes = Movie.create(title: "12 Hommes en colère", director: "Sidney Lumet", image_url: "douze-hommes.jpg", stream_options: "Stream")
schindler = Movie.create(title: "La liste de Schindler", director: "Steven Spielberg", image_url: "schindler.jpg", stream_options: "Stream")
peril_jeune = Movie.create(title: "Le Péril jeune", image_url: "peril-jeune.jpg")
les_oiseaux = Movie.create(title: "Les Oiseaux", image_url: "les-oiseaux.jpg")
le_sens_de_la_fete = Movie.create(title: "Le Sens de la fête", image_url: "le-sens-de-la-fete.jpg")
nos_jours_heureux = Movie.create(title: "Nos jours heureux", image_url: "nos-jours-heureux.jpg")
la_belle_verte = Movie.create(title: "La Belle Verte", image_url: "la-belle-verte.jpg")
intouchables = Movie.create(title: "Intouchables", image_url: "intouchables.jpg")
avatar = Movie.create(title: "Avatar", image_url: "avatar.jpg")
ensemble_cest_tout = Movie.create(title: "Ensemble c'est tout", image_url: "ensemble-cest-tout.jpg")
la_panthere_des_neiges = Movie.create(title: "La Panthère des Neiges", image_url: "la-panthere-des-neiges.jpg")
les_infiltres = Movie.create(title: "Les Inflitrés", image_url: "les-infiltres.jpg")
mr_nobody = Movie.create(title: "Mr Nobody", image_url: "mr-nobody.jpg")
orgueil_prejuges = Movie.create(title: "Orgueil et Préjugés", image_url: "orgueil-prejuges.jpg")
lol = Movie.create(title: "LOL", image_url: "lol.jpg")
peau_d_ane = Movie.create(title: "Peau d'Âne", image_url: "peau-d-ane.jpg")
parapluies_cherbourg = Movie.create(title: "Les Parapluies de Cherbourg", image_url: "parapluies-cherbourg.jpg")

puts "creating movie recommandations de valou"
Recommendation.create(friend: "alex", comment: "film conseillé quand nous avons mangé de la socca à nice, film d'action pleins de suspense", searched: false, viewed: false, user_id: valentine.id, movie_id: dark_knight.id)
Recommendation.create(friend: "ing", comment: "film sur la seconde guerre mondial, attention un peu triste donc à ne pas regarder en cas de coup de blues", searched: false, viewed: false, user_id: valentine.id, movie_id: schindler.id)
Recommendation.create(friend: "lulu", comment: "film avec pleins de mafieux, action garantie ! Ne pas regarder avec les enfants", searched: false, viewed: false, user_id: valentine.id, movie_id: le_parrain.id)
Recommendation.create(friend: "alex", comment: "Un grand classic qu'Alexandru m'a dit de ne pas louper !!!", searched: false, viewed: false, user_id: valentine.id, movie_id: les_evades.id)
Recommendation.create(friend: "valou", comment: "film d'epoque super top", searched: false, viewed: false, user_id: valentine.id, movie_id: douze_hommes.id)

puts "creating movie recommandations de ingo"
Recommendation.create(friend: "valou", comment: "blablabla", searched: false, viewed: false, user_id: ingo.id, movie_id: peril_jeune.id)
Recommendation.create(friend: "alex", comment: "blablabla", searched: false, viewed: false, user_id: ingo.id, movie_id: les_oiseaux.id)
Recommendation.create(friend: "alicechou", comment: "blablabla", searched: false, viewed: false, user_id: ingo.id, movie_id: le_sens_de_la_fete.id)
Recommendation.create(friend: "alex", comment: "blablabla", searched: false, viewed: false, user_id: ingo.id, movie_id: nos_jours_heureux.id)
Recommendation.create(friend: "lulu", comment: "blablabla", searched: false, viewed: false, user_id: ingo.id, movie_id: la_belle_verte.id)

puts "creating movie recommandations de lulu"
Recommendation.create(friend: "ing", comment: "blablabla", searched: false, viewed: false, user_id: lulu.id, movie_id: intouchables.id)
Recommendation.create(friend: "ing", comment: "blablabla", searched: false, viewed: false, user_id: lulu.id, movie_id: avatar.id)
Recommendation.create(friend: "doudou", comment: "blablabla", searched: false, viewed: false, user_id: lulu.id, movie_id: ensemble_cest_tout.id)
Recommendation.create(friend: "alex", comment: "blablabla", searched: false, viewed: false, user_id: lulu.id, movie_id: la_panthere_des_neiges.id)
Recommendation.create(friend: "clem", comment: "blablabla", searched: false, viewed: false, user_id: lulu.id, movie_id: les_infiltres.id)

puts "creating movie recommandations d'alex"
Recommendation.create(friend: "ing", comment: "blablabla", searched: false, viewed: false, user_id: alexandru.id, movie_id: mr_nobody.id)
Recommendation.create(friend: "ing", comment: "blablabla", searched: false, viewed: false, user_id: alexandru.id, movie_id: orgueil_prejuges.id)
Recommendation.create(friend: "doudou", comment: "blablabla", searched: false, viewed: false, user_id: alexandru.id, movie_id: lol.id)
Recommendation.create(friend: "lulu", comment: "blablabla", searched: false, viewed: false, user_id: alexandru.id, movie_id: peau_d_ane.id)
Recommendation.create(friend: "clem", comment: "blablabla", searched: false, viewed: false, user_id: alexandru.id, movie_id: parapluies_cherbourg.id)

puts "creating 4 books"
book1 = Book.create(title: "Le petit prince", image_url: "petit-prince.jpg")
book2 = Book.create(title: "David Copperfield", image_url: "david-copperfield.jpg")
book3 = Book.create(title: "Guerre et paix", image_url: "guerre-et-paix.jpg")
book4 = Book.create(title: "Anna Karenina", image_url: "anna-karenina.jpg")

# puts "creating 8 books"
# book1 = Book.create(title: "Le petit prince")
# book2 = Book.create(title: "David Copperfield")
# book3 = Book.create(title: "Guerre et paix")
# book4 = Book.create(title: "Anna Karenina")

# puts "creating 12 books"
# book1 = Book.create(title: "Le petit prince")
# book2 = Book.create(title: "David Copperfield")
# book3 = Book.create(title: "Guerre et paix")
# book4 = Book.create(title: "Anna Karenina")

# puts "creating 16 books"
# book1 = Book.create(title: "Le petit prince")
# book2 = Book.create(title: "David Copperfield")
# book3 = Book.create(title: "Guerre et paix")
# book4 = Book.create(title: "Anna Karenina")

puts "creating bookrecoms alex"
Bookrecom.create(friend: "valou", comment: "Le livre le plus connu de l'ecrivain Antoine de Saint-Exupery", searched: false, viewed: false, user_id: alexandru.id, book_id: book1.id)
Bookrecom.create(friend: "valou", comment: "Un roman qui raconte une enfance dure", searched: false, viewed: false, user_id: alexandru.id, book_id: book2.id)
Bookrecom.create(friend: "eva", comment: "Un livre classic russe", searched: false, viewed: false, user_id: alexandru.id, book_id: book3.id)
Bookrecom.create(friend: "ing", comment: "Une histoire d'amour avec une fin tragique", searched: false, viewed: false, user_id: alexandru.id, book_id: book4.id)

# puts "creating bookrecoms ingo"
# Bookrecom.create(friend: "valou", comment: "Le livre le plus connu de l'ecrivain Antoine de Saint-Exupery", searched: false, viewed: false, user_id: alexandru.id, book_id: book1.id)
# Bookrecom.create(friend: "valou", comment: "Un roman qui raconte une enfance dure", searched: false, viewed: false, user_id: alexandru.id, book_id: book2.id)
# Bookrecom.create(friend: "eva", comment: "Un livre classic russe", searched: false, viewed: false, user_id: alexandru.id, book_id: book3.id)
# Bookrecom.create(friend: "ing", comment: "Une histoire d'amour avec une fin tragique", searched: false, viewed: false, user_id: alexandru.id, book_id: book4.id)

# puts "creating bookrecoms lulu"
# Bookrecom.create(friend: "valou", comment: "Le livre le plus connu de l'ecrivain Antoine de Saint-Exupery", searched: false, viewed: false, user_id: alexandru.id, book_id: book1.id)
# Bookrecom.create(friend: "valou", comment: "Un roman qui raconte une enfance dure", searched: false, viewed: false, user_id: alexandru.id, book_id: book2.id)
# Bookrecom.create(friend: "eva", comment: "Un livre classic russe", searched: false, viewed: false, user_id: alexandru.id, book_id: book3.id)
# Bookrecom.create(friend: "ing", comment: "Une histoire d'amour avec une fin tragique", searched: false, viewed: false, user_id: alexandru.id, book_id: book4.id)

# puts "creating bookrecoms valou"
# Bookrecom.create(friend: "valou", comment: "Le livre le plus connu de l'ecrivain Antoine de Saint-Exupery", searched: false, viewed: false, user_id: alexandru.id, book_id: book1.id)
# Bookrecom.create(friend: "valou", comment: "Un roman qui raconte une enfance dure", searched: false, viewed: false, user_id: alexandru.id, book_id: book2.id)
# Bookrecom.create(friend: "eva", comment: "Un livre classic russe", searched: false, viewed: false, user_id: alexandru.id, book_id: book3.id)
# Bookrecom.create(friend: "ing", comment: "Une histoire d'amour avec une fin tragique", searched: false, viewed: false, user_id: alexandru.id, book_id: book4.id)

puts "creating 4 podcasts"
podcast1 = Podcast.create(title: "La cuisine italienne", image_url: "podcast.jpg")
podcast2 = Podcast.create(title: "Une histoire de la France", image_url: "podcast.jpg")
podcast3 = Podcast.create(title: "La musique des jeunes", image_url: "podcast.jpg")
podcast4 = Podcast.create(title: "La mode et les temps", image_url: "podcast.jpg")

# puts "creating 6 podcasts"
# podcast1 = Podcast.create(title: "La cuisine italienne")
# podcast2 = Podcast.create(title: "Une histoire de la France")

# puts "creating 8 podcasts"
# podcast1 = Podcast.create(title: "La cuisine italienne")
# podcast2 = Podcast.create(title: "Une histoire de la France")

puts "creating podcastrecoms alex"
Podcastrecom.create(friend: "alex", comment: "Des plats classics et modernes", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast1.id)
Podcastrecom.create(friend: "valentine", comment: "Des nouvelles perspectives sur des evenements anciens", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast2.id)
Podcastrecom.create(friend: "eva", comment: "Du bruits ou de la vrai musique", searched: false, viewed: false, user_id: ingo.id, podcast_id: podcast3.id)
Podcastrecom.create(friend: "ingo", comment: "Les gens sont influences vraiment par les vetements portes", searched: false, viewed: false, user_id: ingo.id, podcast_id: podcast4.id)

# puts "creating podcastrecoms ingo"
# Podcastrecom.create(friend: "alex", comment: "Des plats classics et modernes", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast1.id)
# Podcastrecom.create(friend: "valentine", comment: "Des nouvelles perspectives sur des evenements anciens", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast2.id)

# puts "creating podcastrecoms lulu"
# Podcastrecom.create(friend: "alex", comment: "Des plats classics et modernes", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast1.id)
# Podcastrecom.create(friend: "valentine", comment: "Des nouvelles perspectives sur des evenements anciens", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast2.id)

puts "creating 5 restaurants"
dipiu = Restaurant.create(title: "Di Piu", address: "87 quai des États-Unis, Nice, Alpes-Maritimes 06300, France")
lavoglia = Restaurant.create(title: "La Voglia", address: "2 rue Saint-François de Paule, Nice, Alpes-Maritimes 06300, France")
loupistou = Restaurant.create(title: "Lou Pistou", address: "4 Rue Raoul Bosio, Nice, Alpes-Maritimes 06300, France")
lesafari = Restaurant.create(title: "Le Safari", address: "1 cours Saleya, Nice, Alpes-Maritimes 06300, France")
lapetitemaison = Restaurant.create(title: "La Petite Maison", address: "11 rue Saint-Francois de Paule, Nice, Alpes-Maritimes 06300, France")

puts "creating restaurantrecoms alex"
Restaurantrecom.create(friend: "Ingo", comment: "Menu tres varie, il faut essayer", searched: false, viewed: false, user_id: valentine.id, restaurant_id: dipiu.id)
Restaurantrecom.create(friend: "Alex", comment: "Tres bonne cuisine, il ne faut pas rater", searched: false, viewed: false, user_id: valentine.id, restaurant_id: lavoglia.id)
Restaurantrecom.create(friend: "Eva", comment: "Prix eleves mais le menu merite", searched: false, viewed: false, user_id: valentine.id, restaurant_id: loupistou.id)
Restaurantrecom.create(friend: "George", comment: "Menu interessant et exotique", searched: false, viewed: false, user_id: ingo.id, restaurant_id: lesafari.id)
Restaurantrecom.create(friend: "Ingo", comment: "Restaurant tres connu dans le coeur de Nice", searched: false, viewed: false, user_id: ingo.id, restaurant_id: lapetitemaison.id)

puts "done"
