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
Restaurant.destroy_all
User.destroy_all


puts "creating users"
valentine = User.create(nickname: "valou", email: "valentine.fouche@hotmail.fr", password: "qwerty")
alexandru = User.create(nickname: "alex", email: "alexandru.rebenciuc@hotmail.fr", password: "qwerty")
ingo = User.create(nickname: "ing", email: "ingo.knorr@hotmail.fr", password: "qwerty")
lulu = User.create(nickname: "lulu", email: "eva.lampin@hotmail.fr", password: "qwerty")

# puts "creating movies with API"
# url = "https://imdb-api.com/en/API/Top250Movies/#{ENV['IMDB_API_KEY']}"
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)
# movies["items"].each do |movie|
#   Movie.create(title: movie["title"], director: movie["crew"], image_url: movie["image"], stream_options: "pas de stream pour l'instant" )
# end

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
Recommendation.create(friend: "ing", comment: "une bande d'ados à Paris en mai 68", searched: false, viewed: true, user_id: valentine.id, movie_id: peril_jeune.id)
Recommendation.create(friend: "alex", comment: "le meilleur Hitchcock", searched: false, viewed: false, user_id: valentine.id, movie_id: les_oiseaux.id)
Recommendation.create(friend: "clem", comment: "très drôle, beau casting français", searched: false, viewed: true, user_id: valentine.id, movie_id: le_sens_de_la_fete.id)
Recommendation.create(friend: "alex", comment: "film culte, avec Jean-Paul Roove, sur une colonie de vacances", searched: false, viewed: false, user_id: valentine.id, movie_id: nos_jours_heureux.id)
Recommendation.create(friend: "lulu", comment: "Un truc de mangeurs de graines :)", searched: false, viewed: true, user_id: valentine.id, movie_id: la_belle_verte.id)
# Recommendation.create(friend: "lulu", comment: "Scènes de natures à couper le souffle", searched: false, viewed: false, user_id: valentine.id, movie_id: la_panthere_des_neiges.id)

puts "creating movie recommandations de ingo"
Recommendation.create(friend: "alex", comment: "film conseillé quand nous avons mangé de la socca à nice, film d'action plein de suspense", searched: false, viewed: true, user_id: ingo.id, movie_id: dark_knight.id)
Recommendation.create(friend: "alicechou", comment: "film sur la seconde guerre mondiale, attention un peu triste donc à ne pas regarder en cas de coup de blues", searched: false, viewed: false, user_id: ingo.id, movie_id: schindler.id)
Recommendation.create(friend: "lulu", comment: "film avec plein de mafieux, action garantie ! Ne pas regarder avec les enfants", searched: false, viewed: false, user_id: ingo.id, movie_id: le_parrain.id)
Recommendation.create(friend: "alex", comment: "Un grand classique qu'Alexandru m'a dit de ne pas louper !!!", searched: false, viewed: false, user_id: ingo.id, movie_id: les_evades.id)
Recommendation.create(friend: "valou", comment: "film d'epoque super top", searched: false, viewed: true, user_id: ingo.id, movie_id: douze_hommes.id)

puts "creating movie recommandations de lulu"
Recommendation.create(friend: "ing", comment: "Une belle leçon de vie", searched: false, viewed: false, user_id: lulu.id, movie_id: intouchables.id)
Recommendation.create(friend: "ing", comment: "ça parle de grands hommes bleus...", searched: false, viewed: true, user_id: lulu.id, movie_id: avatar.id)
Recommendation.create(friend: "doudou", comment: "Tiré du roman de Gavalda, avec le beau Guillaume Canet", searched: false, viewed: false, user_id: lulu.id, movie_id: ensemble_cest_tout.id)
# Recommendation.create(friend: "alex", comment: "Scènes de natures à couper le souffle", searched: false, viewed: false, user_id: lulu.id, movie_id: la_panthere_des_neiges.id)
Recommendation.create(friend: "clem", comment: "Suspense insoutenable, avec DiCaprio et Matt Damon", searched: false, viewed: false, user_id: lulu.id, movie_id: les_infiltres.id)

puts "creating movie recommandations d'alex"
Recommendation.create(friend: "ing", comment: "à voir absolument", searched: false, viewed: true, user_id: alexandru.id, movie_id: mr_nobody.id, feedback_rating: 5)
Recommendation.create(friend: "ing", comment: "film dont on a parlé à la pause café, tiré de Jane Austeen", searched: false, viewed: false, user_id: alexandru.id, movie_id: orgueil_prejuges.id, feedback_rating: 4)
Recommendation.create(friend: "doudou", comment: "régression garantie", searched: false, viewed: true, user_id: alexandru.id, movie_id: lol.id, feedback_rating: 3)
Recommendation.create(friend: "lulu", comment: "à voir rien que pour les costumes", searched: false, viewed: false, user_id: alexandru.id, movie_id: peau_d_ane.id)
Recommendation.create(friend: "clem", comment: "un classique apparemment...", searched: false, viewed: false, user_id: alexandru.id, movie_id: parapluies_cherbourg.id)

