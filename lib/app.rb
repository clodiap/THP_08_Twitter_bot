require 'dotenv'# Appelle la gem Dotenv
require 'twitter' # appelle la gem twitter

Dotenv.load # Ceci appelle le fichier .env grâce à la gem Dotenv, et importe toutes les données enregistrées dans un hash ENV

# quelques lignes qui appellent les clés d'API de ton fichier .env
def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

def send_tweet(array, message)
    array.each do |i|
    login_twitter.update("@#{i}, #{message}")
  end
end

send_tweet(["dany_about", "hsravo", "Arbousier5", "NguyenJulien5", "the_hacking_pro"], "Coucou la team À l'arrache :) ")

# login_twitter.update("@NguyenJulien5, coucou on tweet depuis Ruby @the_hacking_pro")

# ligne qui permet de tweeter sur ton compte
# login_twitter.update('Mon 2ème tweet en Ruby !!!! @the_hacking_pro')

# the_team = ["dany_about", "hsravo", "Arbousier5", "NguyenJulien5"]

# the_team.each do |i|
#   login_twitter.follow(i)
# end


# ligne qui permet de follower un compte
# login_twitter.follow("Arbousier5")

#
# login_twitter.friends("Arbousier")



# Il est ensuite très facile d'appeler les données du fichier .env, par exemple là je vais afficher le contenu de la clé TWITTER_API_SECRET
# puts ENV['TWITTER_API_SECRET']

# tout est stocké dans un hash qui s'appelle ENV. Tu peux le regarder en faisant :
# puts ENV
