# Procfile
#web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