puts "creating 14 books"
book1 = Book.create(title: "Le petit prince", image_url: "petit-prince.jpg")
book2 = Book.create(title: "David Copperfield", image_url: "david-copperfield.jpg")
book3 = Book.create(title: "Guerre et paix", image_url: "guerre-et-paix.jpg")
book4 = Book.create(title: "Anna Karenina", image_url: "anna-karenina.jpg")
belle_du_seigneur = Book.create(title: "Belle du Seigneur", image_url: "belle-du-seigneur.jpg")
autres_vies = Book.create(title: "D'autres vies que la mienne", image_url: "autres-vies.jpg")
la_recherche = Book.create(title: "À la recherche du temps perdu", image_url: "la-recherche.jpg")
trilogie = Book.create(title: "Trilogie new-yorkaise", image_url: "trilogie.jpg")
panthere = Book.create(title: "La Panthère des neiges", image_url: "panthere.jpg")
chemins_noirs = Book.create(title: "Sur les chemins noirs", image_url: "chemins-noirs.jpg")
usage_monde = Book.create(title: "L'Usage du monde", image_url: "usage-monde.jpg")
faust = Book.create(title: "Faust", image_url: "faust.jpg")
tintin = Book.create(title: "Tintin au Tibet", image_url: "tintin.jpg")
la_moustache = Book.create(title: "La Moustache", image_url: "la-moustache.jpg")

puts "creating bookrecoms alex"
Bookrecom.create(friend: "valou", comment: "Le livre le plus connu de l'écrivain Antoine de Saint-Exupery", searched: false, viewed: true, user_id: alexandru.id, book_id: book1.id, feedback_rating: 4)
Bookrecom.create(friend: "valou", comment: "Un roman qui raconte une enfance dure", searched: false, viewed: false, user_id: alexandru.id, book_id: book2.id)
Bookrecom.create(friend: "lulu", comment: "Un livre classique russe", searched: false, viewed: false, user_id: alexandru.id, book_id: book3.id)
Bookrecom.create(friend: "ing", comment: "Une histoire d'amour avec une fin tragique", searched: false, viewed: true, user_id: alexandru.id, book_id: book4.id, feedback_rating: 5)

puts "creating bookrecoms valou"
Bookrecom.create(friend: "lulu", comment: "La plus belle histoire d'amour, la plus belle littérature", searched: false, viewed: false, user_id: valentine.id, book_id: belle_du_seigneur.id)
Bookrecom.create(friend: "lulu", comment: "Super triste mais magnifique", searched: false, viewed: false, user_id: valentine.id, book_id: autres_vies.id)
Bookrecom.create(friend: "eva", comment: "Un monument. Dissection de l'âme humaine.", searched: false, viewed: true, user_id: valentine.id, book_id: la_recherche.id)
Bookrecom.create(friend: "ing", comment: "Mi-suspense, mi-chelou", searched: false, viewed: false, user_id: valentine.id, book_id: trilogie.id)

puts "creating bookrecoms lulu"
Bookrecom.create(friend: "alex", comment: "Un écrivain et un photographe à l'affût de la panthère des neiges", searched: true, viewed: false, user_id: lulu.id, book_id: panthere.id)
Bookrecom.create(friend: "ing", comment: "Tesson traverse la France sur les chemins oubliés", searched: false, viewed: true, user_id: lulu.id, book_id: chemins_noirs.id)
Bookrecom.create(friend: "eva", comment: "Je vais aimer, plein de nature", searched: false, viewed: false, user_id: lulu.id, book_id: usage_monde.id)

puts "creating bookrecoms ingo"
Bookrecom.create(friend: "valou", comment: "Super fun, à lire à la plage", searched: false, viewed: false, user_id: ingo.id, book_id: faust.id)
Bookrecom.create(friend: "valou", comment: "Un peu compliqué, à lire à tête reposée", searched: false, viewed: true, user_id: ingo.id, book_id: tintin.id)
Bookrecom.create(friend: "alicechou", comment: "Le livre qui a révélé Carrère", searched: false, viewed: false, user_id: ingo.id, book_id: la_moustache.id)

puts "creating 8 podcasts"
podcast1 = Podcast.create(title: "La cuisine italienne", image_url: "podcast.jpg")
podcast2 = Podcast.create(title: "Une histoire de la France", image_url: "podcast.jpg")
podcast3 = Podcast.create(title: "La musique des jeunes", image_url: "podcast.jpg")
podcast4 = Podcast.create(title: "La mode et les temps", image_url: "podcast.jpg")
podcast5 = Podcast.create(title: "Petit Bambou", image_url: "podcast.jpg")
podcast6 = Podcast.create(title: "Le masque et la plume", image_url: "podcast.jpg")
podcast7 = Podcast.create(title: "Sur les épaules de Darwin", image_url: "podcast.jpg")
podcast8 = Podcast.create(title: "Les baladeurs", image_url: "podcast.jpg")

