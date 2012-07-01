namespace :db do
  desc "Fill database with sample data"
  
  def randomDate(params={})
    years_back = params[:year_range] || 5
    latest_year  = params [:year_latest] || 0
    year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
    month = (rand * 12).ceil
    day = (rand * 31).ceil
    series = [date = Time.local(year, month, day)]
    if params[:series]
      params[:series].each do |some_time_after|
        series << series.last + (rand * some_time_after).ceil
      end
      return series
    end
    date
  end
  
  task populate: :environment do
    # Client.create!(name: "Example User",
    #                  email: "example@railstutorial.org",
    #                  password: "foobar",
    #                  password_confirmation: "foobar")
    99.times do |n|
      firstname  = Faker::Name.first_name
      lastname  = Faker::Name.last_name
      birthdate  = randomDate(:year_range => 60, :year_latest => 22),
      title  = Faker::Name.prefix
      
      
      # email = "example-#{n+1}@railstutorial.org"
      # password  = "password"
      Client.create!(firstname: firstname,
                   lastname: lastname,
                   birthdate: birthdate,
                   title: title)
    end
    
    # now populate transactions
     clients = Client.all(limit: 5)
     10.times do |n|
        
        transactiontype  = 'treatment'
        date  = '1-Jan_2011',
        location  = 'rooms'
        cost="10"


        # email = "example-#{n+1}@railstutorial.org"
        # password  = "password"
       clients.each do |client|
         
        client.transactions.create!(
                     transactionType: transactiontype,
                     date: date,
                     location: location,
                     price: cost)
              end       
                     # users = User.all(limit: 6)
                         # 50.times do
                           # content = Faker::Lorem.sentence(5)
                           # users.each { |user| user.microposts.create!(content: content) }
                         # end
                     
                     
      end
  end
  
end