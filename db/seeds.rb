# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recommendation.destroy_all
MoviesList.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

puts "creating users"
# je creer des users
valentine = User.create(nickname: "valou", email: "valentine.fouche@hotmail.fr", password: "qwerty")
alexandru = User.create(nickname: "alex", email: "alexandru.rebenciuc@hotmail.fr", password: "qwerty")
ingo = User.create(nickname: "ing", email: "ingo.knorr@hotmail.fr", password: "qwerty")
eva = User.create(nickname: "vavou", email: "eva.lampin@hotmail.fr", password: "qwerty")

puts "creating lists"
# je creer lists
valentine_list = List.create(name: "Valou's list", user_id: valentine.id)
alexandru_list = List.create(name: "Alex's list", user_id: alexandru.id)
ingo_list = List.create(name: "Ing's list", user_id: ingo.id)
eva_list = List.create(name: "Vavou's list", user_id: eva.id)

puts "creating movies"
# je creer des movies
les_evades = Movie.create(title: "Les évadés", director: "Frank Darabont", image_url: "../assets/images/les-evades.jpeg", stream_options: "Stream")
le_parrain = Movie.create(title: "Le parrain", director: "Francis Ford Coppola", image_url: "../assets/images/le-parrain.webp", stream_options: "Stream")
dark_knight = Movie.create(title: "The Dark Knight : Le Chevalier noir", director: "Christopher Nolan", image_url: "..//assets/images/les-evades.jpeg", stream_options: "Stream")
douze_hommes = Movie.create(title: "12 Hommes en colère", director: "Sidney Lumet", image_url: "../assets/images/douze-homme.jpeg", stream_options: "Stream")
schindler = Movie.create(title: "La liste de Schindler", director: "Steven Spielberg", image_url: "../assets/images/schindler.jpeg", stream_options: "Stream")

puts "creating movies lists"
# je creer des movies lists
valentine_movies_list = MoviesList.create(list_id: valentine_list.id, movie_id: les_evades.id)
alexandru_movies_list = MoviesList.create(list_id: alexandru_list.id, movie_id: le_parrain.id)
ingo_movies_list = MoviesList.create(list_id: ingo_list.id, movie_id: dark_knight.id)
eva_movies_list = MoviesList.create(list_id: eva_list.id, movie_id: schindler.id)

puts "creating recommandations"
# je creer des recommandations
recommandation_val_1 = Recommendation.create!(friend: "Alexandru", added_on: Time.now, comment: "film conseillé quand nous avons mangé de la socca à nice, film d'action pleins de suspense", searched: false, viewed: false, feedback_content: "super bien", feedback_rating: 5, user_id: valentine.id, movie_id: dark_knight.id)

puts "done"