puts "creating podcastrecoms alex"
Podcastrecom.create(friend: "ing", comment: "Des plats classiques et modernes", searched: false, viewed: false, user_id: alexandru.id, podcast_id: podcast1.id)
Podcastrecom.create(friend: "valou", comment: "Des nouvelles perspectives sur des événements anciens", searched: false, viewed: false, user_id: alexandru.id, podcast_id: podcast2.id)
Podcastrecom.create(friend: "lulu", comment: "Du bruit ou de la vraie musique", searched: false, viewed: true, user_id: alexandru.id, podcast_id: podcast3.id)
Podcastrecom.create(friend: "ing", comment: "Les gens sont influencés vraiment par les vêtements portés", searched: false, viewed: false, user_id: alexandru.id, podcast_id: podcast4.id)

puts "creating podcastrecoms valou"
Podcastrecom.create(friend: "alex", comment: "Pour méditer au quotidien", searched: false, viewed: true, user_id: valentine.id, podcast_id: podcast5.id)
Podcastrecom.create(friend: "lulu", comment: "Émission littéraire", searched: false, viewed: false, user_id: valentine.id, podcast_id: podcast6.id)

puts "creating podcastrecoms lulu"
Podcastrecom.create(friend: "alex", comment: "Philo", searched: false, viewed: true, user_id: lulu.id, podcast_id: podcast7.id)
Podcastrecom.create(friend: "ing", comment: "Trop bien pour voyager juste avec ses écouteurs", searched: false, viewed: false, user_id: lulu.id, podcast_id: podcast8.id)

puts "creating 5 restaurants"
Restaurant.create(title: "Di Piu", address: "87 quai des États-Unis, Nice, Alpes-Maritimes 06300, France", friend: "ing", comment: "Menu tres varie, il faut essayer", latitude: 43.6951577, longitude: 7.2727178, searched: false, viewed: false, user_id: lulu.id)
Restaurant.create(title: "La Voglia", address: "2 rue Saint-François de Paule, Nice, Alpes-Maritimes 06300, France", friend: "alex", comment: "Tres bonne cuisine, il ne faut pas rater", latitude: 43.6956094, longitude: 7.2733957, searched: false, viewed: false, user_id: lulu.id)
Restaurant.create(title: "Lou Pistou", address: "4 Rue Raoul Bosio, Nice, Alpes-Maritimes 06300, France", friend: "lulu", comment: "Prix eleves mais le menu merite", latitude: 43.6965503, longitude: 7.273115, searched: false, viewed: false, user_id: valentine.id)
Restaurant.create(title: "Le Safari", address: "1 cours Saleya, Nice, Alpes-Maritimes 06300, France", friend: "George", comment: "Menu interessant et exotique", latitude: 43.6956889, longitude: 7.2760526, searched: false, viewed: false, user_id: ingo.id)
Restaurant.create(title: "La Petite Maison", address: "11 rue Saint-Francois de Paule, Nice, Alpes-Maritimes 06300, France", friend: "Eva", comment: "Restaurant tres connu dans le coeur de Nice", latitude: 43.6957805, longitude: 7.2705091, searched: false, viewed: false, user_id: ingo.id)

puts "creating more restos"

Restaurant.create(title: "La Socca d'or", address: "45 Rue Bonaparte, 06300 Nice, France", friend: "ing", comment: "Meilleure socca de Nice !", latitude: 43.70069810074462, longitude: 7.285658926705328, searched: false, viewed: false, user_id: valentine.id)
Restaurant.create(title: "Au Moulin Enchanté", address: "1 Rue Barberis, 06300 Nice, France", friend: "Evachou", comment: "Bon menu du midi, proprio très sympa", latitude: 43.705634164327165, longitude: 7.282543513211083, searched: false, viewed: false, user_id: valentine.id)
Restaurant.create(title: "Le Chabrol", address: "12 Rue Bavastro, 06300 Nice, France", friend: "lulu", comment: "Top pour un resto en amoureux", latitude: 43.699872138109214, longitude: 7.285227055540523, searched: false, viewed: false, user_id: valentine.id)
Restaurant.create(title: "La Cave de Papa", address: "9 Rue Bonaparte, 06300 Nice, France", friend: "lulu", comment: "Planches et bon vin", latitude: 43.70098769483074, longitude: 7.282368186505601, searched: false, viewed: false, user_id: valentine.id)
Restaurant.create(title: "Comme un Dimanche", address: "10 Rue Lascaris, 06300 Nice, France", friend: "alex", comment: "Super brunch, super déco", latitude: 43.699959941485346, longitude: 7.284981755540511, searched: false, viewed: false, user_id: valentine.id)

puts "done"
